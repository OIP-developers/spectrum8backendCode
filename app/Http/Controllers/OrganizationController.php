<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Event;
use App\Models\Contact;
use App\Models\Assessment;
use App\Models\Organization;
use Illuminate\Http\Request;
use App\Models\OrganizationType;
use App\Models\EventOrganization;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class OrganizationController extends Controller
{

    public function index()
    {
        $org = Organization::where(['is_archive' => 'false', "Status" => 1])->orderBy('id', 'DESC')->get();
        return view('front.organizations.view', compact('org'));
    }
    public function trash()
    {
        $organizations = Organization::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.organizations.trash', compact('organizations'));
    }
    public function restore($id)
    {
        $organizations_restore = Organization::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }

    public function archive()
    {
        $organizations = Organization::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.organizations.archive', compact('organizations'));
    }
    public function toggleArchive($id)
    {
        $organizations = Organization::find($id);
        if ($organizations->is_archive == 'true') {
            $organizations->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $organizations->is_archive = 'true';
            $mxg = "Archive";
        }
        $organizations->save();
        return back()->with('success', 'Organization ' . $mxg . ' Successfully');
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
                'organization_type' => 'required|max:10',
                'org_name' => 'required|max:150',
                'org_abbr' => 'required|max:6',
                'OrgEmail' => 'required|max:250|unique:organizations|email',
                'org_address' => 'required|max:150',
                'org_city' => 'required|max:50',
                'org_state' => 'required|max:50',
                'org_postal_code' => 'required|max:10',
                'primary_contact' => 'required|max:19',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            // $user = User::create([
            //     'name' => $request->org_name,
            //     'email' => $request->org_email,
            //     'role_id' => 0,
            //     'CreatedBy' => $loggedin_id,
            //     'password' => Hash::make($request->org_password),
            // ]);
            // $user = new User;
            // $user->name = $request->org_name;
            // $user->email = $request->org_email;
            // $user->role_id = 0;
            // $user->CreatedBy = Auth::user()->id;
            // $user->password = Hash::make($request->org_password);
            // $user->save();
            // $user_id = $user->id;

            $organization_detail = new Organization;
            $organization_detail->Name = $request->org_name;
            $organization_detail->Abbr = $request->org_abbr;
            $organization_detail->OrgEmail = $request->OrgEmail;
            $organization_detail->Address = $request->org_address;
            $organization_detail->City = $request->org_city;
            $organization_detail->StateProvince = $request->org_state;
            $organization_detail->PostalCode = $request->org_postal_code;
            $organization_detail->PrimaryContactID = $request->primary_contact;
            if ($request->type == 'sub') {
                $organization_detail->ParentOrganizationID = $request->parent_organization_id;
                $mxg = "Sub Organization";
            } else {
                $mxg = "Organization";
            }
            $organization_detail->OrganizationTypeID = $request->organization_type;
            $organization_detail->CreatedBy = Auth::user()->id;
            $organization_detail->S8S_ID = Auth::user()->id;
            $organization_detail->save();

            if (isset($request->events)) {
                foreach ($request->events as $event) {
                    $events = new EventOrganization;
                    $events->OrganizationID = $organization_detail->id;
                    $events->EventID = $event;
                    $events->save();
                }
            }
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('error', $e->getMessage())
                ->withInput();
        }
        DB::commit();
        return back()->with('success', '' . $mxg . ' Register Successfully');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Assessment  $assessment
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $organization_edit = Organization::where('id', $request->id)->first();
        $events_organization = EventOrganization::where('OrganizationID', $organization_edit->id)->orderBy('id', 'DESC')->get();
        $organization_type = OrganizationType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Classification', 'ASC')->get();
        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1, 'ParentOrganizationID' => null])->orderBy('Name', 'ASC')->get();
        $contact = Contact::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Firstname', 'ASC')->get();
        $events = Event::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.organizations.add', compact('organization_edit', 'organizations', 'organization_type', 'contact', 'events_organization', 'events'));
    }
    public function showForm(Request $request)
    {
        $organization_type = OrganizationType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Classification', 'ASC')->get();
        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1, 'ParentOrganizationID' => null])->orderBy('Name', 'ASC')->get();
        $contact = Contact::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Firstname', 'ASC')->get();
        $events = Event::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.organizations.add', compact('organization_type', 'organizations', 'contact', 'events'));
    }

    public function update(Request $request)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'organization_type' => 'required|max:10',
                'org_name' => 'required|max:150',
                'org_abbr' => 'required|max:6',
                'OrgEmail' => 'required|email|max:250',
                'org_address' => 'required|max:150',
                'org_city' => 'required|max:50',
                'org_state' => 'required|max:50',
                'org_postal_code' => 'required|max:10',
                'primary_contact' => 'required|max:19',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;

            $organization_detail = Organization::find($id);
            $organization_detail->Name = $request->org_name;
            $organization_detail->Abbr = $request->org_abbr;
            $organization_detail->OrgEmail = $request->OrgEmail;
            $organization_detail->Address = $request->org_address;
            $organization_detail->City = $request->org_city;
            $organization_detail->StateProvince = $request->org_state;
            $organization_detail->PostalCode = $request->org_postal_code;
            $organization_detail->PrimaryContactID = $request->primary_contact;
            if ($request->type == 'sub') {
                $organization_detail->ParentOrganizationID = $request->parent_organization_id;
                $mxg = "Sub Organization";
            } else {
                $organization_detail->ParentOrganizationID = null;
                $mxg = "Organization";
            }
            $organization_detail->OrganizationTypeID = $request->organization_type;
            $organization_detail->CreatedBy = Auth::user()->id;
            $organization_detail->S8S_ID = Auth::user()->id;
            $organization_detail->save();

            $event_delete = EventOrganization::where('OrganizationID', $id)->delete();
            if (isset($request->events)) {
                foreach ($request->events as $event) {
                    $events = new EventOrganization;
                    $events->OrganizationID = $id;
                    $events->EventID = $event;
                    $events->save();
                }
            }

            // $user = User::find($organization_detail->CreatedBy);
            // $user->name = $request->org_name;
            // $user->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('error', $e->getMessage())
                ->withInput();
        }
        DB::commit();
        return redirect()->route('organization.view')->with('success', 'Organization Update Successfully');
    }
    public function delete($id)
    {
        try {
            $organization_delete = Organization::find($id)->delete();
        } catch (\Exception $e) {
            return Redirect()->back()
                ->with('message', $e->getMessage())
                ->withInput();
        }
        return back()->with('success', 'Organization Trash Successfully');
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
            $organization_bulk_delete = Organization::find($id)->delete();
        }
        return back()->with('success', 'Organization Deleted Successfully');
    }
}
