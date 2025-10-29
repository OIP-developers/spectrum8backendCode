<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\EventCatagory;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class EventCatagoryController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $event_catagory = EventCatagory::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.event_catagory.view', compact('event_catagory'));
    }


    public function trash()
    {
        $event_catagory = EventCatagory::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.event_catagory.trash', compact('event_catagory'));
    }
    public function restore($id)
    {
        $event_catagory_restore = EventCatagory::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }


    public function archive()
    {
        $event_catagory = EventCatagory::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.event_catagory.archive', compact('event_catagory'));
    }
    public function toggleArchive($id)
    {
        $event_catagory = EventCatagory::find($id);
        if ($event_catagory->is_archive == 'true') {
            $event_catagory->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $event_catagory->is_archive = 'true';
            $mxg = "Archive";
        }
        $event_catagory->save();
        return back()->with('success', 'Event Category ' . $mxg . ' Successfully');
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
                'abbr' => 'required|max:10',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $event_catagory = new EventCatagory;
            $event_catagory->Name = $request->name;
            $event_catagory->Abbr = $request->abbr;
            $event_catagory->CreatedBy = Auth::user()->id;
            $event_catagory->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Event Category Add Successfully');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\EventCatagory  $grade
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $event_catagory_edit = EventCatagory::where('id', $request->id)->first();
        return view('front.event_catagory.add', compact('event_catagory_edit'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\EventCatagory  $grade
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, EventCatagory $event_catagory)
    {

        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|max:100',
                'abbr' => 'required|max:10',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $id = $request->id;
            $event_catagory_update = EventCatagory::find($id);
            $event_catagory_update->Name = $request->name;
            $event_catagory_update->Abbr = $request->abbr;
            $event_catagory_update->UpdatedBy = Auth::user()->id;
            $event_catagory_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('event_catagory.view')->with('success', 'Event Category Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\EventCatagory  $grade
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $event_catagory_delete = EventCatagory::find($id)->delete();
        return back()->with('success', 'Event Category Trash Successfully');
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
            $grade_bulk_delete = EventCatagory::find($id)->delete();
        }
        return back()->with('success', 'Event Category Deleted Successfully');
    }
}
