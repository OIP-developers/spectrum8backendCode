<?php

namespace App\Http\Controllers\Api;

use App\Models\Grade;
use App\Models\Group;
use App\Models\Assessment;
use App\Models\Participant;
use App\Models\Participante;
use Illuminate\Http\Request;
use App\Models\AssessmentResults;
use App\Models\AssessmentScoring;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Api\BaseController as BaseController;

class ParticipanteController  extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
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
    public function store(Request $request)
    {

        $validator = Validator::make($request->all(), [
            'lastname' => 'required',
            'firstname' => 'required',
            'gender' => 'required',
            'groupid' => 'required',
        ]);

        if ($validator->fails()) {
            return $this->sendError('Validation Error.', $validator->errors(), 400);
        }

        try {

            if ($request->input()) {

                $content = new Participante();
                $insertedRecord = $content->addData($request);
                if ($insertedRecord) {
                    return $this->sendResponse($insertedRecord, 'Participante Added successfully .');
                } else {
                    return $this->sendError('SomeThing went wrong', ['error' => 'Assesment Not Added.']);
                }
            }
        } catch (\Exception $ex) {
            return $ex;
            return $this->sendError($ex->getMessage(), ['error' => '404']);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Participante  $participante
     * @return \Illuminate\Http\Response
     */
    public function show(Participante $participante)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Participante  $participante
     * @return \Illuminate\Http\Response
     */
    public function edit(Participante $participante)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Participante  $participante
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Participante $participante)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Participante  $participante
     * @return \Illuminate\Http\Response
     */
    public function destroy(Participante $participante)
    {
        //
    }

    public function getParticipant(Request $request)
    {

        try {

            $participantes = Participante::Where('group_id', $request->group_id)->with('groups')->get();

            if (!$participantes->isEmpty()) {
                return $this->sendResponse($participantes, 'Fetched successfully.');
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage(), ['error' => '404']);
        }
    }
    public function ParticipantIndex(Request $request)
    {
        try {


            // $participant = AssessmentResults::where('participant_id',$request->id)
            // ->join('assessments','assessment_results.assessment_id' ,'=','assessments.id')
            // ->select('assessments.*')
            // ->get();

            // $check = AssessmentResults::where('participant_id',$request->id)
            // ->join('assessments','assessment_results.assessment_id' ,'=','assessments.id')
            // ->join('assessment_scorings','assessment_results.assessment_score_id' ,'=','assessment_scorings.color_id')
            // ->join('colors','assessment_scorings.color_id' ,'=','colors.id')
            // ->select('assessments.*','colors.WebColor as color_code','colors.id as color_id')
            // ->get();


            // $participant = AssessmentResults::where('participant_id',$request->id)->with(['assessment_scoring_data','assessments'])
            // $participant = AssessmentResults::where('participant_id',$request->id)
            // ->join('assessments','assessment_results.assessment_id' ,'=','assessments.id')
            // ->join('assessment_scorings','assessment_results.assessment_score_id' ,'=','assessment_scorings.color_id')
            // ->join('colors','assessment_scorings.color_id' ,'=','colors.id')
            // // ->select('assessments.*','colors.WebColor as color_code','colors.id as color_id')
            // ->get();

            $participant = AssessmentResults::with('assessments', 'assessments.assessment_scoring', 'participantEventResult')->where('participant_id', $request->id)->orderBy('id', 'DESC')->get();
            // dd($participant);
            // return   Assessment::with('assessment_results','assessment_scoring')->get();

            if (!$participant->isEmpty()) {
                return $this->sendResponse($participant, 'Fetched successfully.');
            } else {
                return $this->sendError('Invalid.', ['error' => 'Data not exist.'], 200);
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage(), ['error' => '404']);
        }
    }

    public function ParticipantData(Request $request)
    {
        try {

            $participant_all = Participante::join('groups', 'participantes.group_id', '=', 'groups.id')
                ->join('grades', 'participantes.grade_id', '=', 'grades.id')
                ->select('participantes.*', 'groups.Name as group_name', 'groups.Abbr as group_abbr', 'grades.Name as grade_name')
                ->orderBy('Firstname', 'asc')
                ->get();
            if (!$participant_all->isEmpty()) {
                return $this->sendResponse($participant_all, 'Fetched successfully.');
            } else {
                return $this->sendError('Invalid.', ['error' => 'Data not exist.']);
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage(), ['error' => '404']);
        }
    }
    public function participant_status(Request $request)
    {
        try {

            $participant = Participant::find($request->id);
            if (!empty($participant)) {
                if ($participant->Status == 0) {
                    $participant->Status = 1;
                    $participant->save();
                } elseif ($participant->Status == 1) {
                    $participant->Status = 0;
                    $participant->save();
                }

                return $this->sendResponse($participant, 'Fetched successfully.');
            } else {
                return $this->sendError('Invalid.', ['error' => 'Data not exist.'], 200);
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage(), ['error' => '404']);
        }
    }

    public function Assessment_test(Request $request)
    {
        try {
            $participant_test = AssessmentScoring::where('assessment_id', 3)->get();

            if (!$participant_test->isEmpty()) {
                return $this->sendResponse($participant_test, 'Fetched successfully.');
            } else {
                return $this->sendError('Invalid.', ['error' => 'Data not exist.']);
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage(), ['error' => '404']);
        }
    }
    public function ParticipantFilter(Request $request)
    {

        try {
            if (count($request->gender) > 1) {
                $participant_filter = Participante::where(['group_id' => $request->group_id, 'grade_id' => $request->grade_id, 'status' => 0])->get();
            } else {
                $participant_filter = Participante::where(['Gender' => $request->gender, 'group_id' => $request->group_id, 'grade_id' => $request->grade_id, 'status' => 0])->get();
            }
            if (!$participant_filter->isEmpty()) {
                return $this->sendResponse($participant_filter, 'Fetched successfully.');
            } else {
                return $this->sendError('Invalid.', ['error' => 'Data not exist.'], 200);
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage(), ['error' => '404']);
        }
    }
}
