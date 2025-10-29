<?php

namespace App\Http\Controllers;

use App\Models\Group;
use App\Models\Organization;
use Illuminate\Http\Request;
use App\Models\GroupOrganization;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class GroupOrganizationController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $group_organizations = GroupOrganization::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.group_organization.view', compact('group_organizations'));
    }
    public function trash()
    {
        $group_organizations = GroupOrganization::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.group_organization.trash', compact('group_organizations'));
    }
    public function restore($id)
    {
        $group_organizations_restore = GroupOrganization::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $group_organizations = GroupOrganization::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.group_organization.archive', compact('group_organizations'));
    }
    public function toggleArchive($id)
    {
        $group_organizations = GroupOrganization::find($id);
        if ($group_organizations->is_archive == 'true') {
            $group_organizations->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $group_organizations->is_archive = 'true';
            $mxg = "Archive";
        }
        $group_organizations->save();
        return back()->with('success', 'Group Organization ' . $mxg . ' Successfully');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function add(Request $request)
    {
        $check_data = GroupOrganization::where(['GroupID' => $request->group, 'OrganizationID' => $request->organization])->first();
        if (isset($check_data)) {
            return back()->with('error', 'Record Already Exist');
        }
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'group' => 'required',
                'organization' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $group_organization = new GroupOrganization;
            $group_organization->GroupID = $request->group;
            $group_organization->OrganizationID = $request->organization;
            $group_organization->CreatedBy = Auth::user()->id;
            $group_organization->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Group Organization Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\GroupOrganization  $group_organization
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $group_organization_edit = GroupOrganization::where('id', $request->id)->first();
        $groups = Group::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.group_organization.add', compact('groups', 'organizations', 'group_organization_edit'));
    }

    public function showForm(Request $request)
    {
        $groups = Group::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.group_organization.add', compact('groups', 'organizations'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\GroupOrganization  $group_organization
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, GroupOrganization $group_organization)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'group' => 'required',
                'organization' => 'required',
            ]);

            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;
            $group_organization_update = GroupOrganization::find($id);
            $group_organization_update->GroupID = $request->group;
            $group_organization_update->OrganizationID = $request->organization;
            $group_organization_update->UpdatedBy = Auth::user()->id;
            $group_organization_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('group_organization.view')->with('success', 'Group Organization Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\group_organization  $group_organization
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $group_organization_delete = GroupOrganization::find($id)->delete();
        return back()->with('success', 'Group Organization Trash Successfully');
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
            $group_organization_bulk_delete = GroupOrganization::find($id)->delete();
        }
        return back()->with('success', 'Group Organization Deleted Successfully');
    }
}
