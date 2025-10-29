<?php

namespace App\Http\Controllers;

use App\Models\Group;
use App\Models\Organization;
use App\Models\Facilitator;
use Illuminate\Http\Request;
use App\Models\GroupFacilitator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class GroupFacilitatorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $group_facilitators = GroupFacilitator::where(['is_archive' => 'false', 'Status' => 1])->with('group', 'facilitator')->orderBy('id', 'DESC')->get();
        return view('front.group_facilitator.view', compact('group_facilitators'));
    }
    public function trash()
    {
        $group_facilitators = GroupFacilitator::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.group_facilitator.trash', compact('group_facilitators'));
    }
    public function restore($id)
    {
        $group_facilitators_restore = GroupFacilitator::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $group_facilitators = GroupFacilitator::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.group_facilitator.archive', compact('group_facilitators'));
    }
    public function toggleArchive($id)
    {
        $group_facilitators = GroupFacilitator::find($id);
        if ($group_facilitators->is_archive == 'true') {
            $group_facilitators->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $group_facilitators->is_archive = 'true';
            $mxg = "Archive";
        }
        $group_facilitators->save();
        return back()->with('success', 'Group Facilitator ' . $mxg . ' Successfully');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function add(Request $request)
    {
        $check_data = GroupFacilitator::where(['GroupID' => $request->group, 'FacilitatorID' => $request->facilitator])->first();
        if (isset($check_data)) {
            return back()->with('error', 'Record Already Exist');
        }
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'group' => 'required',
                'facilitator' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $group_facilitator = new GroupFacilitator;
            $group_facilitator->GroupID = $request->group;
            $group_facilitator->FacilitatorID = $request->facilitator;
            $group_facilitator->CreatedBy = Auth::user()->id;
            $group_facilitator->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Group Facilitator Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\GroupFacilitator  $group_facilitator
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $group_facilitator_edit = GroupFacilitator::where('id', $request->id)->first();
        $groups = Group::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        $facilitators = Facilitator::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.group_facilitator.add', compact('groups', 'facilitators', 'group_facilitator_edit'));
    }

    public function showForm(Request $request)
    {
        $groups = Group::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        $facilitators = Facilitator::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.group_facilitator.add', compact('groups', 'facilitators'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\GroupFacilitator  $group_facilitator
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, GroupFacilitator $group_facilitator)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'group' => 'required',
                'facilitator' => 'required',
            ]);

            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;
            $group_facilitator_update = GroupFacilitator::find($id);
            $group_facilitator_update->GroupID = $request->group;
            $group_facilitator_update->FacilitatorID = $request->facilitator;
            $group_facilitator_update->UpdatedBy = Auth::user()->id;
            $group_facilitator_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('group_facilitator.view')->with('success', 'Group Facilitator Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\GroupFacilitator  $group_facilitator
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $group_facilitator_delete = GroupFacilitator::find($id)->delete();
        return back()->with('success', 'Group Facilitator Trash Successfully');
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
            $group_facilitator_bulk_delete = GroupFacilitator::find($id)->delete();
        }
        return back()->with('success', 'Group Facilitators Deleted Successfully');
    }
}
