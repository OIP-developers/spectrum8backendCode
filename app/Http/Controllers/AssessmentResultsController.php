<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Event;
use App\Models\Grade;
use App\Models\Assessment;
use Illuminate\Http\Request;
use App\Models\AssessmentResults;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\AssessmentResultsExport;
use Illuminate\Support\Facades\Validator;

class AssessmentResultsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $results = AssessmentResults::with(['resultParticipant', 'assessment_scoring_data', 'assessments', 'resultGender', 'resultGrade', 'resultEvent', 'assessment_scoring_data.color'])->where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        $results = AssessmentResults::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();

        // $results = AssessmentResults::join('assessments', 'assessment_results.assessment_id', '=', 'assessments.id')
        // ->join('participantes', 'assessment_results.participant_id', '=', 'participantes.id')
        // ->join('groups', 'assessment_results.group_id' , '=' ,'groups.id')
        // ->join('grades', 'assessment_results.grade_id' , '=' ,'grades.id')
        // ->join('assessment_scorings', 'assessment_results.assessment_score_id' , '=' ,'assessment_scorings.id')
        // ->select('assessment_results.distance as assesst_distance','assessment_results.duration as assesst_duration','assessment_results.beep as assesst_beep','assessment_results.score as assesst_score','assessments.Name', 'participantes.Firstname','participantes.Lastname','groups.Name as Group_Name','groups.Abbr as Group_Abbr','assessment_scorings.Score_target','grades.Name as grade_name')->get();
        $assessments = Assessment::where("CreatedBy", Auth::user()->id)->get();
        $grades = Grade::where("CreatedBy", Auth::user()->id)->get();
        $events = Event::where("CreatedBy", Auth::user()->id)->get();
        // $results = AssessmentResults::join('assessments')->get();
        return view('front.result.view', compact(['results', 'assessments', 'grades', 'events']));
    }

    public function trash()
    {
        $results = AssessmentResults::onlyTrashed()->where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.result.trash', compact('results'));
    }
    public function restore($id)
    {
        $participants_restore = AssessmentResults::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $results = AssessmentResults::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.result.archive', compact('results'));
    }
    public function toggleArchive($id)
    {
        $results = AssessmentResults::find($id);
        if ($results->is_archive == 'true') {
            $results->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $results->is_archive = 'true';
            $mxg = "Archive";
        }
        $results->save();
        return back()->with('success', 'Result ' . $mxg . ' Successfully');
    }

    public function export()
    {
        return Excel::download(new AssessmentResultsExport, 'results.xlsx');
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\AssessmentResults  $assessmentResults
     * @return \Illuminate\Http\Response
     */
    public function show(AssessmentResults $assessmentResults)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\AssessmentResults  $assessmentResults
     * @return \Illuminate\Http\Response
     */
    public function edit(AssessmentResults $assessmentResults)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\AssessmentResults  $assessmentResults
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, AssessmentResults $assessmentResults)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\AssessmentResults  $assessmentResults
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $participant_delete = AssessmentResults::find($id)->delete();
        return back()->with('success', 'Result Trash Successfully');
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
            $result_bulk_delete = AssessmentResults::find($id)->delete();
        }
        return back()->with('success', 'Colors Deleted Successfully');
    }
    public function filterResult(Request $request)
    {
        // dd($request->all());
        $number = $request->top_filter;
        $assessment_type = $request->assesssment_type;
        $grade_id = $request->grade;
        $group_id = $request->group;
        $event_id = $request->event;
        $daterange = $request->daterange;
        $date_check = explode(' - ', $request->daterange);
        // dd(date_format('Y-m-d',$date_check[0]),$date_check[0]);
        if (!empty($daterange)) {
            $start = Carbon::parse($date_check[0])->format('Y-m-d');
            $end = Carbon::parse($date_check[1])->format('Y-m-d');
        }
        $assessments = Assessment::where("CreatedBy", Auth::user()->id)->get();
        $grades = Grade::where("CreatedBy", Auth::user()->id)->get();
        $events = Event::where("CreatedBy", Auth::user()->id)->get();
        if ($number == '' && $assessment_type == '' &&  $grade_id == '' && $group_id == '' && empty($daterange)) {
            $results_data1 = AssessmentResults::where("CreatedBy", Auth::user()->id)->with(['resultParticipant', 'assessment_scoring_data', 'assessments', 'resultGender', 'resultGrade', 'resultEvent', 'assessment_scoring_data.color'])
                ->orderBy('Score', 'DESC')
                ->get();
            $results_data = $results_data1->groupBy('participant_id');
        } elseif ($number != '' && $assessment_type == '' &&  $grade_id == '' && $group_id == '' && empty($daterange)) {
            $results_data1 = AssessmentResults::where("CreatedBy", Auth::user()->id)->with(['resultParticipant', 'assessment_scoring_data', 'assessments', 'resultGender', 'resultGrade', 'resultEvent', 'assessment_scoring_data.color'])
                ->orderBy('Score', 'DESC')
                ->get();
            // dd($results_data1);
            $results_data = $results_data1->groupBy('participant_id')->take($number);
        } else {
            if (empty($daterange)) {
                $results_data1 = AssessmentResults::where("CreatedBy", Auth::user()->id)->with(['resultParticipant', 'assessment_scoring_data', 'assessments', 'resultGender', 'resultGrade', 'resultEvent', 'assessment_scoring_data.color'])
                    ->where('assessment_id', $assessment_type)
                    ->orWhere('grade_id', $grade_id)
                    ->orWhere('group_id', $group_id)
                    ->orWhere('event_id', $event_id)
                    ->orderBy('Score', 'DESC')
                    ->get();
                $results_data = $results_data1->groupBy('participant_id')->take($number);
            } else {
                $results_data1 = AssessmentResults::where("CreatedBy", Auth::user()->id)->with(['resultParticipant', 'assessment_scoring_data', 'assessments', 'resultGender', 'resultGrade', 'resultEvent', 'assessment_scoring_data.color'])
                    ->whereDate('created_at', '>=', $start)
                    ->whereDate('created_at', '<=', $end)
                    ->where('assessment_id', $assessment_type)
                    ->orWhere('grade_id', $grade_id)
                    ->orWhere('group_id', $group_id)
                    ->orWhere('event_id', $event_id)
                    ->orderBy('Score', 'DESC')
                    ->get();
                $results_data = $results_data1->groupBy('participant_id')->take($number);
                // dd($results_data->first()->first()->resultGrade->first()->Name);
            }
        }
        return view('front.result.view', compact(['results_data', 'number', 'assessment_type', 'grade_id', 'group_id', 'grades', 'assessments', 'daterange', 'event_id', 'events']));
    }
}
