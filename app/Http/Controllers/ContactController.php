<?php

namespace App\Http\Controllers;

use App\Models\Contact;
use App\Models\ContactType;
use App\Models\Facilitator;
use App\Models\Organization;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class ContactController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $contacts = Contact::where(['is_archive' => 'false', 'Status' => 1])->with('contact_type', 'organization', 'facilitator')->orderBy('id', 'DESC')->get();
        return view('front.contact.view', compact('contacts'));
    }
    public function trash()
    {
        $contacts = Contact::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.contact.trash', compact('contacts'));
    }
    public function restore($id)
    {
        $contacts_restore = Contact::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $contacts = Contact::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.contact.archive', compact('contacts'));
    }
    public function toggleArchive($id)
    {
        $contacts = Contact::find($id);
        if ($contacts->is_archive == 'true') {
            $contacts->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $contacts->is_archive = 'true';
            $mxg = "Archive";
        }
        $contacts->save();
        return back()->with('success', 'Contact ' . $mxg . ' Successfully');
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
                'contact' => 'required',
                'organization' => 'required',
                'facilitator' => 'required',
                'first_name' => 'required|max:50',
                'last_name' => 'required|max:50',
                'phone_work' => 'required|max:32',
                'can_text_work' => 'required',
                'phone_mobile' => 'required|min:7|max:32',
                'can_text_mobile' => 'required',
                'address' => 'required|max:150',
                'email' => 'required|max:255|email|unique:contacts',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $contact = new Contact;
            $contact->ContactTypeID = $request->contact;
            $contact->OrganizationID = $request->organization;
            $contact->FacilitatorID = $request->facilitator;
            $contact->Firstname = $request->first_name;
            $contact->Lastname = $request->last_name;
            $contact->PhoneWork = $request->phone_work;
            $contact->CanTextWork = $request->can_text_work;
            $contact->PhoneMobil = $request->phone_mobile;
            $contact->CanTextMobil = $request->can_text_mobile;
            $contact->Address = $request->address;
            $contact->Email = $request->email;
            $contact->CreatedBy = Auth::user()->id;
            $contact->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Contact Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Contact  $contact
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $contact_edit = Contact::where('id', $request->id)->first();
        $contact_types = ContactType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Classification', 'ASC')->get();
        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $facilitators = Facilitator::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Firstname', 'ASC')->get();
        return view('front.contact.add', compact('organizations', 'contact_types', 'facilitators', 'contact_edit'));
    }

    public function showForm(Request $request)
    { 
        $contact_types = ContactType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Classification', 'ASC')->get();
        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $facilitators = Facilitator::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Firstname', 'ASC')->get();
        return view('front.contact.add', compact('organizations', 'contact_types', 'facilitators'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Contact  $contact
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Contact $contact)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'contact' => 'required',
                'organization' => 'required',
                'facilitator' => 'required',
                'first_name' => 'required|max:50',
                'last_name' => 'required|max:50',
                'phone_work' => 'required|max:32',
                'can_text_work' => 'required',
                'phone_mobile' => 'required|min:7|max:32',
                'can_text_mobile' => 'required',
                'address' => 'required|max:150',
                'email' => 'required|max:255|email',
            ]);

            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;
            $contact_update = Contact::find($id);
            $contact_update->ContactTypeID = $request->contact;
            $contact_update->OrganizationID = $request->organization;
            $contact_update->FacilitatorID = $request->facilitator;
            $contact_update->Firstname = $request->first_name;
            $contact_update->Lastname = $request->last_name;
            $contact_update->PhoneWork = $request->phone_work;
            $contact_update->CanTextWork = $request->can_text_work;
            $contact_update->PhoneMobil = $request->phone_mobile;
            $contact_update->CanTextMobil = $request->can_text_mobile;
            $contact_update->Address = $request->address;
            $contact_update->Email = $request->email;
            $contact_update->UpdatedBy = Auth::user()->id;
            $contact_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('contact.view')->with('success', 'Contact Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Contact  $contact
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $contact_delete = Contact::find($id)->delete();
        return back()->with('success', 'Contact Trash Successfully');
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
            $contact_bulk_delete = Contact::find($id)->delete();
        }
        return back()->with('success', 'Contacts Deleted Successfully');
    }
}
