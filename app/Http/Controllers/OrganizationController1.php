<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\Assessment;
use App\Models\Organization;
use Illuminate\Http\Request;
use App\Models\OrganizationType;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class OrganizationController extends Controller
{

    public function orgIndex()
    {
        $org = Organization::where(['is_archive' => 'false', "Status" => 1])->get();
        return view('front.organizations.view', compact('org'));
    }
    public function trash()
    {
        $organizations = Organization::onlyTrashed()->get();
        return view('front.organizations.trash', compact('organizations'));
    }
    public function restore($id)
    {
        $organizations_restore = Organization::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }

    public function archive()
    {
        $organizations = Organization::where('is_archive', 'true')->get();
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

    public function orgAssessment($id)
    {
        $CreatedBy = [1, $id];
        $assessments = Assessment::whereIn('CreatedBy', $CreatedBy)->get();
        // $org = Organization::where("CreatedBy",'!=',Auth::user()->id)->where('ParentOrganizationID',Auth::user()->id)->get();
        return view('front.organizations.assessments', compact('assessments'));
    }
    public function orgSubOrg($id)
    {
        $sub_org_admin = Organization::where("ParentOrganizationID", $id)->where('IsOrgAdmin', 'false')->get();
        return view('front.organizations.suborg', compact('sub_org_admin'));
    }

    public function orgAssessmentStatus(Request $request)
    {
        $find = $request->id['id'];
        $status = Assessment::find($find);
        $status->status = $request->data_val;
        $status->save();
        // return back()->with('success','Status Update Successfully');
        return response()->json(['success' => 'Status Updated Successfully']);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function orgAdd(Request $request)
    {
        // dd($request->all());
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'organization_type' => 'required|max:10',
                'org_name' => 'required|max:150',
                'org_abbr' => 'required|max:6',
                'org_email' => 'required',
                'org_address' => 'required',
                'org_city' => 'required|max:30',
                'org_state' => 'required|max:30',
                'org_postal_code' => 'required|max:30',
                'primary_contact' => 'required|max:30',
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
            $organization_detail->OrgEmail = $request->org_email;
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
    public function orgEdit(Request $request)
    {
        $organization_edit = Organization::where('id', $request->id)->first();
        $organization_type = OrganizationType::where(['is_archive' => 'false', 'Status' => 1])->get();
        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1, 'ParentOrganizationID' => null])->get();
        return view('front.organizations.add', compact('organization_edit', 'organizations', 'organization_type'));
    }
    public function showForm(Request $request)
    {
        $organization_type = OrganizationType::where(['is_archive' => 'false', 'Status' => 1])->get();
        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1, 'ParentOrganizationID' => null])->get();
        return view('front.organizations.add', compact('organization_type', 'organizations'));
    }

    public function orgUpdate(Request $request)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'organization_type' => 'required|max:10',
                'org_name' => 'required|max:150',
                'org_abbr' => 'required|max:6',
                'org_email' => 'required',
                'org_address' => 'required',
                'org_city' => 'required|max:30',
                'org_state' => 'required|max:30',
                'org_postal_code' => 'required|max:30',
                'primary_contact' => 'required|max:30',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;

            $organization_detail = Organization::find($id);
            $organization_detail->Name = $request->org_name;
            $organization_detail->Abbr = $request->org_abbr;
            $organization_detail->OrgEmail = $request->org_email;
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

            $user = User::find($organization_detail->CreatedBy);
            $user->name = $request->org_name;
            $user->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('error', $e->getMessage())
                ->withInput();
        }
        DB::commit();
        return redirect()->route('organization.view')->with('success', 'Organization Update Successfully');
    }
    public function orgDelete($id)
    {
        $organization_delete = Organization::find($id)->delete();
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

    public function index()
    {
        $sub_org = Organization::where("CreatedBy", '!=', Auth::user()->id)->where('ParentOrganizationID', Auth::user()->id)->get();
        return view('front.sub_organizations.view', compact('sub_org'));
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
                'org_name' => 'required|max:255',
                'org_email' => 'required',
                'org_password' => 'required|min:8',
                'org_abbr' => 'required|max:255',
                'org_address' => 'required',
                'org_city' => 'required|max:255',
                'org_state' => 'required|max:255',
                'org_postal_code' => 'required|max:30',
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
            $user = new User;
            $user->name = $request->org_name;
            $user->email = $request->org_email;
            $user->role_id = 3;
            $user->CreatedBy = Auth::user()->id;
            $user->password = Hash::make($request->org_password);
            $user->save();
            $user_id = $user->id;

            $organization_detail = new Organization;
            $organization_detail->Name = $request->org_name;
            $organization_detail->Abbr = $request->org_abbr;
            $organization_detail->Address = $request->org_address;
            $organization_detail->City = $request->org_city;
            $organization_detail->StateProvince = $request->org_state;
            $organization_detail->PostalCode = $request->org_postal_code;
            $organization_detail->OrgEmail = $request->org_email;
            $organization_detail->CreatedBy = $user_id;
            $organization_detail->IsOrgAdmin = "false";
            $organization_detail->ParentOrganizationID = Auth::user()->id;
            $organization_detail->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('error', $e->getMessage())
                ->withInput();
        }
        DB::commit();
        return back()->with('success', 'Sub Organization Register Successfully');
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
        return view('front.sub_organizations.add', compact('organization_edit'));
    }


    public function update(Request $request)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'org_name' => 'required|max:255',
                'org_abbr' => 'required|max:255',
                'org_address' => 'required',
                'org_city' => 'required|max:255',
                'org_state' => 'required|max:255',
                'org_postal_code' => 'required|max:30',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;

            $organization_detail = Organization::find($id);
            $organization_detail->Name = $request->org_name;
            $organization_detail->Abbr = $request->org_abbr;
            $organization_detail->Address = $request->org_address;
            $organization_detail->City = $request->org_city;
            $organization_detail->StateProvince = $request->org_state;
            $organization_detail->PostalCode = $request->org_postal_code;
            $organization_detail->IsOrgAdmin = "false";
            $organization_detail->ParentOrganizationID = Auth::user()->id;
            $organization_detail->save();

            $user = User::find($organization_detail->CreatedBy);
            $user->name = $request->org_name;
            $user->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('error', $e->getMessage())
                ->withInput();
        }
        DB::commit();
        return back()->with('success', 'Sub Organization Update Successfully');
    }
}
