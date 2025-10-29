<?php

namespace App\Http\Controllers\Api;

use App\Models\Faq;
use App\Models\User;
use App\Models\Color;
use App\Models\Event;
use App\Models\Grade;
use App\Models\Group;
use App\Models\Assessment;
use App\Models\Percentile;
use Illuminate\Http\Request;
//use App\Http\Resources\AssessmentResource;
use App\Models\AssessmentResults;
use App\Models\AssessmentScoring;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\FacilitatorInstruction;
use Illuminate\Support\Facades\Validator;
use App\Http\Resources\AssessmentResource;
use App\Http\Requests\AssessmentStoreRequest;
use App\Http\Controllers\Api\BaseController as BaseController;

class DashboardController extends BaseController
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    //  Assessment Functions


    public function test()
    {
        // $client = new \Ably\AblyRest('Wcbs9w.CsxYNQ:uHtRcafdNc-nEHWjbTjN791dfR0FBm9ls10J2aQBxk4');
        $client = new \Ably\AblyRest('GB15rw.5ontmA:MBH5BOzcml0w-JEGUwQN39_3YQSD1S9hs4qYu4qOtBY');
        $channel = $client->channel('test');
        $channel->publish('myEvent', 'tum say nh ho paiga!');
    }

    public function index()
    {
        // $assessment = Assessment::get();
        //return AssessmentResource::collection($assessment);
        try {

            $assessment = Assessment::where('status', 0)->get();

            if (!$assessment->isEmpty()) {
                return $this->sendResponse($assessment, 'Fetched successfully.');
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

    public function AssessmentIdScore($id)
    {
        try {

            $assessment_by_id = AssessmentScoring::where('assessment_id', $id)->get();

            if (!$assessment_by_id->isEmpty()) {
                return $this->sendResponse($assessment_by_id, 'Fetched successfully.');
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
            'name' => 'required',
            'MaxParticipants' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => "All Fields Are Mendatory"
            ]);
        }

        try {

            if ($request->input()) {

                $content = new Assessment();
                $insertedRecord = $content->addData($request);
                if ($insertedRecord) {
                    return $this->sendResponse($insertedRecord, 'Assesment Added successfully .');
                } else {
                    return $this->sendError('SomeThing went wrong', ['error' => 'Assesment Not Added.']);
                }
            }
        } catch (\Exception $ex) {
            //return $ex;
            return $this->sendError($ex->getMessage(), ['error' => '404']);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        // dd($id);
        try {

            $assessment_id = Assessment::with('assessment_scoring')->where('id', $id)->get();

            if (!$assessment_id->isEmpty()) {
                // dd($assessment_id);
                return $this->sendResponse($assessment_id, 'Fetched successfully.');
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return $e;
            return $this->sendError($e->getMessage(), ['error' => '404']);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'MaxParticipants' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => "All Fields Are Mendatory"
            ]);
        }
        $assessment = Assessment::find($id);
        // dd($assessment);
        $data = [
            "name" => $request->name,
            "MaxParticipants" => $request->MaxParticipants
        ];
        $assessment = Assessment::where('id', $request->id)->update($data);
        if ($assessment) {
            return response()->json([
                'message' => "Record Updated Successfully"
            ]);
        }
        // return new AssessmentResource($assessment);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        // dd($request->id);
        $assesst = Assessment::where("id", $id)->delete();
        if ($assesst) {
            return response()->json([
                'message' => "Record Deleted Successfully"
            ]);
        } else {
            return response()->json([
                'message' => "Record Not Found"
            ]);
        }
    }

    //  Assessment Functions

    //  Group Functions

    public function groupData()
    {
        try {

            $assessment = Group::where('status', 0)->get();

            if (!$assessment->isEmpty()) {
                return $this->sendResponse($assessment, 'Fetched successfully.');
            } else {
                return $this->sendError('Invalid.', ['error' => 'Data not exist.']);
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage(), ['error' => '404']);
        }
    }
    public function gradeData()
    {
        try {

            $assessment = Grade::get();

            if (!$assessment->isEmpty()) {
                return $this->sendResponse($assessment, 'Fetched successfully.');
            } else {
                return $this->sendError('Invalid.', ['error' => 'Data not exist.']);
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage(), ['error' => '404']);
        }
    }

    //  color Functions

    public function colorData()
    {

        try {

            $assessment = Color::OrderBy('Sort', 'ASC')->get();

            if (!$assessment->isEmpty()) {
                return $this->sendResponse($assessment, 'Fetched successfully.');
            } else {
                return $this->sendError('Invalid.', ['error' => 'Data not exist.']);
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage(), ['error' => '404']);
        }
    }


    public function addAssessmentScore(Request $request)
    {

        try {

            $validator = Validator::make($request->all(), [
                'name' => 'required',

            ]);

            if ($validator->fails()) {
                return response()->json([
                    'message' => "All Fields Are Mendatory"
                ]);
            }

            try {

                if ($request->input()) {

                    $content = new AssessmentScoring();
                    $insertedRecord = $content->addData($request);
                    if ($insertedRecord) {
                        return $this->sendResponse($insertedRecord, 'Assesment Added successfully .');
                    } else {
                        return $this->sendError('SomeThing went wrong', ['error' => 'Assesment Not Added.']);
                    }
                }
            } catch (\Exception $ex) {
                return $ex;
                return $this->sendError($ex->getMessage(), ['error' => '404']);
            }
        } catch (\Exception $e) {
            return $e;
            return $this->sendError($e->getMessage(), ['error' => '404']);
        }
    }

    public function AssessmentScoreGet(Request $request)
    {

        try {

            $assesssmentscore = AssessmentScoring::join('colors', 'assessment_scorings.color_id', '=', 'colors.id')
                ->select('assessment_scorings.*', 'colors.WebColor as color_code', 'colors.Sort as color_sort')->get();
            if (!$assesssmentscore->isEmpty()) {
                return $this->sendResponse($assesssmentscore, 'Fetched successfully.');
            } else {
                return $this->sendError('Invalid.', ['error' => 'Data not exist.']);
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage(), ['error' => '404']);
        }
    }
    public function AssessmentResultGet(Request $request)
    {

        try {

            $assesssmentresult = AssessmentResults::get();

            if (!$assesssmentresult->isEmpty()) {
                return $this->sendResponse($assesssmentresult, 'Fetched successfully.');
            } else {
                return $this->sendError('Invalid.', ['error' => 'Data not exist.'], 200);
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage(), ['error' => '404']);
        }
    }
    public function instruction_get()
    {
        try {

            $instruction = FacilitatorInstruction::join('assessments', 'facilitator_instructions.assessment_id', '=', 'assessments.id')->select('facilitator_instructions.*', 'assessments.Name as assessment_name', 'assessments.Image as assessment_image')->get();

            if (!$instruction->isEmpty()) {
                return $this->sendResponse($instruction, 'Fetched successfully.');
            } else {
                return $this->sendError('Invalid.', ['error' => 'Data not exist.'], 200);
            }
        } catch (\Exception $e) {
            return $e;
            return $this->sendError($e->getMessage(), ['error' => '404']);
        }
    }

    // public function AssessmentResultPost(Request $request)
    // {
    //     $validator = Validator::make($request->all(), [
    //         'assessment_score_id' => 'required',
    //         'assessment_id' => 'required',
    //         'participant_id' => 'required',
    //         'Score' => 'required',
    //         'grade_id' => 'required',
    //         'group_id' => 'required',
    //         'event_id' => 'required',
    //         // 'teacher_id' => 'required'
    //     ]);
    //     if ($validator->fails()) {
    //         return $this->sendError('Validation Error.', $validator->errors(),400);
    //     }
    //     try {
    //         $assest_result = new AssessmentResults();
    //         $insertedResult = $assest_result->addData($request);
    //         if ($insertedResult) {

    //             // $client = new \Ably\AblyRest('Wcbs9w.CsxYNQ:uHtRcafdNc-nEHWjbTjN791dfR0FBm9ls10J2aQBxk4');
    //             $client = new \Ably\AblyRest('GB15rw.5ontmA:MBH5BOzcml0w-JEGUwQN39_3YQSD1S9hs4qYu4qOtBY');

    //             $channel = $client->channel('test');


    //              $participant=AssessmentResults::with('assessments','assessments.assessment_scoring')->where(['participant_id'=>$request->participant_id,'id'=>$insertedResult->id])->get();
    //             //$content=AssessmentAssessmentScoring::where('id',$request->assessment_score_id)->first();
    //            // $content->participant_id=$request->participant_id;

    //             $da=json_encode($participant[0]);

    //             $channel->publish('myEvent', $da);
    //             return $this->sendResponse($participant[0], 'Result Added successfully .');
    //         } else {
    //             return $this->sendError('SomeThing went wrong', ['error' => 'Result Not Added.']);
    //         }

    //     } catch (\Exception $ex) {
    //         return $this->sendError($ex->getMessage(), ['error' => '404']);
    //     }
    // }
    public function AssessmentResultPost(Request $request)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'event_id' => 'required',
                'participant_id' => 'required',
                'assessment_id' => 'required',
                'grade_id' => 'required',
                'gender_id' => 'required',
                'color_id' => 'required',
                'results' => 'required|max:25',
                'dt_recorded' => 'required|date',
                'attempt' => 'required|integer',
                'percent' => 'required|integer'
            ]);
            if ($validator->fails()) {
                return $this->sendError('Validation Error.', $validator->errors(), 400);
            }
            $assest_result = new AssessmentResults();
            $insertedResult = $assest_result->addData($request);
            if ($insertedResult) {

                // $client = new \Ably\AblyRest('Wcbs9w.CsxYNQ:uHtRcafdNc-nEHWjbTjN791dfR0FBm9ls10J2aQBxk4');
                $client = new \Ably\AblyRest('GB15rw.5ontmA:MBH5BOzcml0w-JEGUwQN39_3YQSD1S9hs4qYu4qOtBY');

                $channel = $client->channel('test');


                $participant = AssessmentResults::where(['ParticipantID' => $request->participant_id, 'id' => $insertedResult->id])->get();
                //$content=AssessmentAssessmentScoring::where('id',$request->assessment_score_id)->first();
                // $content->participant_id=$request->participant_id;

                $da = json_encode($participant[0]);

                $channel->publish('myEvent', $da);
            }
        } catch (\Exception $ex) {
            return $ex;
            DB::rollback();
            return $this->sendError($ex->getMessage(), ['error' => '404']);
        }
        DB::commit();
        return $this->sendResponse($participant[0], 'Result Added successfully .', 200);
    }
    public function score_result(Request $request)
    {
        try {
            $score_result = AssessmentResults::where('assessment_id', $request->assessment_id)
                ->take($request->top_score)
                ->select('*')
                ->orderBy('Duration', 'asc')
                ->get();





            if (!$score_result->isEmpty()) {
                return $score_result->last();
            } else {
                return $this->sendError('Invalid.', ['error' => 'Data not exist.'], 200);
            }
        } catch (\Exception $ex) {
            //return $ex;
            return $this->sendError($ex->getMessage(), ['error' => '404']);
        }
    }

    public function eventData(Request $request)
    {
        try {
            $event = Event::where('status', 1)->get();

            if (!$event->isEmpty()) {
                return $this->sendResponse($event, ['Fetched successfully.'], 200);
            } else {
                return $this->sendError('Invalid.', ['error' => 'Data not exist.'], 400);
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage(), ['error' => '404']);
        }
    }
    public function percentileData(Request $request)
    {
        try {
            $percentile = Percentile::where('assessment_id', $request->assessment_id)->get();

            if (!$percentile->isEmpty()) {
                return $this->sendResponse($percentile, ['Fetched successfully.'], 200);
            } else {
                return $this->sendError('Invalid.', ['error' => 'Data not exist.'], 400);
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage(), ['error' => '404']);
        }
    }
    public function faqData(Request $request)
    {
        try {
            $faq = Faq::get();

            if (!$faq->isEmpty()) {
                return $this->sendResponse($faq, ['Fetched successfully.'], 200);
            } else {
                return $this->sendError('Invalid.', ['error' => 'Data not exist.'], 400);
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage(), ['error' => '404']);
        }
    }

    public function participantCount(Request $request)
    {

        try {

            // $assessment = AssessmentResults::where(['assessment_id'=>$request->assessment_id,'participant_id'=>$request->participant_id])->whereMonth('created_at', date('m'))->get();
            $assessment = AssessmentResults::where(['assessment_id' => $request->assessment_id, 'participant_id' => $request->participant_id, 'event_id' => $request->event_id])->get();
            $count = count($assessment);
            // dd(date('m'));
            if (!$assessment->isEmpty()) {
                return $this->sendResponse($count, 'Fetched successfully.', 200);
            } else {
                return $this->sendError('Invalid.', ['error' => 'Data not exist.'], 400);
            }
        } catch (\Exception $e) {
            return $this->sendError($e->getMessage(), ['error' => '404']);
        }
    }
}
