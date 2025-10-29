<?php

namespace App\Http\Controllers;

use App\Models\License;
use App\Models\LicenseType;
use App\Models\Organization;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class licenseController extends Controller
{
    public function index()
    {
        $licenses = License::where(['is_archive' => 'false', 'Status' => 1])->with('organization','license_type')->OrderBy('id','DESC')->get();
        return view('front.license.view', compact('licenses'));
    }
    public function trash()
    {
        $licenses = License::onlyTrashed()->get();
        return view('front.license.trash', compact('licenses'));
    }
    public function restore($id)
    {
        $licenses_restore = License::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $licenses = License::where('is_archive', 'true')->get();
        return view('front.license.archive', compact('licenses'));
    }
    public function toggleArchive($id)
    {
        $licenses = License::find($id);
        if ($licenses->is_archive == 'true') {
            $licenses->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $licenses->is_archive = 'true';
            $mxg = "Archive";
        }
        $licenses->save();
        return back()->with('success', 'License ' . $mxg . ' Successfully');
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
                'organization' => 'required',
                'license_type' => 'required',
                'start_date' => 'required|date|before:expires',
                'expires' => 'required|date',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $license = new License;
            $license->OrganizationID = $request->organization;
            $license->LicenseTypeID = $request->license_type;
            $license->StartDate = $request->start_date;
            $license->Expires = $request->expires;
            $license->IsActive = 1;
            $license->CreatedBy = Auth::user()->id;
            $license->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'License Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\License  $license
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $license_edit = License::where('id', $request->id)->first();
        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $license_types = LicenseType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.license.add', compact('license_edit','organizations', 'license_types'));
    }
    public function showForm(Request $request)
    {
        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $license_types = LicenseType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.license.add', compact('organizations', 'license_types'));
    }

    public function find_duration(Request $request)
    {
        $license_types = LicenseType::where(['id'=>$request->data_val,'is_archive' => 'false', 'Status' => 1])->first();
        return response()->json($license_types);
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\License  $license
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, License $license)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'organization' => 'required',
                'license_type' => 'required',
                'start_date' => 'required|date|before:expires',
                'expires' => 'required|date',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $currentDate = now()->toDateString();
            $id = $request->id;
            $license_update = License::find($id);
            $license_update->OrganizationID = $request->organization;
            $license_update->LicenseTypeID = $request->license_type;
            $license_update->StartDate = $request->start_date;
            $license_update->Expires = $request->expires;
            if($request->expires >= $currentDate){
                $license_update->is_expire = "false";
            }
            $license_update->UpdatedBy = Auth::user()->id;
            $license_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('license.view')->with('success', 'License Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\License  $license
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $license_delete = License::find($id)->delete();
        return back()->with('success', 'License Trash Successfully');
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
            $license_bulk_delete = License::find($id)->delete();
        }
        return back()->with('success', 'Licenses Deleted Successfully');
    }
    // public function bulkDelete(Request $request)
    // {

    //     $rules = [
    //         'bulk_action' => 'required',
    //     ];

    //     $customMessages = [
    //         'required' => 'Select Atleast One Record'
    //     ];

    //     $this->validate($request, $rules, $customMessages);

    //     foreach ($request->bulk_action as $id) {
    //         $license_bulk_delete = License::find($id)->delete();
    //     }
    //     return back()->with('success', 'Licenses Deleted Successfully');
    // }
}
