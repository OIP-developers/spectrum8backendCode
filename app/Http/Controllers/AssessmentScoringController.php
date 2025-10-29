<?php

namespace App\Http\Controllers;

use App\Models\Color;
use App\Models\Assessment;
use Illuminate\Http\Request;
use App\Models\AssessmentScoring;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AssessmentScoringController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (Auth::user()->id == 1) {
            $scorings = AssessmentScoring::where('is_archive', 'false')->where("CreatedBy", Auth::user()->id)->OrderBy('id', "DESC")->with('assessment')->with('color')->get();
        } else {
            $complete_data = [Auth::user()->id, 1];
            $scorings = AssessmentScoring::where('is_archive', 'false')->whereIn("CreatedBy", $complete_data)->OrderBy('id', "DESC")->with('assessment')->with('color')->get();
        }
        return view('front.scoring.view', compact('scorings'));
    }
    public function trash()
    {
        $scorings = AssessmentScoring::onlyTrashed()->get();
        return view('front.scoring.trash', compact('scorings'));
    }
    public function restore($id)
    {
        $scorings_restore = AssessmentScoring::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $scorings = AssessmentScoring::where('is_archive', 'true')->get();
        return view('front.scoring.archive', compact('scorings'));
    }
    public function toggleArchive($id)
    {
        $scorings = AssessmentScoring::find($id);
        if ($scorings->is_archive == 'true') {
            $scorings->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $scorings->is_archive = 'true';
            $mxg = "Archive";
        }
        $scorings->save();
        return back()->with('success', 'Scoring ' . $mxg . ' Successfully');
    }

    public function add_form(Request $request)
    {
        $assessments = Assessment::where("CreatedBy", Auth::user()->id)->get();
        $colors = Color::where("CreatedBy", Auth::user()->id)->get();
        return view('front.scoring.add', compact('assessments', 'colors'));
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function add(Request $request)
    {
        // dd($request->all());
        $validator = Validator::make($request->all(), [
            'assessment' => 'required',
            'color' => 'required',
            'image' => 'required|image|mimes:jpeg,jpg,png',
            // 'mode'=>'required',
            'min' => 'required|max:30',
            'max' => 'required|max:30',
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }
        $scoring = new AssessmentScoring;
        $find_assesst = Assessment::where('id', $request->assessment)->first();
        $find_color_score = AssessmentScoring::where('assessment_id', $request->assessment)->get();
        $count = count($find_color_score);
        // if($count == 8){
        //     return back()->with('info','8 Colors Already Exsist');
        // }
        // else{
        $scoring->assessment_id = $request->assessment;
        $scoring->color_id = $request->color;
        $date_format = date('H:i:s', strtotime($request->duration));
        $scoring->Duration = $date_format;
        $scoring->Distance = $request->distance;
        $scoring->Score_target = $find_assesst->Type;
        if ($request->hasFile('image')) {
            $files = $request->file('image');
            $image_name = md5(rand(1000, 10000));
            $file_with_ext = strtolower($files->getClientOriginalName());
            $filename = pathinfo($file_with_ext, PATHINFO_FILENAME);
            $ext = $files->getClientOriginalExtension();
            $image_full_name = $filename . '_' . time() . '.' . $ext;
            $path = $files->move(public_path('images/assessment_image/scoring/'), $image_full_name);
            $scoring->image = $image_full_name;
        }
        $scoring->MinValue = $request->min;
        $scoring->MaxValue = $request->max;
        $scoring->CreatedBy = Auth::user()->id;
        if ($find_assesst->Type == "Duration") {
            $scoring->minTime = $request->minTime;
            $scoring->maxTime = $request->maxTime;
        }
        $scoring->save();
        return redirect()->route('scoring.view')->with('success', 'Scoring Add Successfully');
        // }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\AssessmentScoring  $assessmentScoring
     * @return \Illuminate\Http\Response
     */
    public function show(AssessmentScoring $assessmentScoring)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\AssessmentScoring  $assessmentScoring
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $assessments = Assessment::get();
        $colors = Color::get();
        $scoring_edit = AssessmentScoring::where('id', $request->id)->first();
        $find_type = Assessment::where('id', $scoring_edit->assessment_id)->first();
        return view('front.scoring.add', compact('assessments', 'colors', 'scoring_edit', 'find_type'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AssessmentScoring  $assessmentScoring
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AssessmentScoring $assessmentScoring)
    {
        $validator = Validator::make($request->all(), [
            'assessment' => 'required',
            'color' => 'required',
            // 'mode'=>'required',
            'image' => 'image|mimes:jpeg,jpg,png',
            'min' => 'required|max:30',
            'max' => 'required|max:30',
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }
        $id = $request->id;
        $date_format = date('H:i:s', strtotime($request->duration));
        $scoring_edit = AssessmentScoring::find($id);
        $find_assesst = Assessment::where('id', $request->assessment)->first();
        $find_color_score = AssessmentScoring::where('assessment_id', $request->assessment)->get();
        $count = count($find_color_score);
        // if($find_assesst->id != $request->assessment){
        //     if($count == 8){
        //         return back()->with('info','8 Colors Already Exsist');
        //     }
        // }
        // else{
        if ($request->hasFile('image')) {
            try {
                if (file_exists(public_path("images/assessment_image/scoring/" . $scoring_edit->image))) {
                    unlink(public_path("images/assessment_image/scoring/" . $scoring_edit->image));
                }
            } catch (\Exception $e) {
                Log::info($e->getMessage());
            }
        }

        $scoring_edit->assessment_id = $request->assessment;
        $scoring_edit->color_id = $request->color;
        $scoring_edit->Duration = $date_format;
        $scoring_edit->Distance = $request->distance;
        $scoring_edit->Score_target = $find_assesst->Type;
        if ($find_assesst->Type == "Duration") {
            $scoring_edit->minTime = $request->minTime;
            $scoring_edit->maxTime = $request->maxTime;
        }
        if ($request->hasFile('image')) {
            $files = $request->file('image');
            $image_name = md5(rand(1000, 10000));
            $file_with_ext = strtolower($files->getClientOriginalName());
            $filename = pathinfo($file_with_ext, PATHINFO_FILENAME);
            $ext = $files->getClientOriginalExtension();
            $image_full_name = $filename . '_' . time() . '.' . $ext;
            $path = $files->move(public_path('images/assessment_image/scoring/'), $image_full_name);
            $scoring_edit->image = $image_full_name;
        }
        $scoring_edit->MinValue = $request->min;
        $scoring_edit->MaxValue = $request->max;
        $scoring_edit->save();
        return redirect()->route('scoring.view')->with('success', 'Scoring Update Successfully');
        // }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AssessmentScoring  $assessmentScoring
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $scoring_delete = AssessmentScoring::find($id);
        if (isset($scoring_delete)) {
            // try{
            //   if(file_exists(public_path("images/assessment_image/scoring/".$scoring_delete->image))){
            //       unlink(public_path("images/assessment_image/scoring/".$scoring_delete->image));
            //     }
            //        }catch(\Exception $e){
            //         Log::info($e->getMessage());
            //   }

            AssessmentScoring::where('id', $id)->delete();
            return back()->with('success', 'Assessment Trash Successfully');
        } else {
            return back()->with('error', 'Record not found');
        }
        return back()->with('success', 'Scoring Trash Successfully');
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
            $scoring_bulk_delete = AssessmentScoring::find($id);
            if (isset($scoring_bulk_delete)) {
                try {
                    if (file_exists(public_path("images/assessment_image/scoring/" . $scoring_bulk_delete->image))) {
                        unlink(public_path("images/assessment_image/scoring/" . $scoring_bulk_delete->image));
                    }
                } catch (\Exception $e) {
                    Log::info($e->getMessage());
                }

                AssessmentScoring::where('id', $id)->delete();
            }
        }
        return back()->with('success', 'Assessments Scorings Deleted Successfully');
    }
}
