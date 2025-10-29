<?php

namespace App\Http\Controllers;

use App\Models\Event;
use App\Models\Assessment;
use Illuminate\Http\Request;
use App\Models\EventAssessment;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class EventAssessmentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $event_assessments = EventAssessment::where(['is_archive' => 'false', 'Status' => 1])->with('event', 'assessment')->orderBy('id', 'DESC')->get();
        return view('front.event_assessment.view', compact('event_assessments'));
    }
    public function trash()
    {
        $event_assessments = EventAssessment::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.event_assessment.trash', compact('event_assessments'));
    }
    public function restore($id)
    {
        $event_assessments_restore = EventAssessment::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $event_assessments = EventAssessment::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.event_assessment.archive', compact('event_assessments'));
    }
    public function toggleArchive($id)
    {
        $event_assessments = EventAssessment::find($id);
        if ($event_assessments->is_archive == 'true') {
            $event_assessments->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $event_assessments->is_archive = 'true';
            $mxg = "Archive";
        }
        $event_assessments->save();
        return back()->with('success', 'Event Assessment ' . $mxg . ' Successfully');
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
                'event' => 'required',
                'assessment' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $event_assessment = new EventAssessment;
            $event_assessment->EventID = $request->event;
            $event_assessment->AssessmentID = $request->assessment;
            $event_assessment->CreatedBy = Auth::user()->id;
            $event_assessment->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Event Assessment Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\EventAssessment  $event_assessment
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $event_assessment_edit = EventAssessment::where('id', $request->id)->first();
        $events = Event::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $assessments = Assessment::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.event_assessment.add', compact('events', 'assessments', 'event_assessment_edit'));
    }

    public function showForm(Request $request)
    {
        $events = Event::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $assessments = Assessment::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.event_assessment.add', compact('events', 'assessments'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\EventAssessment  $event_assessment
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, EventAssessment $event_assessment)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'event' => 'required',
                'assessment' => 'required',
            ]);

            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;
            $event_assessment_update = EventAssessment::find($id);
            $event_assessment_update->EventID = $request->event;
            $event_assessment_update->AssessmentID = $request->assessment;
            $event_assessment_update->UpdatedBy = Auth::user()->id;
            $event_assessment_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('event_assessment.view')->with('success', 'Event Assessment Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\EventAssessment  $event_assessment
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $event_assessment_delete = EventAssessment::find($id)->delete();
        return back()->with('success', 'Event Assessment Trash Successfully');
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
            $event_assessment_bulk_delete = EventAssessment::find($id)->delete();
        }
        return back()->with('success', 'Event Assessments Deleted Successfully');
    }
}
