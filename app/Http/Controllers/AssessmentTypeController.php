<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\AssessmentType;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AssessmentTypeController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $assessment_type = AssessmentType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.assessment_type.view', compact('assessment_type'));
    }
    public function trash()
    {
        $assessment_type = AssessmentType::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.assessment_type.trash', compact('assessment_type'));
    }
    public function restore($id)
    {
        $assessment_type_restore = AssessmentType::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $assessment_type = AssessmentType::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.assessment_type.archive', compact('assessment_type'));
    }
    public function toggleArchive($id)
    {
        $assessment_type = AssessmentType::find($id);
        if ($assessment_type->is_archive == 'true') {
            $assessment_type->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $assessment_type->is_archive = 'true';
            $mxg = "Archive";
        }
        $assessment_type->save();
        return back()->with('success', 'Assessment Type ' . $mxg . ' Successfully');
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
                'name' => 'required|max:100',
                'timed' => 'required|max:4',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $assessment_type = new AssessmentType;
            $assessment_type->Name = $request->name;
            if ($request->timed == 1) {
                $assessment_type->Timed = 1;
                $assessment_type->Distance = 0;
            }
            if ($request->timed == 0) {
                $assessment_type->Distance = 1;
                $assessment_type->Timed = 0;
            }
            $assessment_type->CreatedBy = Auth::user()->id;
            $assessment_type->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Assessment Type Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\AssessmentType  $assessment_type
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $assessment_type_edit = AssessmentType::where('id', $request->id)->first();
        return view('front.assessment_type.add', compact('assessment_type_edit'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AssessmentType  $assessment_type
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AssessmentType $assessment_type)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|max:100',
                'timed' => 'required|max:4',
            ]);

            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $id = $request->id;
            $assessment_type_update = AssessmentType::find($id);
            $assessment_type_update->Name = $request->name;
            if ($request->timed == 1) {
                $assessment_type_update->Timed = 1;
                $assessment_type_update->Distance = 0;
            }
            if ($request->timed == 0) {
                $assessment_type_update->Distance = 1;
                $assessment_type_update->Timed = 0;
            }
            $assessment_type_update->UpdatedBy = Auth::user()->id;
            $assessment_type_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('assessment_type.view')->with('success', 'Assessment Type Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AssessmentType  $assessment_type
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $assessment_type_delete = AssessmentType::find($id)->delete();
        return back()->with('success', 'Assessment Type Trash Successfully');
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
            $assessment_type_bulk_delete = AssessmentType::find($id)->delete();
        }
        return back()->with('success', 'Assessment Type Deleted Successfully');
    }
}
