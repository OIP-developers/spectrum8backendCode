<?php

namespace App\Http\Controllers;

use App\Models\Color;
use App\Models\Classes;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ClassesController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $class = Classes::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->with('colors')->get();
        return view('front.class.view', compact('class'));
    }
    public function trash()
    {
        $class = Classes::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.class.trash', compact('class'));
    }
    public function restore($id)
    {
        $class_restore = Classes::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $class = Classes::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.class.archive', compact('class'));
    }
    public function toggleArchive($id)
    {
        $class = Classes::find($id);
        if ($class->is_archive == 'true') {
            $class->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $class->is_archive = 'true';
            $mxg = "Archive";
        }
        $class->save();
        return back()->with('success', 'Class ' . $mxg . ' Successfully');
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
                'name' => 'required|max:15',
                'color_id' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $class = new Classes;
            $class->Name = $request->name;
            $class->ColorID = $request->color_id;
            $class->CreatedBy = Auth::user()->id;
            $class->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Class Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\class  $class
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $class_edit = Classes::where('id', $request->id)->first();
        $colors = Color::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.class.add', compact('class_edit', 'colors'));
    }
    public function showForm(Request $request)
    {
        $colors = Color::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.class.add', compact('colors'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\class  $class
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Classes $class)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|max:15',
                'color_id' => 'required',
            ]);

            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;
            $class_update = Classes::find($id);
            $class_update->Name = $request->name;
            $class_update->ColorID = $request->color_id;
            $class_update->UpdatedBy = Auth::user()->id;
            $class_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('class.view')->with('success', 'Class Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\class  $class
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $class_delete = Classes::find($id)->delete();
        return back()->with('success', 'Class Trash Successfully');
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
            $class_bulk_delete = Classes::find($id)->delete();
        }
        return back()->with('success', 'Class Deleted Successfully');
    }
}
