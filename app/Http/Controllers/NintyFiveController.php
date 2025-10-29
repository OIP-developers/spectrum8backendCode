<?php

namespace App\Http\Controllers;

use App\Models\Grade;
use App\Models\Gender;
use App\Models\NintyFive;
use App\Models\Assessment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class NintyFiveController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $ninty_five = NintyFive::where(['is_archive' => 'false', 'Status' => 1])->with('assessment', 'grade', 'gender')->get();
        return view('front.ninty_five.view', compact('ninty_five'));
    }


    public function trash()
    {
        $ninty_five = NintyFive::onlyTrashed()->with('assessment', 'grade', 'gender')->get();
        return view('front.ninty_five.trash', compact('ninty_five'));
    }
    public function restore($id)
    {
        $ninty_five_restore = NintyFive::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }


    public function archive()
    {
        $ninty_five = NintyFive::where('is_archive', 'true')->with('assessment', 'grade', 'gender')->get();
        return view('front.ninty_five.archive', compact('ninty_five'));
    }
    public function toggleArchive($assessment_id, $gender_id, $grade_id)
    {
        $ninty_five = NintyFive::where(['AssessmentID' => $assessment_id, 'GradeID' => $grade_id, 'GenderID' => $gender_id])->first();
        if ($ninty_five->is_archive == 'true') {
            $data = [
                'is_archive' => 'false'
            ];
            $mxg = "Unarchive";
        } else {
            $data = [
                'is_archive' => 'true'
            ];
            $mxg = "Archive";
        }
        $ninty_five = NintyFive::where(['AssessmentID' => $assessment_id, 'GradeID' => $grade_id, 'GenderID' => $gender_id])->update($data);
        return back()->with('success', 'Ninty Five ' . $mxg . ' Successfully');
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
                'gender_id' => 'required',
                'grade_id' => 'required',
                'percent' => 'required|regex:/^(([0-9]*)(\.([0-9]+))?)$/',
                'use_segment' => 'required',
                // 'image' => 'required|image|mimes:jpeg,jpg,png'
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $find = NintyFive::where(['AssessmentID'=>$request->assessment_id,"GenderID"=>$request->gender_id,'GradeID'=>$request->grade_id])->first();
            if($find){
                return back()->with('error','Record Already Exist');
            }
            $ninty_five = new NintyFive;
            $ninty_five->AssessmentID = $request->assessment_id;
            $ninty_five->GenderID = $request->gender_id;
            $ninty_five->GradeID = $request->grade_id;
            $ninty_five->Percent = $request->percent;
            $ninty_five->UseSegment = $request->use_segment;
            $ninty_five->ColorSegment = $request->color_segment;
            $ninty_five->DistanceToRed = $request->distance_to_red;
            if ($request->hasFile('image')) {
                $files = $request->file('image');
                $image_name = md5(rand(1000, 10000));
                $file_with_ext = strtolower($files->getClientOriginalName());
                $filename = pathinfo($file_with_ext, PATHINFO_FILENAME);
                $ext = $files->getClientOriginalExtension();
                $image_full_name = $filename . '_' . time() . '.' . $ext;
                $path = $files->move(public_path('images/ninty_five/'), $image_full_name);
                $ninty_five->Image = $image_full_name;
            }
            $ninty_five->RL = $request->RL;
            $ninty_five->RU = $request->RU;
            $ninty_five->BL = $request->BL;
            $ninty_five->BU = $request->BU;
            $ninty_five->GL = $request->GL;
            $ninty_five->GU = $request->GU;
            $ninty_five->OL = $request->OL;
            $ninty_five->OU = $request->OU;
            $ninty_five->VL = $request->VL;
            $ninty_five->VU = $request->VU;
            $ninty_five->YL = $request->YL;
            $ninty_five->YU = $request->YU;
            $ninty_five->PL = $request->PL;
            $ninty_five->PU = $request->PU;
            $ninty_five->WL = $request->WL;
            $ninty_five->WU = $request->WU;
            $ninty_five->CreatedBy = Auth::user()->id;
            $ninty_five->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Ninty Five Add Successfully');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\NintyFive  $grade
     * @return \Illuminate\Http\Response
     */
    public function edit($assessment_id, $gender_id, $grade_id)
    {
        $ninty_five_edit = NintyFive::where(['AssessmentID' => $assessment_id, 'GradeID' => $grade_id, 'GenderID' => $gender_id])->first();
        $assessments = Assessment::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name','ASC')->get();
        $grades = Grade::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name','ASC')->get();
        $genders = Gender::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Gender','ASC')->get();
        return view('front.ninty_five.add', compact('ninty_five_edit', 'assessments', 'grades', 'genders'));
    }

    public function showForm(Request $request)
    {
        $assessments = Assessment::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name','ASC')->get();
        $grades = Grade::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name','ASC')->get();
        $genders = Gender::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Gender','ASC')->get();
        return view('front.ninty_five.add', compact('assessments', 'grades', 'genders'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\NintyFive  $grade
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, NintyFive $ninty_five)
    {

        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'assessment_id' => 'required',
                'gender_id' => 'required',
                'grade_id' => 'required',
                'percent' => 'required|regex:/^(([0-9]*)(\.([0-9]+))?)$/',
                'use_segment' => 'required',
                // 'image' => 'image|mimes:jpeg,jpg,png'
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $ninty_five_update = NintyFive::where(['AssessmentID' => $request->assessment_id, 'GradeID' => $request->grade_id, 'GenderID' => $request->gender_id])->first();
            $data = [
                'AssessmentID' => $request->assessment_id,
                'GenderID' => $request->gender_id,
                'GradeID' => $request->grade_id,
                'Percent' => $request->percent,
                'UseSegment' => $request->use_segment,
                'ColorSegment' => $request->color_segment,
                'DistanceToRed' => $request->distance_to_red,
                'RL' => $request->RL,
                'RU' => $request->RU,
                'BL' => $request->BL,
                'BU' => $request->BU,
                'GL' => $request->GL,
                'GU' => $request->GU,
                'OL' => $request->OL,
                'OU' => $request->OU,
                'VL' => $request->VL,
                'VU' => $request->VU,
                'YL' => $request->YL,
                'YU' => $request->YU,
                'PL' => $request->PL,
                'PU' => $request->PU,
                'WL' => $request->WL,
                'WU' => $request->WU,
                'UpdatedBy' => Auth::user()->id
            ];
            if ($request->hasFile('image')) {
                try {
                    if (file_exists(public_path("images/ninty_five/" . $ninty_five_update->Image))) {
                        unlink(public_path("images/ninty_five/" . $ninty_five_update->Image));
                    }
                } catch (\Exception $e) {
                    Log::info($e->getMessage());
                }
            }
            if ($request->hasFile('image')) {
                $files = $request->file('image');
                $image_name = md5(rand(1000, 10000));
                $file_with_ext = strtolower($files->getClientOriginalName());
                $filename = pathinfo($file_with_ext, PATHINFO_FILENAME);
                $ext = $files->getClientOriginalExtension();
                $image_full_name = $filename . '_' . time() . '.' . $ext;
                $path = $files->move(public_path('images/ninty_five/'), $image_full_name);
                $data = [
                    'Image' => $image_full_name
                ];
                // $ninty_five_update->Image = $image_full_name;
            }
            $ninty_five_update = NintyFive::where(['AssessmentID' => $request->assessment_id, 'GradeID' => $request->grade_id, 'GenderID' => $request->gender_id])->update($data);
            // $ninty_five_update->AssessmentID = $request->assessment_id;
            // $ninty_five_update->GenderID = $request->gender_id;
            // $ninty_five_update->GradeID = $request->grade_id;
            // $ninty_five_update->Percent = $request->percent;
            // $ninty_five_update->UseSegment = $request->use_segment;
            // // $ninty_five_update->ColorSegment = $request->color_segment;
            // if ($request->hasFile('image')) {
            //     try {
            //         if (file_exists(public_path("images/ninty_five/" . $ninty_five_update->Image))) {
            //             unlink(public_path("images/ninty_five/" . $ninty_five_update->Image));
            //         }
            //     } catch (\Exception $e) {
            //         Log::info($e->getMessage());
            //     }
            // }
            // if ($request->hasFile('image')) {
            //     $files = $request->file('image');
            //     $image_name = md5(rand(1000, 10000));
            //     $file_with_ext = strtolower($files->getClientOriginalName());
            //     $filename = pathinfo($file_with_ext, PATHINFO_FILENAME);
            //     $ext = $files->getClientOriginalExtension();
            //     $image_full_name = $filename . '_' . time() . '.' . $ext;
            //     $path = $files->move(public_path('images/ninty_five/'), $image_full_name);
            //     $ninty_five_update->Image = $image_full_name;
            // }
            // $ninty_five_update->UpdatedBy = Auth::user()->id;
            // $ninty_five_update->update();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('ninty_five.view')->with('success', 'Ninty Five Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\NintyFive  $grade
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $ninty_five_delete = NintyFive::find($id)->delete();
        return back()->with('success', 'Ninty Five Trash Successfully');
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
            $grade_bulk_delete = NintyFive::find($id)->delete();
        }
        return back()->with('success', 'Ninty Five Deleted Successfully');
    }
}
