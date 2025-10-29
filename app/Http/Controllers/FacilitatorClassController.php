<?php

namespace App\Http\Controllers;

use App\Models\Classes;
use App\Models\Facilitator;
use Illuminate\Http\Request;
use App\Models\FacilitatorClass;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class FacilitatorClassController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $facilitator_class = FacilitatorClass::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.facilitator_class.view', compact('facilitator_class'));
    }
    public function trash()
    {
        $facilitator_class = FacilitatorClass::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.facilitator_class.trash', compact('facilitator_class'));
    }
    public function restore($id)
    {
        $facilitator_class_restore = FacilitatorClass::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $facilitator_class = FacilitatorClass::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.facilitator_class.archive', compact('facilitator_class'));
    }
    public function toggleArchive($id)
    {
        $facilitator_class = FacilitatorClass::find($id);
        if ($facilitator_class->is_archive == 'true') {
            $facilitator_class->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $facilitator_class->is_archive = 'true';
            $mxg = "Archive";
        }
        $facilitator_class->save();
        return back()->with('success', 'Facilitator Class ' . $mxg . ' Successfully');
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
                'facilitator' => 'required',
                'class' => 'required',
                'class_name' => 'required|max:15',
                // 'is_active' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $facilitator_class = new FacilitatorClass;
            $facilitator_class->FacilitatorID = $request->facilitator;
            $facilitator_class->ClassID = $request->class;
            $facilitator_class->ClassName = $request->class_name;
            $facilitator_class->IsActive = 1;
            $facilitator_class->CreatedBy = Auth::user()->id;
            $facilitator_class->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return back()->with('success', 'Facilitator Class Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\FacilitatorClass  $facilitator_class
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $facilitator_class_edit = FacilitatorClass::where('id', $request->id)->first();
        $facilitators = Facilitator::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Firstname', 'ASC')->get();
        $classes = Classes::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.facilitator_class.add', compact('facilitator_class_edit', 'facilitators', 'classes'));
    }
    public function showForm(Request $request)
    {

        $facilitators = Facilitator::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Firstname', 'ASC')->get();
        $classes = Classes::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.facilitator_class.add', compact('facilitators', 'classes'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\FacilitatorClass  $facilitator_class
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, FacilitatorClass $facilitator_class)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'facilitator' => 'required',
                'class' => 'required',
                'class_name' => 'required|max:15',
                // 'is_active' => 'required',
            ]);

            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $id = $request->id;
            $facilitator_class_update = FacilitatorClass::find($id);
            $facilitator_class_update->FacilitatorID = $request->facilitator;
            $facilitator_class_update->ClassID = $request->class;
            $facilitator_class_update->ClassName = $request->class_name;
            $facilitator_class_update->IsActive = 1;
            $facilitator_class_update->UpdatedBy = Auth::user()->id;
            $facilitator_class_update->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('facilitator_class.view')->with('success', 'Facilitator Class Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\facilitator_class  $facilitator_class
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $facilitator_class_delete = FacilitatorClass::find($id)->delete();
        return back()->with('success', 'Facilitator Class Trash Successfully');
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
            $facilitator_class_bulk_delete = FacilitatorClass::find($id)->delete();
        }
        return back()->with('success', 'Facilitator Class Deleted Successfully');
    }
}
