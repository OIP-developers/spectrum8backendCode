<?php

namespace App\Http\Controllers;

use App\Models\Color;
use App\Models\Gender;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class GenderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $gender = Gender::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.gender.view', compact('gender'));
    }


    public function trash()
    {
        $gender = Gender::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.gender.trash', compact('gender'));
    }
    public function restore($id)
    {
        $gender_restore = Gender::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }


    public function archive()
    {
        $gender = Gender::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.gender.archive', compact('gender'));
    }
    public function toggleArchive($id)
    {
        $gender = Gender::find($id);
        if ($gender->is_archive == 'true') {
            $gender->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $gender->is_archive = 'true';
            $mxg = "Archive";
        }
        $gender->save();
        return back()->with('success', 'Gender ' . $mxg . ' Successfully');
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
                'gender' => 'required|max:255',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $gender = new Gender;
            $gender->Gender = $request->gender;
            $gender->CreatedBy = Auth::user()->id;
            $gender->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Gender Add Successfully');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Gender  $grade
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $gender_edit = Gender::where('id', $request->id)->first();
        return view('front.gender.add', compact('gender_edit'));
    }

    public function showForm(Request $request)
    {
        $colors = Color::where(['is_archive' => 'false', 'Status' => 1])->get();
        return view('front.gender.add', compact('colors'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Gender  $grade
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Gender $gender)
    {

        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'gender' => 'required|max:255',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $id = $request->id;
            $gender_update = Gender::find($id);
            $gender_update->Gender = $request->gender;
            $gender_update->UpdatedBy = Auth::user()->id;
            $gender_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('gender.view')->with('success', 'Gender Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Gender  $grade
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $gender_delete = Gender::find($id)->delete();
        return back()->with('success', 'Gender Trash Successfully');
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
            $grade_bulk_delete = Gender::find($id)->delete();
        }
        return back()->with('success', 'Gender Deleted Successfully');
    }
}
