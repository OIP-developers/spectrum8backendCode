<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ParticipantType;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ParticipantTypeController extends Controller
{

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $participant_types = ParticipantType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.participant_type.view', compact('participant_types'));
    }
    public function trash()
    {
        $participant_types = ParticipantType::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.participant_type.trash', compact('participant_types'));
    }
    public function restore($id)
    {
        $participant_types_restore = ParticipantType::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $participant_types = ParticipantType::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.participant_type.archive', compact('participant_types'));
    }
    public function toggleArchive($id)
    {
        $participant_types = ParticipantType::find($id);
        if ($participant_types->is_archive == 'true') {
            $participant_types->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $participant_types->is_archive = 'true';
            $mxg = "Archive";
        }
        $participant_types->save();
        return back()->with('success', 'Participant Email ' . $mxg . ' Successfully');
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
                'classification' => 'required|max:25',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $participant_type = new ParticipantType;
            $participant_type->Classification = $request->classification;
            $participant_type->IsActive = 1;
            $participant_type->CreatedBy = Auth::user()->id;
            $participant_type->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Participant Type Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\participant_type  $participant_type
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $participant_type_edit = ParticipantType::where('id', $request->id)->first();
        return view('front.participant_type.add', compact('participant_type_edit'));
    }

    public function showForm(Request $request)
    {
        return view('front.participant_type.add');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ParticipantType  $participant_type
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ParticipantType $participant_type)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'classification' => 'required|max:25',
            ]);

            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;
            $participant_type_update = ParticipantType::find($id);
            $participant_type_update->Classification = $request->classification;
            $participant_type_update->IsActive = 1;
            $participant_type_update->UpdatedBy = Auth::user()->id;
            $participant_type_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('participant_type.view')->with('success', 'Participant Type Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\participant_type  $participant_type
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $participant_type_delete = ParticipantType::find($id)->delete();
        return back()->with('success', 'Participant Type Trash Successfully');
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
            $participant_type_bulk_delete = ParticipantType::find($id)->delete();
        }
        return back()->with('success', 'Participant Types Deleted Successfully');
    }
}
