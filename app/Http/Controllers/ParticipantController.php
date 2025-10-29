<?php

namespace App\Http\Controllers;

use App\Models\Color;
use App\Models\Grade;
use App\Models\Group;
use App\Models\Gender;
use App\Models\Classes;
use App\Models\License;
use App\Models\Facilitator;
use App\Models\Participant;
use App\Models\Organization;
use Illuminate\Http\Request;
use App\Models\ParticipantType;
use App\Models\AssessmentResults;
use Illuminate\Support\Facades\DB;
use App\Imports\ParticipanteImport;
use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Facades\Excel;
use Illuminate\Support\Facades\Validator;

class ParticipantController extends Controller
{
    public function index(Request $request)
    {
        $participants = Participant::where(['is_archive' => 'false'])->OrderBy('id', 'DESC')->get();
        // dd($participants);
        return view('front.participants.view', compact('participants'));
    }
    public function trash()
    {
        $participants = Participant::onlyTrashed()->orderBy('id', 'DESC')->get();
        return view('front.participants.trash', compact('participants'));
    }
    public function restore($id)
    {
        $participants_restore = Participant::withTrashed()->find($id)->restore();
        return back()->with('success', 'Record Restore Successfully');
    }
    public function archive()
    {
        $participants = Participant::where('is_archive', 'true')->orderBy('id', 'DESC')->get();
        return view('front.participants.archive', compact('participants'));
    }
    public function toggleArchive($id)
    {
        $participants = Participant::find($id);
        if ($participants->is_archive == 'true') {
            $participants->is_archive = 'false';
            $mxg = "Unarchive";
        } else {
            $participants->is_archive = 'true';
            $mxg = "Archive";
        }
        $participants->save();
        return back()->with('success', 'Participant ' . $mxg . ' Successfully');
    }

    public function importParticipant(Request $request)
    {
        return view('front.participants.importParticipant');
    }
    public function importExcelCSV(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'file' => 'required|mimes:xlsx,xls',
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }

        $a =  Excel::import(new ParticipanteImport, $request->file('file'));

        return redirect()->route('participant.view')->with('success', 'Participant The file has been excel/csv imported to database');
        //return redirect('excel-csv-file')->with('status', 'The file has been excel/csv imported to database in laravel 8');
    }
    public function add(Request $request)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'first_name' => 'required|max:50',
                'last_name' => 'required|max:50',
                'age' => 'required|max:3',
                'jersyNumber' => 'required|max:10',
                'gender' => 'required',
                'grade' => 'required',
                'organization' => 'required',
                'facilitator' => 'required',
                'class' => 'required',
                'jersyColor' => 'required',
                'participant_type' => 'required',
                // 'is_active' => 'required',
            ]);
            if ($validator->fails()) {  
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $find_licence = License::where(['OrganizationID'=>$request->organization,'is_expire'=>'false'])->with('license_type')->first();
            if($find_licence == null){
                return back()->with('error','Liscense not found');
            }
            $participants = Participant::where('OrganizationID',$request->organization)->get();
            if($find_licence->license_type->Participants <= count($participants)){
                return back()->with('error','Participant Quota is Exceeded');
            }

            $participant = new Participant;
            $participant->Firstname = $request->first_name;
            $participant->Lastname = $request->last_name;
            $participant->GenderID = $request->gender;
            $participant->GradeID = $request->grade;
            $participant->OrganizationID = $request->organization;
            $participant->FacilitatorID = $request->facilitator;
            $participant->ClassID = $request->class;
            $participant->Age = $request->age;
            $participant->JerseyNumber = $request->jersyNumber;
            $participant->JerseyColorID = $request->jersyColor;
            $participant->ParticipantTypeID = $request->participant_type;
            $participant->IsFacilitator = 1;
            $participant->IsActive = 1;
            $participant->S8S_ID = Auth::user()->id;
            $participant->CreatedBy = Auth::user()->id;
            $participant->save();
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('participant.view')->with('success', 'Participant Add Successfully');
        //return back()->with('success','Facilitator Add Successfully');
    }
    public function edit(Request $request)
    {
        $genders = Gender::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Gender', 'ASC')->get();
        $grades = Grade::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $facilitators = Facilitator::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Firstname', 'ASC')->get();
        $participant_types = ParticipantType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Classification', 'ASC')->get();
        $classes = Classes::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $colors = Color::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $participant_edit = Participant::where('id', $request->id)->first();
        return view('front.participants.add', compact('participant_edit', 'grades', 'genders', 'organizations', 'facilitators', 'classes', 'colors', 'participant_types'));
    }
    public function showForm(Request $request)
    {
        $genders = Gender::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Gender', 'ASC')->get();
        $grades = Grade::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $facilitators = Facilitator::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Firstname', 'ASC')->get();
        $participant_types = ParticipantType::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Classification', 'ASC')->get();
        $classes = Classes::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        $colors = Color::where(['is_archive' => 'false', 'Status' => 1])->orderBy('Name', 'ASC')->get();
        return view('front.participants.add', compact('grades', 'genders', 'organizations', 'facilitators', 'classes', 'colors', 'participant_types'));
    }
    public function assign()
    {
        $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        $facilitators = Facilitator::where(['is_archive' => 'false', 'Status' => 1])->orderBy('id', 'DESC')->get();
        return view('front.participants.assign', compact('organizations', 'facilitators'));
    }

    public function assigning(Request $request)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'organization' => 'required',
                'facilitator' => 'required',
            ]);
            if ($validator->fails()) {
                return redirect()->back()->withInput()->withErrors($validator);
            }
            $find_participants = Participant::where(['is_archive' => 'false', 'Status' => 1, 'OrganizationID' => $request->organization])->get();
            foreach ($find_participants as $find_participant) {
                $participant = Participant::find($find_participant->id);
                $participant->FacilitatorID = $request->facilitator;
                $participant->save();
            }
        } catch (\Exception $e) {
            DB::rollback();
            return Redirect()->back()
                ->with('message', $e->getMessage());
        }
        DB::commit();
        return redirect()->route('participant.view')->with('success', 'Participants Assign Successfully');
    }
    public function find_facilitator(Request $request)
    {
        $facilitators = Facilitator::where(['is_archive' => 'false', 'Status' => 1, 'OrganizationID' => $request->data_val])->orderBy('Firstname', 'ASC')->get();
        return response()->json(['data' => $facilitators]);
    }

    public function update(Request $request)
    {
        //dd($request->group);
        $validator = Validator::make($request->all(), [
            'first_name' => 'required|max:50',
            'last_name' => 'required|max:50',
            'age' => 'required|max:3',
            'jersyNumber' => 'required|max:10',
            'gender' => 'required',
            'grade' => 'required',
            'organization' => 'required',
            'facilitator' => 'required',
            'class' => 'required',
            'jersyColor' => 'required',
            'participant_type' => 'required',
            // 'is_facilitator' => 'required',
            // 'is_active' => 'required',
        ]);
        if ($validator->fails()) {
            return redirect()->back()->withInput()->withErrors($validator);
        }
        $id = $request->id;
        $participant_edit = Participant::find($id);
        $find_licence = License::where(['OrganizationID'=>$request->organization,'is_expire'=>'false'])->with('license_type')->first();
        if($find_licence == null){
            return back()->with('error','Liscense not found');
        }
        $participants = Participant::where('OrganizationID',$request->organization)->get();
        if($participant_edit->OrganizationID != $request->organization && $find_licence->license_type->Participants <= count($participants)){
            return back()->with('error','Participant Quota is Exceeded');
        }
        $participant_edit->Firstname = $request->first_name;
        $participant_edit->Lastname = $request->last_name;
        $participant_edit->GenderID = $request->gender;
        $participant_edit->GradeID = $request->grade;
        $participant_edit->OrganizationID = $request->organization;
        $participant_edit->FacilitatorID = $request->facilitator;
        $participant_edit->ClassID = $request->class;
        $participant_edit->Age = $request->age;
        $participant_edit->JerseyNumber = $request->jersyNumber;
        $participant_edit->JerseyColorID = $request->jersyColor;
        $participant_edit->ParticipantTypeID = $request->participant_type;
        $participant_edit->IsFacilitator = 1;
        $participant_edit->IsActive = 1;
        $participant_edit->S8S_ID = Auth::user()->id;
        $participant_edit->UpdatedBy = Auth::user()->id;
        $participant_edit->save();
        return redirect()->route('participant.view')->with('success', 'Participant Updated Successfully');
        //return back()->with('success','Facilitator Add Successfully');
    }
    public function delete($id)
    {
        $assessment = AssessmentResults::where('ParticipantID', $id)->get();
        if (count($assessment) != 0) {
            return back()->with('error', 'Results of This Participant Exist');
        }
        $participant_delete = Participant::find($id)->delete();
        return back()->with('success', 'Participant Trash Successfully');
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
            $participant_bulk_delete = Participant::find($id)->delete();
        }
        return back()->with('success', 'Participants Deleted Successfully');
    }
    public function status(Request $request)
    {
        $find = $request->id['id'];
        $status = Participant::find($find);
        $status->status = $request->data_val;
        $status->save();
        // return back()->with('success','Status Update Successfully');
        return response()->json(['success' => 'Status Updated Successfully']);
    }

    public function getGender(Request $request)
    {
        $groups = Group::where('id', $request->data_val)->first();
        return response()->json(['data' => $groups]);
    }
}
