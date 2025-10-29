<?php

namespace App\Http\Controllers;

use App\Models\LicenseType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class licenseTypeController extends Controller
{
    public function index()
    {
        $license_types = LicenseType::where(['is_archive' => 'false', 'Status' => 1])->OrderBy('id','DESC')->get();
        return view('front.license_type.view', compact('license_types'));
    }
    public function trash()
    {
        $license_types = LicenseType::onlyTrashed()->get();
        return view('front.license_type.trash', compact('license_types'));
    }
    public function restore($id)
    {
        $license_types_restore = LicenseType::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $license_types = LicenseType::where('is_archive', 'true')->get();
        return view('front.license_type.archive', compact('license_types'));
    }
    public function toggleArchive($id)
    {
        $license_types = LicenseType::find($id);
        if ($license_types->is_archive == 'true') {
            $license_types->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $license_types->is_archive = 'true';
            $mxg = "Archive";
        }
        $license_types->save();
        return back()->with('success', 'License Type ' . $mxg . ' Successfully');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function add(Request $request)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|max:150',
                'facilitators' => 'required|max:10',
                'participants' => 'required|max:10',
                // 'durationDays' => 'required|max:10',
                'subscription' => 'required',
                'number_of_devices_login' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $license_type = new LicenseType;
            $license_type->Name = $request->name;
            $license_type->Subscription = $request->subscription;
            $license_type->Facilitators = $request->facilitators;
            $license_type->Participants = $request->participants;
            // $license_type->DurationDays = $request->durationDays;
            $license_type->number_of_devices_login = $request->number_of_devices_login;
            $license_type->IsActive = 1;
            $license_type->CreatedBy = Auth::user()->id;
            $license_type->save();

        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'License Type Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\LicenseType  $license_type
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $license_type_edit = LicenseType::where('id', $request->id)->first();
        return view('front.license_type.add', compact('license_type_edit'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\LicenseType  $license_type
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, LicenseType $license_type)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|max:150',
                'facilitators' => 'required|max:10',
                'participants' => 'required|max:10',
                // 'durationDays' => 'required|max:10',
                'subscription' => 'required',
                'number_of_devices_login' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $id = $request->id;
            $license_type_update = LicenseType::find($id);
            // if($license_type_update->Facilitators > $request->facilitators){
            //     return back()->with('error','Facilitator should not be less than assigned value');
            // }
            // if($license_type_update->Participants > $request->participants){
            //     return back()->with('error','Participant should not be less than assigned value');
            // }
            $license_type_update->Name = $request->name;
            $license_type_update->Subscription = $request->subscription;
            $license_type_update->Facilitators = $request->facilitators;
            $license_type_update->Participants = $request->participants;
            // $license_type_update->DurationDays = $request->durationDays;
            $license_type_update->number_of_devices_login = $request->number_of_devices_login;
            $license_type_update->UpdatedBy = Auth::user()->id;
            $license_type_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('license_type.view')->with('success', 'License Type Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\LicenseType  $license_type
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $license_type_delete = LicenseType::find($id)->delete();
        return back()->with('success', 'License Type Trash Successfully');
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
            $license_type_bulk_delete = LicenseType::find($id)->delete();
        }
        return back()->with('success', 'License Types Deleted Successfully');
    }
}
