<?php

namespace App\Http\Controllers;

use App\Models\Color;
use App\Models\Assessment;
use App\Models\Instruction;
use Illuminate\Http\Request;
use App\Models\AssessmentType;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Auth;
use App\Models\FacilitatorInstruction;
use Illuminate\Support\Facades\Validator;
use Symfony\Component\Console\Input\Input;

class AssessmentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $assessments = Assessment::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->with(['assessment_type', 'colors'])->get();
        return view('front.assessment.view', compact('assessments'));
    }
    public function trash()
    {
        $assessments = Assessment::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.assessment.trash', compact('assessments'));
    }
    public function restore($id)
    {
        $assessments_restore = Assessment::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }

    public function archive()
    {
        $assessments = Assessment::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.assessment.archive', compact('assessments'));
    }
    public function toggleArchive($id)
    {
        $assessments = Assessment::find($id);
        if ($assessments->is_archive == 'true') {
            $assessments->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $assessments->is_archive = 'true';
            $mxg = "Archive";
        }
        $assessments->save();
        return back()->with('success', 'Assessment ' . $mxg . ' Successfully');
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
                'ShortName' => 'required|max:25',
                'NickName' => 'required|max:15',
                'Abbr' => 'required|max:4',
                'max_participants' => 'required|max:11',
                'sort' => 'required|max:11',
                'assessment_type_id' => 'required',
                'color_id' => 'required',
                'Setup' => 'required',
                'Instructions' => 'required',
                'EvalList' => 'required',
                'image' => 'required|image|mimes:jpeg,jpg,png',
                'video' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $assessments = new Assessment;
            $assessments->Name = $request->name;
            $assessments->ShortName = $request->ShortName;
            $assessments->NickName = $request->NickName;
            $assessments->Abbr = $request->Abbr;
            $assessments->MaxParticipants = $request->max_participants;
            $assessments->Sort = $request->sort;
            $assessments->AssessmentTypeID = $request->assessment_type_id;
            $assessments->ColorID = $request->color_id;
            $assessments->Setup = $request->Setup;
            $assessments->Instructions = $request->Instructions;
            $assessments->EvalList = $request->EvalList;
            if ($request->hasFile('image')) {
                $files = $request->file('image');
                $image_name = md5(rand(1000, 10000));
                $file_with_ext = strtolower($files->getClientOriginalName());
                $filename = pathinfo($file_with_ext, PATHINFO_FILENAME);
                $ext = $files->getClientOriginalExtension();
                $image_full_name = $filename . '_' . time() . '.' . $ext;
                $path = $files->move(public_path('images/assessment_image/'), $image_full_name);
                $assessments->Image = $image_full_name;
            }
          
            if ($request->hasFile('video')) {
                $files = $request->file('video');
                $image_name = md5(rand(1000, 10000));
                $file_with_ext = strtolower($files->getClientOriginalName());
                $filename = pathinfo($file_with_ext, PATHINFO_FILENAME);
                $ext = $files->getClientOriginalExtension();
                $image_full_name = $filename . '_' . time() . '.' . $ext;
                $path = $files->move(public_path('images/assessment_image/'), $image_full_name);
                $assessments->video = $image_full_name;
            }

            $assessments->CreatedBy = Auth::user()->id;
            $assessments->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Assessment Add Successfully');
    }
    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Assessment  $assessment
     * @return \Illuminate\Http\Response
     */
    public function showForm()
    {
        $assessment_type = AssessmentType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $colors = Color::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.assessment.add', compact('assessment_type', 'colors'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Assessment  $assessment
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $assessments_edit = Assessment::where('id', $request->id)->first();
        $assessment_type = AssessmentType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $colors = Color::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.assessment.add', compact('assessments_edit', 'assessment_type', 'colors'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Assessment  $assessment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Assessment $assessment)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|max:100',
                'ShortName' => 'required|max:25',
                'NickName' => 'required|max:15',
                'Abbr' => 'required|max:4',
                'max_participants' => 'required|max:11',
                'sort' => 'required|max:11',
                'assessment_type_id' => 'required',
                'color_id' => 'required',
                'Setup' => 'required',
                'Instructions' => 'required',
                'EvalList' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $id = $request->id;
            $assessments_update = Assessment::find($id);
            if (isset($assessments_update)) {
                if ($request->hasFile('image')) {
                    try {
                        if (file_exists(public_path('images/assessment_image/' . $assessments_update->Image))) {
                            unlink(public_path('images/assessment_image/' . $assessments_update->Image));
                        }
                    } catch (\Exception $e) {
                        Log::info($e->getMessage());
                    }
                }
                if ($request->hasFile('video')) {
                    try {
                        if (file_exists(public_path('images/assessment_image/' . $assessments_update->video))) {
                            unlink(public_path('images/assessment_image/' . $assessments_update->video));
                        }
                    } catch (\Exception $e) {
                        Log::info($e->getMessage());
                    }
                }
            }
            $assessments_update->Name = $request->name;
            $assessments_update->ShortName = $request->ShortName;
            $assessments_update->NickName = $request->NickName;
            $assessments_update->Abbr = $request->Abbr;
            $assessments_update->MaxParticipants = $request->max_participants;
            $assessments_update->Sort = $request->sort;
            $assessments_update->AssessmentTypeID = $request->assessment_type_id;
            $assessments_update->ColorID = $request->color_id;
            $assessments_update->Setup = $request->Setup;
            $assessments_update->Instructions = $request->Instructions;
            $assessments_update->EvalList = $request->EvalList;
            if ($request->hasFile('image')) {
                $files = $request->file('image');
                $image_name = md5(rand(1000, 10000));
                $file_with_ext = strtolower($files->getClientOriginalName());
                $filename = pathinfo($file_with_ext, PATHINFO_FILENAME);
                $ext = $files->getClientOriginalExtension();
                $image_full_name = $filename . '_' . time() . '.' . $ext;
                $path = $files->move(public_path('images/assessment_image/'), $image_full_name);
                $assessments_update->Image = $image_full_name;
            }
          
            if ($request->hasFile('video')) {
                $files = $request->file('video');
                $image_name = md5(rand(1000, 10000));
                $file_with_ext = strtolower($files->getClientOriginalName());
                $filename = pathinfo($file_with_ext, PATHINFO_FILENAME);
                $ext = $files->getClientOriginalExtension();
                $image_full_name = $filename . '_' . time() . '.' . $ext;
                $path = $files->move(public_path('images/assessment_image/'), $image_full_name);
                $assessments_update->video = $image_full_name;
            }
            $assessments_update->UpdatedBy = Auth::user()->id;
            $assessments_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('assessment.view')->with('success', 'Assessment Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Assessment  $assessment
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $assessments_delete = Assessment::find($id);
        if (isset($assessments_delete)) {
            // try{
            //   if(file_exists(public_path("images/assessment_image/".$assessments_delete->Image))){
            //       unlink(public_path("images/assessment_image/".$assessments_delete->Image));
            //     }
            //        }catch(\Exception $e){
            //         Log::info($e->getMessage());
            //   }

            Assessment::where('id', $id)->delete();
            return back()->with('success', 'Assessment Trash Successfully');
        } else {
            return back()->with('error', 'Record not found');
        }
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

        // $validator = Validator::make($request->all(), [
        //     'bulk_action' => 'required',
        // ]);
        // if ($validator->fails()) {
        //     return redirect()->back()->withInput()->withErrors($validator);
        // }
        foreach ($request->bulk_action as $id) {
            $assessment_bulk_delete = Assessment::find($id);
            if (isset($assessment_bulk_delete)) {
                try {
                    if (file_exists(public_path("images/assessment_image/" . $assessment_bulk_delete->Image))) {
                        unlink(public_path("images/assessment_image/" . $assessment_bulk_delete->Image));
                    }
                } catch (\Exception $e) {
                    Log::info($e->getMessage());
                }

                Assessment::where('id', $id)->delete();
                // return back()->with('success', 'Assessment Delete Successfully');
            }
            // else{
            //     return back()->with('error', 'Record not found');
            // }
        }
        return back()->with('success', 'Assessments Deleted Successfully');
    }

    public function status(Request $request)
    {
        $find = $request->id['id'];
        $status = Assessment::find($find);
        $status->status = $request->data_val;
        $status->save();
        // return back()->with('success','Status Update Successfully');
        return response()->json(['success' => 'Status Updated Successfully']);
    }
    public function instruction_form(Request $request)
    {
        $assessments = Assessment::where('status', 0)->where("CreatedBy", Auth::user()->id)->get();
        return view('front.instruction.add', compact('assessments'));
    }
    public function instruction_add(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'assessment' => 'required',
            'instruction' => 'required',
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }
        $instruction = new FacilitatorInstruction;
        $instruction->assessment_id = $request->assessment;
        $instruction->instructions = $request->instruction;
        $instruction->CreatedBy = Auth::user()->id;
        $instruction->save();
        return back()->with('success', 'Instructoin Add Successfully');
    }
    public function instruction_update(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'assessment' => 'required',
            'instruction' => 'required',
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }
        $instruction = FacilitatorInstruction::find($request->id);
        $instruction->assessment_id = $request->assessment;
        $instruction->instructions = $request->instruction;
        $instruction->save();
        return back()->with('success', 'Instructoin Update Successfully');
    }
    public function instruction_index()
    {
        // $instruction_show = FacilitatorInstruction::where("CreatedBy",Auth::user()->id)->join('assessments','facilitator_instructions.assessment_id','=','assessments.id')
        // ->select('facilitator_instructions.*','assessments.Name as assessment_name')->get();
        if (Auth::user()->id == 1) {
            $instruction_show = FacilitatorInstruction::where('is_archive', 'false')->where("CreatedBy", Auth::user()->id)->with('assessment')->get();
        } else {
            $complete_data = [Auth::user()->id, 1];
            $instruction_show = FacilitatorInstruction::where('is_archive', 'false')->whereIn("CreatedBy", $complete_data)->with('assessment')->get();
        }
        return view('front.instruction.view', compact('instruction_show'));
    }
    public function instructiontrash()
    {
        $instruction_show = FacilitatorInstruction::onlyTrashed()->get();
        return view('front.instruction.trash', compact('instruction_show'));
    }
    public function instructionrestore($id)
    {
        $instruction_show_restore = FacilitatorInstruction::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function instructionArchive()
    {
        $instruction_show = FacilitatorInstruction::where('is_archive', 'true')->get();
        return view('front.instruction.archive', compact('instruction_show'));
    }
    public function instructionToggleArchive($id)
    {
        $instruction_show = FacilitatorInstruction::find($id);
        if ($instruction_show->is_archive == 'true') {
            $instruction_show->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $instruction_show->is_archive = 'true';
            $mxg = "Archive";
        }
        $instruction_show->save();
        return back()->with('success', 'Instruction ' . $mxg . ' Successfully');
    }
    public function instruction_edit(Request $request)
    {
        $assessments = Assessment::where('status', 0)->get();
        $instruction_edit = FacilitatorInstruction::find($request->id);
        return view('front.instruction.add', compact('instruction_edit', 'assessments'));
    }
    public function instruction_delete(Request $request)
    {
        $instruction_edit = FacilitatorInstruction::find($request->id)->delete();
        return back()->with('success', 'Instructoin Trash Successfully');
    }

    public function instruction_bulkDelete(Request $request)
    {
        $rules = [
            'bulk_action' => 'required',
        ];

        $customMessages = [
            'required' => 'Select Atleast One Record'
        ];

        $this->validate($request, $rules, $customMessages);

        // $validator = Validator::make($request->all(), [
        //     'bulk_action' => 'required',
        // ]);
        // if ($validator->fails()) {
        //     return redirect()->back()->withInput()->withErrors($validator);
        // }
        foreach ($request->bulk_action as $id) {
            $instruction_bulk_delete = FacilitatorInstruction::find($id)->delete();
        }
        return back()->with('success', 'Instructions Deleted Successfully');
    }

    public function getAssessmentType(Request $request)
    {
        $assessment_type = Assessment::where('id', $request->data_val)->orderBy('id', 'DESC')->get();
        return response()->json(['data' => $assessment_type]);
    }
}
