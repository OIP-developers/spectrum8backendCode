<?php

namespace App\Http\Controllers;

use App\Models\Assessment;
use Illuminate\Http\Request;
use App\Models\AssessmentEvaluate;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AssessmentEvaluateController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $assessment_evaluate = AssessmentEvaluate::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->with('assessment')->get();
        return view('front.assessment_evaluate.view', compact('assessment_evaluate'));
    }
    public function trash()
    {
        $assessment_evaluate = AssessmentEvaluate::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.assessment_evaluate.trash', compact('assessment_evaluate'));
    }
    public function restore($id)
    {
        $assessment_evaluate_restore = AssessmentEvaluate::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $assessment_evaluate = AssessmentEvaluate::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.assessment_evaluate.archive', compact('assessment_evaluate'));
    }
    public function toggleArchive($id)
    {
        $assessment_evaluate = AssessmentEvaluate::find($id);
        if ($assessment_evaluate->is_archive == 'true') {
            $assessment_evaluate->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $assessment_evaluate->is_archive = 'true';
            $mxg = "Archive";
        }
        $assessment_evaluate->save();
        return back()->with('success', 'Assessment Evaluate ' . $mxg . ' Successfully');
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
                'assessment_id' => 'required',
                'name' => 'required|max:100',
                'weight' => 'required|max:11',
                'sort' => 'required|max:11',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $assessment_evaluate = new AssessmentEvaluate;
            $assessment_evaluate->AssessmentID = $request->assessment_id;
            $assessment_evaluate->Name = $request->name;
            $assessment_evaluate->Weight = $request->weight;
            $assessment_evaluate->Sort = $request->sort;
            $assessment_evaluate->CreatedBy = Auth::user()->id;
            $assessment_evaluate->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Assessment Evaluate Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\AssessmentEvaluate  $assessment_evaluate
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $assessment_evaluate_edit = AssessmentEvaluate::where('id', $request->id)->first();
        $assessments = Assessment::where('is_archive', 'false')->with(['assessment_type', 'colors'])->orderBy('Name', 'ASC')->get();
        return view('front.assessment_evaluate.add', compact('assessment_evaluate_edit', 'assessments'));
    }
    public function showForm(Request $request)
    {
        $assessments = Assessment::where('is_archive', 'false')->with(['assessment_type', 'colors'])->orderBy('Name', 'ASC')->get();
        return view('front.assessment_evaluate.add', compact('assessments'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AssessmentEvaluate  $assessment_evaluate
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AssessmentEvaluate $assessment_evaluate)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'assessment_id' => 'required',
                'name' => 'required|max:100',
                'weight' => 'required|max:11',
                'sort' => 'required|max:11',
            ]);

            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;
            $assessment_evaluate_update = AssessmentEvaluate::find($id);
            $assessment_evaluate_update->AssessmentID = $request->assessment_id;
            $assessment_evaluate_update->Name = $request->name;
            $assessment_evaluate_update->Weight = $request->weight;
            $assessment_evaluate_update->Sort = $request->sort;
            $assessment_evaluate_update->UpdatedBy = Auth::user()->id;
            $assessment_evaluate_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('assessment_evaluate.view')->with('success', 'Assessment Evaluate Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AssessmentEvaluate  $assessment_evaluate
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $assessment_evaluate_delete = AssessmentEvaluate::find($id)->delete();
        return back()->with('success', 'Assessment Evaluate Trash Successfully');
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
            $assessment_evaluate_bulk_delete = AssessmentEvaluate::find($id)->delete();
        }
        return back()->with('success', 'Assessment Evaluate Deleted Successfully');
    }
}
