<?php

namespace App\Http\Controllers;

use App\Models\Color;
use App\Models\Grade;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;


class GradeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $grades = Grade::where(['is_archive' => 'false', 'Status' => 1])->with('colors')->orderBy('id', 'DESC')->get();
        return view('front.grades.view', compact('grades'));
    }


    public function trash()
    {
        $grades = Grade::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.grades.trash', compact('grades'));
    }
    public function restore($id)
    {
        $grades_restore = Grade::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }


    public function archive()
    {
        $grades = Grade::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.grades.archive', compact('grades'));
    }
    public function toggleArchive($id)
    {
        $grades = Grade::find($id);
        if ($grades->is_archive == 'true') {
            $grades->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $grades->is_archive = 'true';
            $mxg = "Archive";
        }
        $grades->save();
        return back()->with('success', 'Grade ' . $mxg . ' Successfully');
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
                'grade' => 'required|max:11',
                'name' => 'required|max:50',
                'short' => 'required|max:10',
                'color_id' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $grades = new Grade;
            $grades->Grade = $request->grade;
            $grades->Name = $request->name;
            $grades->Short = $request->short;
            $grades->ColorID = $request->color_id;
            $grades->CreatedBy = Auth::user()->id;
            $grades->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Grade Add Successfully');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Grade  $grade
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $grades_edit = Grade::where('id', $request->id)->first();
        $colors = Color::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.grades.add', compact('grades_edit', 'colors'));
    }

    public function showForm(Request $request)
    {
        $colors = Color::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.grades.add', compact('colors'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Grade  $grade
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Grade $grade)
    {

        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'grade' => 'required|max:11',
                'name' => 'required|max:50',
                'short' => 'required|max:10',
                'color_id' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $id = $request->id;
            $grades_update = Grade::find($id);
            $grades_update->Grade = $request->grade;
            $grades_update->Name = $request->name;
            $grades_update->Short = $request->short;
            $grades_update->ColorID = $request->color_id;
            $grades_update->UpdatedBy = Auth::user()->id;
            $grades_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('grade.view')->with('success', 'Grade Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Grade  $grade
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $grades_delete = Grade::find($id)->delete();
        return back()->with('success', 'Grade Trash Successfully');
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
            $grade_bulk_delete = Grade::find($id)->delete();
        }
        return back()->with('success', 'Grades Deleted Successfully');
    }
}
