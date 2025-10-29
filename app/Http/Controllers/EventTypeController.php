<?php

namespace App\Http\Controllers;

use App\Models\EventType;
use Illuminate\Http\Request;
use App\Models\EventCatagory;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class EventTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $event_type = EventType::where(['is_archive' => 'false', 'Status' => 1])->with('event_category')->orderBy('id', 'DESC')->get();
        return view('front.event_type.view', compact('event_type'));
    }


    public function trash()
    {
        $event_type = EventType::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.event_type.trash', compact('event_type'));
    }
    public function restore($id)
    {
        $event_type_restore = EventType::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }


    public function archive()
    {
        $event_type = EventType::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.event_type.archive', compact('event_type'));
    }
    public function toggleArchive($id)
    {
        $event_type = EventType::find($id);
        if ($event_type->is_archive == 'true') {
            $event_type->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $event_type->is_archive = 'true';
            $mxg = "Archive";
        }
        $event_type->save();
        return back()->with('success', 'Event Type ' . $mxg . ' Successfully');
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
                'name' => 'required|max:150',
                // 'in_person' => 'required',
                // 'vitrual' => 'required',
                // 'is_active' => 'required',
                'event_category_id' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $event_type = new EventType;
            $event_type->Name = $request->name;
            $event_type->InPerson = 1;
            $event_type->Vitrual = 1;
            $event_type->IsActive = 1;
            $event_type->EventCatagoryID = $request->event_category_id;
            $event_type->CreatedBy = Auth::user()->id;
            $event_type->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('error', $e->getMessage())->withInput();
        }
        DB::commit();
        return back()->with('success', 'Event Type Add Successfully');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\EventType  $grade
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $event_type_edit = EventType::where('id', $request->id)->first();
        $event_catagories = EventCatagory::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.event_type.add', compact('event_type_edit', 'event_catagories'));
    }

    public function showForm(Request $request)
    {
        $event_catagories = EventCatagory::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.event_type.add', compact('event_catagories'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\EventType  $grade
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, EventType $event_type)
    {

        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|max:150',
                // 'in_person' => 'required',
                // 'vitrual' => 'required',
                //    'is_active' => 'required',
                'event_category_id' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $id = $request->id;
            $event_type_update = EventType::find($id);
            $event_type_update->Name = $request->name;
            $event_type_update->InPerson = 1;
            $event_type_update->Vitrual = 1;
            $event_type_update->IsActive = 1;
            $event_type_update->EventCatagoryID = $request->event_category_id;
            $event_type_update->UpdatedBy = Auth::user()->id;
            $event_type_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('event_type.view')->with('success', 'Event Type Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\EventType  $grade
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $event_type_delete = EventType::find($id)->delete();
        return back()->with('success', 'Event Type Trash Successfully');
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
            $grade_bulk_delete = EventType::find($id)->delete();
        }
        return back()->with('success', 'Event Type Deleted Successfully');
    }
}
