<?php

namespace App\Http\Controllers;

use App\Models\Grade;
use App\Models\Group;
use App\Models\GroupGrade;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class GroupGradeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $group_grades = GroupGrade::where(['is_archive' => 'false', 'Status' => 1])->with('group', 'Grade')->orderBy('id', 'DESC')->get();
        return view('front.group_grade.view', compact('group_grades'));
    }
    public function trash()
    {
        $group_grades = GroupGrade::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.group_grade.trash', compact('group_grades'));
    }
    public function restore($id)
    {
        $group_grades_restore = GroupGrade::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $group_grades = GroupGrade::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.group_grade.archive', compact('group_grades'));
    }
    public function toggleArchive($id)
    {
        $group_grades = GroupGrade::find($id);
        if ($group_grades->is_archive == 'true') {
            $group_grades->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $group_grades->is_archive = 'true';
            $mxg = "Archive";
        }
        $group_grades->save();
        return back()->with('success', 'Group Grade ' . $mxg . ' Successfully');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function add(Request $request)
    {
        $check_data = GroupGrade::where(['GroupID' => $request->group, 'GradeID' => $request->grade])->first();
        if (isset($check_data)) {
            return back()->with('error', 'Record Already Exist');
        }
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'group' => 'required',
                'grade' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $group_grade = new GroupGrade;
            $group_grade->GroupID = $request->group;
            $group_grade->GradeID = $request->grade;
            $group_grade->CreatedBy = Auth::user()->id;
            $group_grade->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Group Grade Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\GroupGrade  $group_grade
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $group_grade_edit = GroupGrade::where('id', $request->id)->first();
        $groups = Group::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        $grades = Grade::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.group_grade.add', compact('groups', 'grades', 'group_grade_edit'));
    }

    public function showForm(Request $request)
    {
        $groups = Group::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        $grades = Grade::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.group_grade.add', compact('groups', 'grades'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\GroupGrade  $group_grade
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, GroupGrade $group_grade)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'group' => 'required',
                'grade' => 'required',
            ]);

            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;
            $group_grade_update = GroupGrade::find($id);
            $group_grade_update->GroupID = $request->group;
            $group_grade_update->GradeID = $request->grade;
            $group_grade_update->UpdatedBy = Auth::user()->id;
            $group_grade_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('group_grade.view')->with('success', 'Group Grade Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\GroupGrade  $group_grade
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $group_grade_delete = GroupGrade::find($id)->delete();
        return back()->with('success', 'Group Grade Trash Successfully');
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
            $group_grade_bulk_delete = GroupGrade::find($id)->delete();
        }
        return back()->with('success', 'Group Grades Deleted Successfully');
    }
}
