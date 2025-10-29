<?php

namespace App\Http\Controllers;

use App\Models\Event;
use App\Models\Contact;
use App\Models\EventType;
use App\Models\Organization;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class EventController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $events = Event::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.events.view', compact('events'));
    }

    public function trash()
    {
        $events = Event::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.events.trash', compact('events'));
    }
    public function restore($id)
    {
        $events_restore = Event::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $events = Event::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.events.archive', compact('events'));
    }
    public function toggleArchive($id)
    {
        $events = Event::find($id);
        if ($events->is_archive == 'true') {
            $events->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $events->is_archive = 'true';
            $mxg = "Archive";
        }
        $events->save();
        return back()->with('success', 'Event ' . $mxg . ' Successfully');
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function add(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'organization' => 'required',
            'name' => 'required|max:150',
            'start_date' => 'required',
            'start_time' => 'required',
            'end_date' => 'required',
            'end_time' => 'required',
            'contact' => 'required',
            'facility_name' => 'required|max:150',
            'facility_address' => 'required|max:150',
            'event' => 'required',
            // 'is_active' => 'required',
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        $events = new Event;
        $events->S8S_ID = Auth::user()->id;
        $events->OrganizationID = $request->organization;
        $events->Name = $request->name;
        $events->StartDate = $request->start_date;
        $events->StartTime = $request->start_time;
        $events->EndDate = $request->end_date;
        $events->EndTime = $request->end_time;
        $events->FacilityContactID = $request->contact;
        $events->FacilityName = $request->facility_name;
        $events->FacilityAddress = $request->facility_address;
        $events->EventTypeID = $request->event;
        $events->IsActive = 1;
        $events->CreatedBy = Auth::user()->id;
        $events->save();
        return back()->with('success', 'Event Add Successfully');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\event  $event
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $events_edit = Event::where('id', $request->id)->first();
        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $facility_contacts = Contact::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Firstname', 'ASC')->get();
        $event_types = EventType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.events.add', compact('organizations', 'facility_contacts', 'event_types', 'events_edit'));
    }
    public function showForm(Request $request)
    {
        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $facility_contacts = Contact::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Firstname', 'ASC')->get();
        $event_types = EventType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.events.add', compact('organizations', 'facility_contacts', 'event_types'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\event  $event
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, event $event)
    {
        $validator = Validator::make($request->all(), [
            'organization' => 'required',
            'name' => 'required|max:150',
            'start_date' => 'required',
            'start_time' => 'required',
            'end_date' => 'required',
            'end_time' => 'required',
            'contact' => 'required',
            'facility_name' => 'required|max:150',
            'facility_address' => 'required|max:150',
            'event' => 'required',
            // 'is_active' => 'required',
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }
        $id = $request->id;
        $events_update = Event::find($id);
        $events_update->OrganizationID = $request->organization;
        $events_update->Name = $request->name;
        $events_update->StartDate = $request->start_date;
        $events_update->StartTime = $request->start_time;
        $events_update->EndDate = $request->end_date;
        $events_update->EndTime = $request->end_time;
        $events_update->FacilityContactID = $request->contact;
        $events_update->FacilityName = $request->facility_name;
        $events_update->FacilityAddress = $request->facility_address;
        $events_update->EventTypeID = $request->event;
        $events_update->IsActive = 1;
        $events_update->UpdatedBy = Auth::user()->id;
        $events_update->save();
        return redirect()->route('event.view')->with('success', 'Event Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\event  $event
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $events_delete = Event::find($id)->delete();
        return back()->with('success', 'Event Trash Successfully');
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
            $event_bulk_delete = Event::find($id)->delete();
        }
        return back()->with('success', 'Events Deleted Successfully');
    }

    public function status(Request $request)
    {
        $find = $request->id['id'];
        $status = Event::find($find);
        $status->status = $request->data_val;
        $status->save();
        // return back()->with('success','Status Update Successfully');
        return response()->json(['success' => 'Status Updated Successfully']);
    }
}
