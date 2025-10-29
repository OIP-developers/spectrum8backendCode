<?php

namespace App\Http\Controllers;

use App\Models\EmailType;
use App\Models\Participant;
use Illuminate\Http\Request;
use App\Models\ParticipantEmail;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ParticipantEmailController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $participant_emails = ParticipantEmail::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.participant_email.view', compact('participant_emails'));
    }
    public function trash()
    {
        $participant_emails = ParticipantEmail::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.participant_email.trash', compact('participant_emails'));
    }
    public function restore($id)
    {
        $participant_emails_restore = ParticipantEmail::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $participant_emails = ParticipantEmail::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.participant_email.archive', compact('participant_emails'));
    }
    public function toggleArchive($id)
    {
        $participant_emails = ParticipantEmail::find($id);
        if ($participant_emails->is_archive == 'true') {
            $participant_emails->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $participant_emails->is_archive = 'true';
            $mxg = "Archive";
        }
        $participant_emails->save();
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
                'participant' => 'required|max:15|',
                'email' => 'required|max:255|email',
                'email_type' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $participant_email = new ParticipantEmail;
            $participant_email->ParticipantID = $request->participant;
            $participant_email->EmailTypeID = $request->email_type;
            $participant_email->Email = $request->email;
            $participant_email->CreatedBy = Auth::user()->id;
            $participant_email->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Participant Email Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\participant_email  $participant_email
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $participant_email_edit = ParticipantEmail::where('id', $request->id)->first();
        $participants = Participant::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Firstname', 'ASC')->get();
        $email_types = EmailType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.participant_email.add', compact('participants', 'email_types', 'participant_email_edit'));
    }

    public function showForm(Request $request)
    {
        $participants = Participant::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Firstname', 'ASC')->get();
        $email_types = EmailType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.participant_email.add', compact('participants', 'email_types'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ParticipantEmail  $participant_email
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ParticipantEmail $participant_email)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'participant' => 'required|max:15|',
                'email' => 'required|max:255|email',
                'email_type' => 'required',
            ]);

            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;
            $participant_email_update = ParticipantEmail::find($id);
            $participant_email_update->ParticipantID = $request->participant;
            $participant_email_update->EmailTypeID = $request->email_type;
            $participant_email_update->Email = $request->email;
            $participant_email_update->UpdatedBy = Auth::user()->id;
            $participant_email_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('participant_email.view')->with('success', 'Participant Email Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\participant_email  $participant_email
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $participant_email_delete = ParticipantEmail::find($id)->delete();
        return back()->with('success', 'Participant Email Trash Successfully');
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
            $participant_email_bulk_delete = ParticipantEmail::find($id)->delete();
        }
        return back()->with('success', 'Participant Email Deleted Successfully');
    }
}
