<?php

namespace App\Http\Controllers;

use App\Models\Color;
use App\Models\ContactType;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ContactTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $contact_type = ContactType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.contact_type.view', compact('contact_type'));
    }


    public function trash()
    {
        $contact_type = ContactType::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.contact_type.trash', compact('contact_type'));
    }
    public function restore($id)
    {
        $contact_type_restore = ContactType::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }


    public function archive()
    {
        $contact_type = ContactType::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.contact_type.archive', compact('contact_type'));
    }
    public function toggleArchive($id)
    {
        $contact_type = ContactType::find($id);
        if ($contact_type->is_archive == 'true') {
            $contact_type->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $contact_type->is_archive = 'true';
            $mxg = "Archive";
        }
        $contact_type->save();
        return back()->with('success', 'Contact Type ' . $mxg . ' Successfully');
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

            $contact_type = new ContactType;
            $contact_type->Classification = $request->classification;
            $contact_type->CreatedBy = Auth::user()->id;
            $contact_type->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Contact Type Add Successfully');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ContactType  $grade
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $contact_type_edit = ContactType::where('id', $request->id)->first();
        return view('front.contact_type.add', compact('contact_type_edit'));
    }

    public function showForm(Request $request)
    {
        $colors = Color::where(['is_archive' => 'false', 'Status' => 1])->get();
        return view('front.contact_type.add', compact('colors'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ContactType  $grade
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ContactType $contact_type)
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
            $contact_type_update = ContactType::find($id);
            $contact_type_update->Classification = $request->classification;
            $contact_type_update->UpdatedBy = Auth::user()->id;
            $contact_type_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('contact_type.view')->with('success', 'Contact Type Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ContactType  $grade
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $contact_type_delete = ContactType::find($id)->delete();
        return back()->with('success', 'Contact Type Trash Successfully');
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
            $grade_bulk_delete = ContactType::find($id)->delete();
        }
        return back()->with('success', 'Contact Type Deleted Successfully');
    }
}
