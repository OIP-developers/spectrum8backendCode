<?php

namespace App\Http\Controllers;

use App\Models\EmailType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class EmailTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $email_type = EmailType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.email_type.view', compact('email_type'));
    }


    public function trash()
    {
        $email_type = EmailType::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.email_type.trash', compact('email_type'));
    }
    public function restore($id)
    {
        $email_type_restore = EmailType::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }


    public function archive()
    {
        $email_type = EmailType::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.email_type.archive', compact('email_type'));
    }
    public function toggleArchive($id)
    {
        $email_type = EmailType::find($id);
        if ($email_type->is_archive == 'true') {
            $email_type->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $email_type->is_archive = 'true';
            $mxg = "Archive";
        }
        $email_type->save();
        return back()->with('success', 'Email Type ' . $mxg . ' Successfully');
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
                'name' => 'required|max:255',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $email_type = new EmailType;
            $email_type->Name = $request->name;
            $email_type->CreatedBy = Auth::user()->id;
            $email_type->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Email Type Add Successfully');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\EmailType  $grade
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $email_type_edit = EmailType::where('id', $request->id)->first();
        return view('front.email_type.add', compact('email_type_edit'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\EmailType  $grade
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, EmailType $email_type)
    {

        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|max:255',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $id = $request->id;
            $email_type_update = EmailType::find($id);
            $email_type_update->Name = $request->name;
            $email_type_update->UpdatedBy = Auth::user()->id;
            $email_type_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('email_type.view')->with('success', 'Email Type Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\EmailType  $grade
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $email_type_delete = EmailType::find($id)->delete();
        return back()->with('success', 'Email Type Trash Successfully');
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
            $grade_bulk_delete = EmailType::find($id)->delete();
        }
        return back()->with('success', 'Email Type Deleted Successfully');
    }
}
