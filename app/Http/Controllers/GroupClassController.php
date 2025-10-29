<?php

namespace App\Http\Controllers;

use App\Models\Group;
use App\Models\Classes;
use App\Models\GroupClass;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class GroupClassController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $group_classs = GroupClass::where(['is_archive' => 'false', 'Status' => 1])->with('group', 'Class')->orderBy('id', 'DESC')->get();
        return view('front.group_class.view', compact('group_classs'));
    }
    public function trash()
    {
        $group_classs = GroupClass::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.group_class.trash', compact('group_classs'));
    }
    public function restore($id)
    {
        $group_classs_restore = GroupClass::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $group_classs = GroupClass::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.group_class.archive', compact('group_classs'));
    }
    public function toggleArchive($id)
    {
        $group_classs = GroupClass::find($id);
        if ($group_classs->is_archive == 'true') {
            $group_classs->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $group_classs->is_archive = 'true';
            $mxg = "Archive";
        }
        $group_classs->save();
        return back()->with('success', 'Group Class ' . $mxg . ' Successfully');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function add(Request $request)
    {
        $check_data = GroupClass::where(['GroupID' => $request->group, 'ClassID' => $request->class])->first();
        if (isset($check_data)) {
            return back()->with('error', 'Record Already Exist');
        }
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'group' => 'required',
                'class' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $group_class = new GroupClass;
            $group_class->GroupID = $request->group;
            $group_class->ClassID = $request->class;
            $group_class->CreatedBy = Auth::user()->id;
            $group_class->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Group Class Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\GroupClass  $group_class
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $group_class_edit = GroupClass::where('id', $request->id)->first();
        $groups = Group::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        $classes = Classes::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.group_class.add', compact('groups', 'classes', 'group_class_edit'));
    }

    public function showForm(Request $request)
    {
        $groups = Group::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        $classes = Classes::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.group_class.add', compact('classes', 'groups'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\GroupClass  $group_class
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, GroupClass $group_class)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'group' => 'required',
                'class' => 'required',
            ]);

            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;
            $group_class_update = GroupClass::find($id);
            $group_class_update->GroupID = $request->group;
            $group_class_update->ClassID = $request->class;
            $group_class_update->UpdatedBy = Auth::user()->id;
            $group_class_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('group_class.view')->with('success', 'Group Class Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\GroupClass  $group_class
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $group_class_delete = GroupClass::find($id)->delete();
        return back()->with('success', 'Group Class Trash Successfully');
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
            $group_class_bulk_delete = GroupClass::find($id)->delete();
        }
        return back()->with('success', 'Group Classs Deleted Successfully');
    }
}
