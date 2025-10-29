<?php

namespace App\Http\Controllers;

use App\Models\Group;
use App\Models\Gender;
use App\Models\GroupGender;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class GroupGenderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $group_genders = GroupGender::where(['is_archive' => 'false', 'Status' => 1])->with('group', 'Gender')->orderBy('id', 'DESC')->get();
        return view('front.group_gender.view', compact('group_genders'));
    }
    public function trash()
    {
        $group_genders = GroupGender::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.group_gender.trash', compact('group_genders'));
    }
    public function restore($id)
    {
        $group_genders_restore = GroupGender::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $group_genders = GroupGender::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.group_gender.archive', compact('group_genders'));
    }
    public function toggleArchive($id)
    {
        $group_genders = GroupGender::find($id);
        if ($group_genders->is_archive == 'true') {
            $group_genders->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $group_genders->is_archive = 'true';
            $mxg = "Archive";
        }
        $group_genders->save();
        return back()->with('success', 'Group Gender ' . $mxg . ' Successfully');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function add(Request $request)
    {
        $check_data = GroupGender::where(['GroupID' => $request->group, 'GenderID' => $request->gender])->first();
        if (isset($check_data)) {
            return back()->with('error', 'Record Already Exist');
        }
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'group' => 'required',
                'gender' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $group_gender = new GroupGender;
            $group_gender->GroupID = $request->group;
            $group_gender->GenderID = $request->gender;
            $group_gender->CreatedBy = Auth::user()->id;
            $group_gender->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Group Gender Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\GroupGender  $group_gender
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $group_gender_edit = GroupGender::where('id', $request->id)->first();
        $groups = Group::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        $genders = Gender::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.group_gender.add', compact('groups', 'genders', 'group_gender_edit'));
    }

    public function showForm(Request $request)
    {
        $groups = Group::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        $genders = Gender::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.group_gender.add', compact('groups', 'genders'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\GroupGender  $group_gender
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, GroupGender $group_gender)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'group' => 'required',
                'gender' => 'required',
            ]);

            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;
            $group_gender_update = GroupGender::find($id);
            $group_gender_update->GroupID = $request->group;
            $group_gender_update->GenderID = $request->gender;
            $group_gender_update->UpdatedBy = Auth::user()->id;
            $group_gender_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('group_gender.view')->with('success', 'Group Gender Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\GroupGender  $group_gender
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $group_gender_delete = GroupGender::find($id)->delete();
        return back()->with('success', 'Group Gender Trash Successfully');
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
            $group_gender_bulk_delete = GroupGender::find($id)->delete();
        }
        return back()->with('success', 'Group Genders Deleted Successfully');
    }
}
