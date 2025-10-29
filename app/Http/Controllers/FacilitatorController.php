<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Event;
use App\Models\License;
use App\Jobs\SendEmailJob;
use App\Models\Facilitator;
use App\Models\Participant;
use Illuminate\Support\Str;
use App\Models\Organization;
use Illuminate\Http\Request;
use App\Jobs\SendRejectEmailJob;
use App\Mail\FacilitatePassword;
use App\Mail\FacilitatePassport;
use App\Models\EventFacilitator;
use App\Mail\FacilitatorPassword;
use App\Jobs\SendApprovedEmailJob;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use App\Jobs\SendFacilitatorPasswordJob;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rules\Password as RulesPassword;
use App\Http\Controllers\Api\BaseController as BaseController;

class FacilitatorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $facilitators = Facilitator::where(['is_archive' => 'false', 'Status' => 1])->with('organization')->orderBy('id', 'DESC')->get();
        return view('front.facilitator.view', compact('facilitators'));
    }
    public function trash()
    {
        $facilitators = Facilitator::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.facilitator.trash', compact('facilitators'));
    }
    public function restore($id)
    {
        $facilitators_restore = Facilitator::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $facilitators = Facilitator::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.facilitator.archive', compact('facilitators'));
    }
    public function toggleArchive($id)
    {
        $facilitators = Facilitator::find($id);
        if ($facilitators->is_archive == 'true') {
            $facilitators->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $facilitators->is_archive = 'true';
            $mxg = "Archive";
        }
        $facilitators->save();
        return back()->with('success', 'Facilitator ' . $mxg . ' Successfully');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function add(Request $request)
    {
        // dd($request->all());
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'organization' => 'required',
                'manage_participants' => 'required',
                // 'events' => 'required',
                'first_name' => 'required|max:50',
                'last_name' => 'required|max:50',
                'email' => 'required|unique:facilitators|email|max:255',
                'show_video' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $find_licence = License::where(['OrganizationID'=>$request->organization,'is_expire'=>'false'])->with('license_type')->first();
            if($find_licence == null){
                return back()->with('error','Liscense not found');
            }
            $facilitator = Facilitator::where('OrganizationID',$request->organization)->get();
            if($find_licence->license_type->Facilitators <= count($facilitator)){
                return back()->with('error','Facilitator Quota is Exceeded');
            }
            // dd($request->all());
            $password = Str::random(10);
            $facilitator = new Facilitator;
            $facilitator->OrganizationID = $request->organization;
            $facilitator->ManageParticipants = $request->manage_participants;
            $facilitator->IsActive = 1;
            $facilitator->Firstname = $request->first_name;
            $facilitator->Lastname = $request->last_name;
            $facilitator->Email = $request->email;
            $facilitator->Password = Hash::make($password);
            $facilitator->show_video = $request->show_video;
            $facilitator->S8S_ID = Auth::user()->id;
            $facilitator->CreatedBy = Auth::user()->id;
            $facilitator->save();
            if (isset($request->events)) {
                foreach ($request->events as $event) {
                    $events = new EventFacilitator;
                    $events->FacilitatorID = $facilitator->id;
                    $events->EventID = $event;
                    $events->save();
                }
            }
            if ($request->manage_participants == 1) {
                $user = new User;
                $user->name = $request->first_name . ' ' . $request->last_name;
                $user->email = $request->email;
                $user->password = Hash::make($password);
                $user->role_id = 8;
                $user->CreatedBy = Auth::user()->id;
                $user->save();
            }

            $details = [
                'email' => $request->email,
                'facilitator_password' => $password
            ];
            // $email = new FacilitatorPassword($details);
            // dispatch(new SendFacilitatorPasswordJob($details));
            Mail::to($request->email)->send(new FacilitatePassport($details));
            // dd($details);
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Facilitator Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\facilitator  $facilitator
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $facilitator_edit = Facilitator::where('id', $request->id)->first();
        $events_facilitator = EventFacilitator::where('FacilitatorID', $facilitator_edit->id)->orderBy('id', 'DESC')->get();
        $events = Event::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.facilitator.add', compact('facilitator_edit', 'organizations', 'events', 'events_facilitator'));
    }
    public function showForm(Request $request)
    {
        $events = Event::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.facilitator.add', compact('organizations', 'events'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Facilitator  $facilitator
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Facilitator $facilitator)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'organization' => 'required',
                // 'manage_participants' => 'required_if:manage_participants,==,0',
                // 'events' => 'required',
                'first_name' => 'required|max:50',
                'last_name' => 'required|max:50',
                'show_video' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;
            $facilitator_update = Facilitator::find($id);
            $org_find = Organization::where('id',$facilitator_update->OrganizationID)->first();
            if($org_find->id != $request->organization){
                $participants = Participant::where('FacilitatorID',$facilitator_update->id)->first();
                if($participants){
                    return back()->with('error','Can\'t Update Facilitator due to Participant');
                }
            }
            $find_licence = License::where(['OrganizationID'=>$request->organization,'is_expire'=>'false'])->with('license_type')->first();
            if($find_licence == null){
                return back()->with('error','Liscense not found');
            }
            $facilitator = Facilitator::where('OrganizationID',$request->organization)->get();
            if($facilitator_update->OrganizationID != $request->organization && $find_licence->license_type->Facilitators <= count($facilitator)){
                return back()->with('error','Facilitator Quota is Exceeded');
            }

            $facilitator_update->OrganizationID = $request->organization;
            if (isset($request->manage_participants) && $request->manage_participants != 1) {
                $facilitator_update->ManageParticipants = $request->manage_participants;
            }
            $facilitator_update->IsActive = 1;
            $facilitator_update->Firstname = $request->first_name;
            $facilitator_update->Lastname = $request->last_name;
            $facilitator_update->Email = $request->email;
            $facilitator_update->show_video = $request->show_video;
            $facilitator_update->S8S_ID = Auth::user()->id;
            $facilitator_update->UpdatedBy = Auth::user()->id;
            $facilitator_update->save();
            $event_delete = EventFacilitator::where('FacilitatorID', $id)->delete();
            if (isset($request->events)) {
                foreach ($request->events as $event) {
                    $events = new EventFacilitator;
                    $events->FacilitatorID = $id;
                    $events->EventID = $event;
                    $events->save();
                }
            }
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('facilitator.view')->with('success', 'Facilitator Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\facilitator  $facilitator
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $participants = Participant::where('FacilitatorID', $id)->get();
        if (count($participants) != 0) {
            return back()->with('error', 'Participants of this Facilitator Exist');
        }
        $facilitator_delete = Facilitator::find($id)->delete();
        return back()->with('success', 'Facilitator Trash Successfully');
    }

    public function bulkDelete(Request $request)
    {

        $rules = [
            'bulk_action' => 'required',
        ];

        $customMessages = [
            'required' => 'Select Atleast One Record'
        ];

        $this->validate($request, $rules, $customMessages);

        foreach ($request->bulk_action as $id) {
            $facilitator_bulk_delete = Facilitator::find($id)->delete();
        }
        return back()->with('success', 'Facilitators Deleted Successfully');
    }
    public function logout(Request $request)
    {
        Auth::logout();
        return redirect('/login');
    }
    public function find_event(Request $request)
    {
        $events = Event::where(['is_archive' => 'false', 'Status' => 1, 'OrganizationID' => $request->data_val])->orderBy('Name', 'ASC')->get();
        return response()->json(['data' => $events]);
    }
}
