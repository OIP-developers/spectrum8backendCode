<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\OrganizationType;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class OrganizationTypeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $organization_type = OrganizationType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.organization_type.view', compact('organization_type'));
    }


    public function trash()
    {
        $organization_type = OrganizationType::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.organization_type.trash', compact('organization_type'));
    }
    public function restore($id)
    {
        $organization_type_restore = OrganizationType::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }


    public function archive()
    {
        $organization_type = OrganizationType::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.organization_type.archive', compact('organization_type'));
    }
    public function toggleArchive($id)
    {
        $organization_type = OrganizationType::find($id);
        if ($organization_type->is_archive == 'true') {
            $organization_type->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $organization_type->is_archive = 'true';
            $mxg = "Archive";
        }
        $organization_type->save();
        return back()->with('success', 'Organization Type ' . $mxg . ' Successfully');
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
                'is_school' => 'required',
                'classification' => 'required|max:50',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $organization_type = new OrganizationType;
            $organization_type->IsSchool = $request->is_school;
            $organization_type->Classification = $request->classification;
            $organization_type->CreatedBy = Auth::user()->id;
            $organization_type->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Organization Type Add Successfully');
    }


    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ContactType  $grade
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $organization_type_edit = OrganizationType::where('id', $request->id)->first();
        return view('front.organization_type.add', compact('organization_type_edit'));
    }


    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ContactType  $grade
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, OrganizationType $organization_type)
    {

        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'is_school' => 'required',
                'classification' => 'required|max:50',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $id = $request->id;
            $organization_type_update = OrganizationType::find($id);
            $organization_type_update->Classification = $request->classification;
            $organization_type_update->IsSchool = $request->is_school;
            $organization_type_update->UpdatedBy = Auth::user()->id;
            $organization_type_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('organization_type.view')->with('success', 'Organization Type Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ContactType  $grade
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $organization_type_delete = OrganizationType::find($id)->delete();
        return back()->with('success', 'Organization Type Trash Successfully');
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
            $grade_bulk_delete = OrganizationType::find($id)->delete();
        }
        return back()->with('success', 'Organization Type Deleted Successfully');
    }
}
