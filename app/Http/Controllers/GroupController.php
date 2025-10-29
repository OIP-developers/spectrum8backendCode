<?php

namespace App\Http\Controllers;

use App\Models\Grade;
use App\Models\Group;
use App\Models\Gender;
use App\Models\Classes;
use App\Models\GroupClass;
use App\Models\GroupGrade;
use App\Models\Facilitator;
use App\Models\GroupGender;
use App\Models\Participant;
use App\Models\Organization;
use Illuminate\Http\Request;
use App\Models\GroupFacilitator;
use App\Models\GroupOrganization;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;


class GroupController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $groups = Group::with('group_organization', 'group_organization.organization', 'group_facilitator_web.facilitator', 'group_gender.gender', 'group_grade.grade', 'group_class.class')->where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.groups.view', compact('groups'));
    }

    public function trash()
    {
        $groups = Group::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.groups.trash', compact('groups'));
    }
    public function restore($id)
    {
        $groups_restore = Group::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $groups = Group::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.groups.archive', compact('groups'));
    }
    public function toggleArchive($id)
    {
        $groups = Group::find($id);
        if ($groups->is_archive == 'true') {
            $groups->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $groups->is_archive = 'true';
            $mxg = "Archive";
        }
        $groups->save();
        return back()->with('success', 'Group ' . $mxg . ' Successfully');
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
                'abbr' => 'required|max:25',
                // 'organization' => 'required',
                // 'facilitator' => 'required',
                'gender' => 'required',
                'grade' => 'required',
                'class' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }

            $groups = new Group;
            $groups->Name = $request->name;
            $groups->Abbr = $request->abbr;
            $groups->CreatedBy = Auth::user()->id;
            $groups->save();
            $group_id = $groups->id;
            // if ($request->organization) {
            //     foreach ($request->organization as $value) {
            //         $group_organization = new GroupOrganization;
            //         $group_organization->GroupID = $group_id;
            //         $group_organization->OrganizationID = $value;
            //         $group_organization->CreatedBy = Auth::user()->id;
            //         $group_organization->save();
            //     }
            // }

            // if ($request->facilitator) {
            //     foreach ($request->facilitator as $value) {
            //         $group_facilitator = new GroupFacilitator;
            //         $group_facilitator->GroupID = $group_id;
            //         $group_facilitator->FacilitatorID = $value;
            //         $group_facilitator->CreatedBy = Auth::user()->id;
            //         $group_facilitator->save();
            //     }
            // }
            if ($request->gender) {
                foreach ($request->gender as $value) {
                    $group_gender = new GroupGender;
                    $group_gender->GroupID = $group_id;
                    $group_gender->GenderID = $value;
                    $group_gender->CreatedBy = Auth::user()->id;
                    $group_gender->save();
                }
            }
            if ($request->grade) {
                foreach ($request->grade as $value) {
                    $group_grade = new GroupGrade;
                    $group_grade->GroupID = $group_id;
                    $group_grade->GradeID = $value;
                    $group_grade->CreatedBy = Auth::user()->id;
                    $group_grade->save();
                }
            }
            if ($request->class) {
                foreach ($request->class as $value) {
                    $group_class = new GroupClass;
                    $group_class->GroupID = $group_id;
                    $group_class->ClassID = $value;
                    $group_class->CreatedBy = Auth::user()->id;
                    $group_class->save();
                }
            }
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();

        return back()->with('success', 'Group Add Successfully');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Grade  $group
     * @return \Illuminate\Http\Response
     */
    public function edit(Request $request)
    {
        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $facilitators = Facilitator::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Firstname', 'ASC')->get();
        $genders = Gender::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Gender', 'ASC')->get();
        $grades = Grade::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $classes = Classes::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $groups_edit = Group::where('id', $request->id)->with('group_organization', 'group_facilitator_web', 'group_gender', 'group_grade', 'group_class')->first();
        // working_for_match_ids
        // if (isset($groups_edit) && count($groups_edit->group_organization) > 0) {
        if (isset($groups_edit)) {
            $organization_array = $groups_edit->group_organization;
            $facilitator_array = $groups_edit->group_facilitator_web;
            $gender_array = $groups_edit->group_gender;
            $grade_array = $groups_edit->group_grade;
            $class_array = $groups_edit->group_class;
            foreach ($organization_array as $val) {
                $organization_id[] = $val->OrganizationID;
            }
            foreach ($facilitator_array as $val) {
                $facilitator_id[] = $val->FacilitatorID;
            }
            foreach ($gender_array as $val) {
                $gender_id[] = $val->GenderID;
            }
            foreach ($grade_array as $val) {
                $grade_id[] = $val->GradeID;
            }
            foreach ($class_array as $val) {
                $class_id[] = $val->ClassID;
            }
        }
        $organization_data = $organization_id??'';
        $facilitator_data = $facilitator_id??'';
        $gender_data = $gender_id??'';
        $grade_data = $grade_id??'';
        $class_data = $class_id ?? '';
        // working_for_match_ids
        return view('front.groups.add', compact('organizations', 'facilitators', 'genders', 'grades', 'classes', 'groups_edit', 'grades', 'organization_data', 'gender_data', 'grade_data', 'class_data', 'facilitator_data'));
    }

    public function formShow()
    {

        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $facilitators = Facilitator::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Firstname', 'ASC')->get();
        $genders = Gender::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Gender', 'ASC')->get();
        $grades = Grade::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $classes = Classes::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.groups.add', compact('organizations', 'facilitators', 'genders', 'grades', 'classes'));
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Group  $group
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Group $group)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'name' => 'required|max:255',
                'abbr' => 'required|max:25',
                // 'organization' => 'required',
                // 'facilitator' => 'required',
                'gender' => 'required',
                'grade' => 'required',
                'class' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $id = $request->id;
            $group_find = Group::where('id', $id)->with('group_organization', 'group_facilitator', 'group_gender', 'group_grade', 'group_class')->first();
            $group_organization_delete = GroupOrganization::where("GroupID", $id)->get();
            $group_facilitator_delete = GroupFacilitator::where("GroupID", $id)->get();
            $group_gender_delete = GroupGender::where("GroupID", $id)->get();
            $group_grade_delete = GroupGrade::where("GroupID", $id)->get();
            $group_class_delete = GroupClass::where("GroupID", $id)->get();

            // foreach ($group_organization_delete as $delete_value) {
            //     GroupOrganization::find($delete_value->id)->delete();
            // }
            // foreach ($group_facilitator_delete as $delete_value) {
            //     GroupFacilitator::find($delete_value->id)->delete();
            // }
            foreach ($group_gender_delete as $delete_value) {
                GroupGender::find($delete_value->id)->delete();
            }
            foreach ($group_grade_delete as $delete_value) {
                GroupGrade::find($delete_value->id)->delete();
            }
            foreach ($group_class_delete as $delete_value) {
                GroupClass::find($delete_value->id)->delete();
            }

            $groups_update = Group::find($id);
            $groups_update->Name = $request->name;
            $groups_update->Abbr = $request->abbr;
            $groups_update->UpdatedBy = Auth::user()->id;
            $groups_update->save();

            // foreach ($request->organization as $value) {
            //     $group_organization = new GroupOrganization;
            //     $group_organization->GroupID = $id;
            //     $group_organization->OrganizationID = $value;
            //     $group_organization->UpdatedBy = Auth::user()->id;
            //     $group_organization->save();
            // }

            // foreach ($request->facilitator as $value) {
            //     $group_facilitator = new GroupFacilitator;
            //     $group_facilitator->GroupID = $id;
            //     $group_facilitator->FacilitatorID = $value;
            //     $group_facilitator->UpdatedBy = Auth::user()->id;
            //     $group_facilitator->save();
            // }
            foreach ($request->gender as $value) {
                $group_gender = new GroupGender;
                $group_gender->GroupID = $id;
                $group_gender->GenderID = $value;
                $group_gender->UpdatedBy = Auth::user()->id;
                $group_gender->save();
            }
            foreach ($request->grade as $value) {
                $group_grade = new GroupGrade;
                $group_grade->GroupID = $id;
                $group_grade->GradeID = $value;
                $group_grade->UpdatedBy = Auth::user()->id;
                $group_grade->save();
            }
            foreach ($request->class as $value) {
                $group_class = new GroupClass;
                $group_class->GroupID = $id;
                $group_class->ClassID = $value;
                $group_class->UpdatedBy = Auth::user()->id;
                $group_class->save();
            }
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();

        return redirect()->route('group.view')->with('success', 'Group Updated Successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\Group  $group
     * @return \Illuminate\Http\Response
     */
    public function delete($id)
    {
        $groups_delete = Group::find($id)->delete();
        return back()->with('success', 'Group Trash Successfully');
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
            $group_bulk_delete = Group::find($id)->delete();
        }
        return back()->with('success', 'Groups Deleted Successfully');
    }
    public function getGroups(Request $request)
    {
        $groups = Group::whereRaw('FIND_IN_SET(' . $request->data_val . ',grade_id)')->orderBy('Name', 'ASC')->get();
        // return $groups;
        return response()->json(['data' => $groups]);
    }
    public function status(Request $request)
    {
        $find = $request->id['id'];
        $status = Group::find($find);
        $status->status = $request->data_val;
        $status->save();
        // return back()->with('success','Status Update Successfully');
        return response()->json(['success' => 'Status Updated Successfully']);
    }
    public function find_facilitator(Request $request)
    {
        if ($request->data_val[0] == "all") {
            $facilitators = Facilitator::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Firstname', 'ASC')->get();
            $select_all = "yes";
        } else {
            $facilitators = [];
            foreach ($request->data_val as $val) {
                // dd($val);
                $facilitators[] = Facilitator::where(['is_archive' => 'false', 'Status' => 1, 'OrganizationID' => $val])->orderBy('Firstname', 'ASC')->get();
            }
            $select_all = "no";
        }
        return response()->json(['data' => $facilitators, "select_all" => $select_all]);
    }
}
