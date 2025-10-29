<?php

namespace App\Http\Controllers\api;

use App\Models\Color;
use App\Models\Event;
use App\Models\Grade;
use App\Models\Group;
use App\Models\Device;
use App\Models\Gender;
use App\Models\Classes;
use App\Models\Contact;
use App\Models\EmailType;
use App\Models\EventType;
use App\Models\NintyFive;
use App\Models\Assessment;
use App\Models\GroupClass;
use App\Models\GroupGrade;
use App\Models\ContactType;
use App\Models\Facilitator;
use App\Models\GroupGender;
use App\Models\Participant;
use App\Models\Organization;
use Illuminate\Http\Request;
use App\Models\EventCatagory;
use App\Models\AssessmentType;
use App\Models\EventAssessment;
use App\Models\EventFacilitator;
use App\Models\FacilitatorClass;
use App\Models\GroupFacilitator;
use App\Models\OrganizationType;
use App\Models\ParticipantEmail;
use App\Models\AssessmentResults;
use App\Models\GroupOrganization;
use App\Models\AssessmentEvaluate;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Api\BaseController as BaseController;
use App\Models\License;

class ApiDashboardController extends BaseController
{

    // Lookups Functions

    public function grades()
    {
        try {
            $grades = Grade::with('colors')->where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$grades->isEmpty()) {
                return $this->sendResponse($grades, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function email_type()
    {
        try {
            $email_types = EmailType::where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$email_types->isEmpty()) {
                return $this->sendResponse($email_types, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function color()
    {
        try {

            $colors = Color::where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$colors->isEmpty()) {
                return $this->sendResponse($colors, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function class()
    {
        try {

            $classes = Classes::with('colors')->where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$classes->isEmpty()) {
                return $this->sendResponse($classes, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function assessment_type()
    {
        try {

            $assessment_types = AssessmentType::where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$assessment_types->isEmpty()) {
                return $this->sendResponse($assessment_types, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function ninty_five()
    {
        try {

            $ninty_fives = NintyFive::with('assessment', 'gender', 'grade')->where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$ninty_fives->isEmpty()) {
                return $this->sendResponse($ninty_fives, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }
    public function ninty_five_specific(Request $request)
    {
        try {
            $validator = Validator::make($request->all(), [
                'assessment_id' => 'required',
                'grade_id' => 'required',
                'gender_id' => 'required',
            ]);
            if ($validator->fails()) {
                return $this->sendError('Validation Error.', $validator->errors(), 400);
            }
            $ninty_fives = NintyFive::with('assessment', 'gender', 'grade')->where(['is_archive' => 'false', 'Status' => 1, 'AssessmentID' => $request->assessment_id, 'GradeID' => $request->grade_id, 'GenderID' => $request->gender_id])->get();

            if (!$ninty_fives->isEmpty()) {
                return $this->sendResponse($ninty_fives, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function organization_type()
    {
        try {

            $organization_types = OrganizationType::where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$organization_types->isEmpty()) {
                return $this->sendResponse($organization_types, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function assessment()
    {
        try {

            $assessments = Assessment::with('assessment_events.event', 'assessment_type', 'colors', 'dt_recorded')->where(['is_archive' => 'false', 'Status' => 1])->orderBy('Sort', 'ASC')->get();

            if (!$assessments->isEmpty()) {
                return $this->sendResponse($assessments, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function assessmentById($id)
    {
        try {

            $assessments = Assessment::with('assessment_type', 'colors')->where(['is_archive' => 'false', 'Status' => 1, 'id' => $id])->get();

            if (!$assessments->isEmpty()) {
                return $this->sendResponse($assessments, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function assessment_evaluate()
    {
        try {

            $assessment_evaluates = AssessmentEvaluate::with('assessment')->where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$assessment_evaluates->isEmpty()) {
                return $this->sendResponse($assessment_evaluates, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function gender()
    {
        try {

            $genders = Gender::where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$genders->isEmpty()) {
                return $this->sendResponse($genders, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function contact()
    {
        try {

            $contacts = Contact::with('contact_type', 'organization', 'facilitator')->where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$contacts->isEmpty()) {
                return $this->sendResponse($contacts, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function contact_type()
    {
        try {

            $contact_types = ContactType::where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$contact_types->isEmpty()) {
                return $this->sendResponse($contact_types, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function event_catagory()
    {
        try {

            $event_catagorys = EventCatagory::where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$event_catagorys->isEmpty()) {
                return $this->sendResponse($event_catagorys, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function event_type()
    {
        try {

            $event_types = EventType::with('event_category')->where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$event_types->isEmpty()) {
                return $this->sendResponse($event_types, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    // Lookups Functions

    // Organization Functions

    public function organization()
    {
        try {

            $organizations = Organization::with('organization_type')->where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$organizations->isEmpty()) {
                return $this->sendResponse($organizations, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }


    // Organization Functions

    // Facilitator Functions

    public function facilitator()
    {
        try {

            $facilitators = Facilitator::with('organization')->where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$facilitators->isEmpty()) {
                return $this->sendResponse($facilitators, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function facilitator_class()
    {
        try {

            $facilitator_classes = FacilitatorClass::with('facilitator')->where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$facilitator_classes->isEmpty()) {
                return $this->sendResponse($facilitator_classes, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }


    // Facilitator Functions

    // Participant Functions

    public function participant(Request $request)
    {
        try {
            $auth_id = auth('sanctum')->user()->id;

            if (isset($request->group_id)) {
                $group = Group::with(['group_grade.grade', 'group_gender.gender', 'group_class.class'])
                    ->where(['is_archive' => 'false', 'Status' => 1, 'id' => $request->group_id])
                    ->first();

                if (isset($group)) {
                    $participants = Participant::where('FacilitatorID', $auth_id)
                        ->with(['event', 'gender', 'grade', 'organization', 'facilitator', 'class', 'color', 'group_organization', 'participant_type'])
                        ->whereIn('GradeID', $group->group_grade->pluck('GradeID'))
                        ->whereIn('GenderID', $group->group_gender->pluck('GenderID'))
                        ->whereIn('ClassID', $group->group_class->pluck('ClassID'))
                        ->orderBy('Firstname', 'ASC')
                        ->get();
                }
            } else {
                $participants = Participant::with(['event', 'gender', 'grade', 'organization', 'facilitator', 'class', 'color', 'group_organization', 'participant_type'])
                    ->where(['is_archive' => 'false', 'FacilitatorID' => $auth_id])
                    ->orderBy('Firstname', 'ASC')
                    ->get();
            }

            if ($participants->isNotEmpty()) {
                return $this->sendResponse($participants, 'Data fetched successfully.', 200);
            } else {
                return $this->sendError('Record Not Found', ['error' => 'Record Not Found'], 200);
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }


    // public function participant(Request $request)
    // {
    //     try {
    //         $auth_id =  auth('sanctum')->user()->id;
    //         if (isset($request->group_id)) {
    //             $group = Group::with('group_grade.grade', 'group_gender.gender', 'group_class.class')->where(['is_archive' => 'false', 'Status' => 1, 'id' => $request->group_id])->first();
    //             if (isset($group)) {
    //                 $data_filter = array();
    //                 foreach ($group->group_grade as $data_find) {
    //                     $data = Participant::where('GradeID', $data_find->GradeID)->where('FacilitatorID', $auth_id)->with('event', 'gender', 'grade', 'organization', 'facilitator', 'class', 'color', 'group_organization', 'participant_type')->first();
    //                     if ($data != null) {
    //                         array_push($data_filter, $data);
    //                     }
    //                 }
    //                 // return $data_filter;
    //                 foreach ($group->group_gender as $data_find2) {
    //                     $data = Participant::where('GenderID', $data_find2->GenderID)->where('FacilitatorID', $auth_id)->with('event', 'gender', 'grade', 'organization', 'facilitator', 'class', 'color', 'group_organization', 'participant_type')->first();
    //                     // if (count($data) != 0) {
    //                     //     $data_filter[] = $data;
    //                     // }
    //                     if ($data != null) {
    //                         array_push($data_filter, $data);
    //                     }
    //                 }
    //                 foreach ($group->group_class as $data_find3) {
    //                     $data = Participant::where('ClassID', $data_find3->ClassID)->where('FacilitatorID', $auth_id)->with('event', 'gender', 'grade', 'organization', 'facilitator', 'class', 'color', 'group_organization', 'participant_type')->first();
    //                     if ($data != null) {
    //                         array_push($data_filter, $data);
    //                     }
    //                 }
    //                 // if (count($data_filter) != 0) {
    //                 //     $participants = $data_filter[0];
    //                 // }
    //                 // $data = array_filter($data_filter, function ($value) {
    //                 //     dd($value);
    //                 //     // if (count($value) != 0) {
    //                 //         return !empty($value);
    //                 //     // }
    //                 // });
    //                 $participants1 = array_unique($data_filter);
    //                 $participants = array_merge($participants1, array());
    //             }
    //         } else {
    //             $participants = Participant::with('event', 'gender', 'grade', 'organization', 'facilitator', 'class', 'color', 'group_organization', 'participant_type')->where(['is_archive' => 'false', 'FacilitatorID' => $auth_id])->get();
    //         }
    //         // dd($participants);

    //         if (isset($participants)) {
    //             return $this->sendResponse($participants, 'Data Fetched successfully.', 200);
    //         } else {
    //             return $this->sendError(
    //                 'Invalid.',
    //                 ['error' => 'Record Not Found'],
    //                 200
    //             );
    //         }
    //     } catch (\Exception $e) {
    //         return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
    //     }
    // }

    public function participant_email()
    {
        try {

            $participant_emails = ParticipantEmail::with('participant', 'email_type')->where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$participant_emails->isEmpty()) {
                return $this->sendResponse($participant_emails, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function participant_status(Request $request)
    {
        try {

            $participant = Participant::find($request->id);

            if (!empty($participant)) {
                if ($participant->Status == 0) {
                    $participant->Status = 1;
                    $participant->save();
                    $mxg = "Activated";
                } elseif ($participant->Status == 1) {
                    $participant->Status = 0;
                    $participant->save();
                    $mxg = "Deactivated";
                }
                return $this->sendResponse($participant, 'Participant ' . $mxg . ' successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function ParticipantByID($id)
    {
        try {

            $participant = AssessmentResults::with('resultEvent', 'resultParticipant', 'assessments', 'resultGrade', 'resultGender', 'color')->where('ParticipantID', $id)->orderBy('id', 'DESC')->get();

            if (!$participant->isEmpty()) {
                return $this->sendResponse($participant, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function AssessmentResultByPID($id)
    {
        try {
            $assessments = Assessment::with('participant_results', 'participant_results.resultEvent', 'participant_results.resultParticipant', 'participant_results.resultGrade', 'participant_results.resultGender', 'participant_results.color')->where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$assessments->isEmpty()) {
                return $this->sendResponse($assessments, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }
    // Participant Functions

    // Group Functions

    public function group()
    {
        try {
            // $facilitator = GroupFacilitator::where(['is_archive' => 'false', 'Status' => 1, 'FacilitatorId' => auth('sanctum')->user()->id])->get();
            // dd(count($facilitator));
            // foreach ($facilitator as $items) {
            // $group = Group::with('group_grade.grade', 'group_gender.gender', 'group_class.class')->where(['is_archive' => 'false', 'Status' => 1, 'id' => $items->GroupID])->first();
            $group = Group::with('group_grade.grade', 'group_gender.gender', 'group_class.class')->where(['is_archive' => 'false', 'Status' => 1])->get();
            // }
            // $data = array_unique($group);
            // $renumbered = array_merge($data, array());
            // dd(count(array_unique($group)));
            if (isset($group)) {
                return $this->sendResponse($group, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function group_filter($id)
    {
        try {
            $group = Group::with('group_grade.grade', 'group_gender.gender', 'group_class.class')->where(['is_archive' => 'false', 'Status' => 1, 'id' => $id])->first();
            // dd($group->group_grade,$group->group_gender,$group->group_class);
            // $participant = [];

            // foreach ([$group->group_grade, $group->group_gender, $group->group_class] as $group_type) {
            //     $ids = [];
            //     foreach ($group_type as $data_find) {
            //         $ids[] = $data_find->GradeID ?? $data_find->GenderID ?? $data_find->ClassID;
            //     }
            //     $participant[] = Participant::where('FacilitatorID', auth('sanctum')->user()->id)->orWhere('GradeID', $ids[0])->orWhere('GenderID', $ids[1])->orWhere('ClassID', $ids[2])->get();
            // }
            // return $participant;
            // $participant = array_unique($participant);


            $participant = [];
            foreach ($group->group_grade as $data_find) {
                $participant[] = Participant::where('GradeID', $data_find->GradeID)->where('FacilitatorID', auth('sanctum')->user()->id)->get();
            }
            foreach ($group->group_gender as $data_find2) {
                $participant[] = Participant::where('GenderID', $data_find2->GenderID)->where('FacilitatorID', auth('sanctum')->user()->id)->get();
            }
            foreach ($group->group_class as $data_find3) {
                $participant[] = Participant::where('ClassID', $data_find3->ClassID)->where('FacilitatorID', auth('sanctum')->user()->id)->get();
            }
            $data = array_filter($participant, function ($value) {
                if (count($value) != 0) {
                    return $value;
                }
            });
            $renumbered = array_merge($data, array());
            if (!empty($renumbered)) {
                return $this->sendResponse($renumbered[0], 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return $e;
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function group_organization()
    {
        try {

            $group_organizations = GroupOrganization::with('group', 'organization')->where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$group_organizations->isEmpty()) {
                return $this->sendResponse($group_organizations, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function group_facilitator()
    {
        try {

            $group_facilitators = GroupFacilitator::with('group', 'facilitator')->where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$group_facilitators->isEmpty()) {
                return $this->sendResponse($group_facilitators, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function group_gender()
    {
        try {

            $group_genders = GroupGender::with('group', 'gender')->where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$group_genders->isEmpty()) {
                return $this->sendResponse($group_genders, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function group_grade()
    {
        try {

            $group_grades = GroupGrade::with('group', 'grade')->where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$group_grades->isEmpty()) {
                return $this->sendResponse($group_grades, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function group_class()
    {
        try {

            $group_classes = GroupClass::with('group', 'class')->where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$group_classes->isEmpty()) {
                return $this->sendResponse($group_classes, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    // Group Functions

    // Event Functions

    public function event()
    {
        try {
            $id = Auth::user()->id;
            $facilitator = Facilitator::where(['is_archive' => 'false', 'Status' => 1, 'id' => $id])->first();
            $org = Organization::where(['is_archive' => 'false', 'Status' => 1, 'id' => $facilitator->OrganizationID])->first();
            $events = Event::with('organization', 'facility_contact', 'event_type')->where(['is_archive' => 'false', 'Status' => 1, 'OrganizationID' => $org->id])->get();
            // $event_facilitator = EventFacilitator::where(['is_archive' => 'false', 'Status' => 1,'facilitatorID'=>$id])->get();
            // if(count($event_facilitator) != 0){
            //     foreach($event_facilitator as $facilitator_events){
            //         $event_data[] = Event::with('organization', 'facility_contact', 'event_type')->where(['is_archive' => 'false', 'Status' => 1,'id'=>$facilitator_events->EventID])->first();
            //     }
            //     $events = array_unique($event_data);
            // }
            // else{
            // $events = Event::with('organization', 'facility_contact', 'event_type')->where(['is_archive' => 'false', 'Status' => 1,'id'=>0])->get();
            // }
            if (count($events) != 0 || !$events->isEmpty()) {
                return $this->sendResponse($events, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function event_assessment()
    {
        try {

            $event_assessments = EventAssessment::with('event', 'assessment')->where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$event_assessments->isEmpty()) {
                return $this->sendResponse($event_assessments, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    // Group Functions

    // Assessment Result

    public function assessment_result_post(Request $request)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'event_id' => 'required',
                'participant_id' => 'required',
                'assessment_id' => 'required',
                'grade_id' => 'required',
                'gender_id' => 'required',
                'color_id' => 'required',
                'results' => 'required|max:25',
                'dt_recorded' => 'required|date',
                // 'attempt' => 'required|integer',
                // 'percent' => 'required|integer'
            ]);
            if ($validator->fails()) {
                return $this->sendError('Validation Error.', $validator->errors(), 400);
            }
            $ninty_five = NintyFive::where(['AssessmentID' => $request->assessment_id, 'GradeID' => $request->grade_id, 'GenderID' => $request->gender_id])->first();
            if (!isset($ninty_five)) {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Ninty Five Percent Not Found'],
                    200
                );
            } else {
                $assest_result = new AssessmentResults();
                $insertedResult = $assest_result->addData($request);
                if ($insertedResult) {

                    // $client = new \Ably\AblyRest('Wcbs9w.CsxYNQ:uHtRcafdNc-nEHWjbTjN791dfR0FBm9ls10J2aQBxk4');
                    $client = new \Ably\AblyRest('GB15rw.5ontmA:MBH5BOzcml0w-JEGUwQN39_3YQSD1S9hs4qYu4qOtBY');

                    $channel = $client->channel('test');


                    $participant = AssessmentResults::where(['ParticipantID' => $request->participant_id, 'id' => $insertedResult->id])->where(['is_archive' => 'false', 'Status' => 1])->get();

                    $da = json_encode($participant[0]);

                    $channel->publish('myEvent', $da);
                }
            }
        } catch (\Exception $ex) {
            DB::rollback();
            return response()->json(['success' => false, 'message' => $ex->getMessage()], 500);
        }
        DB::commit();
        return $this->sendResponse($participant[0], 'Result Added successfully .', 200);
    }

    public function login_count(Request $request)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'login_count' => 'required',
            ]);
            if ($validator->fails()) {
                return $this->sendError('Validation Error.', $validator->errors(), 400);
            }
            $auth_id =  auth('sanctum')->user()->id;
            $login_count = Facilitator::find($auth_id);
            $login_count->number_of_devices_login = $request->login_count;
            $login_count->save();
            $data = Facilitator::find($auth_id);
        } catch (\Exception $ex) {
            DB::rollback();
            return response()->json(['success' => false, 'message' => $ex->getMessage()], 500);
        }
        DB::commit();
        return $this->sendResponse($data, 'Count Added successfully .', 200);
    }

    public function device_info(Request $request)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'device_id' => 'required',
                'device_name' => 'required',
            ]);
            if ($validator->fails()) {
                return $this->sendError('Validation Error.', $validator->errors(), 400);
            }
            $auth_id =  auth('sanctum')->user()->id;
            $device = new Device;
            $device->device_id = $request->device_id;
            $device->device_name = $request->device_name;
            $device->facilitator_id = $auth_id;
            $device->save();
        } catch (\Exception $ex) {
            DB::rollback();
            return response()->json(['success' => false, 'message' => $ex->getMessage()], 500);
        }
        DB::commit();
        return $this->sendResponse($device, 'Device Added successfully .', 200);
    }
    public function license_valid(Request $request)
    {
        try {
            $auth_id = auth("sanctum")->user()->id;

            $facilitator = Facilitator::where('id', $auth_id)->with('devices')->first();
            $license = License::where('OrganizationID', $facilitator->OrganizationID)->with('license_type')->first();

            $auth = auth('sanctum')->user();
            $organization = Organization::where('id', $auth->OrganizationID)->first();
            $facilitators = Facilitator::where(['Status' => 1, 'OrganizationID' => $organization->id])->get()->count();
            $participant = Participant::where(['Status' => 1, 'OrganizationID' => $organization->id])->get()->count();
            $number_of_devices = Device::where('facilitator_id', $auth->id)->get()->count();
            $res = ["license" => $license, "facilitator_count" => $facilitators, "participant_count" => $participant, "number_of_devices" => $number_of_devices];
            if (isset($res)) {
                return $this->sendResponse($res, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }
    public function login_devices(Request $request)
    {
        try {
            $auth_id = auth("sanctum")->user()->id;

            $logged_in_devices = Facilitator::where('id', $auth_id)->with('devices')->first();

            if (isset($logged_in_devices)) {
                return $this->sendResponse($logged_in_devices, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    public function remove_device(Request $request)
    {
        DB::beginTransaction();
        try {
            $validator = Validator::make($request->all(), [
                'device_id' => 'required',
            ]);
            if ($validator->fails()) {
                return $this->sendError('Validation Error.', $validator->errors(), 400);
            }
            $auth_id =  auth('sanctum')->user()->id;
            $device = Device::where('device_id', $request->device_id)->first();
            $device->delete();
        } catch (\Exception $ex) {
            DB::rollback();
            return response()->json(['success' => false, 'message' => $ex->getMessage()], 500);
        }
        DB::commit();
        return $this->sendResponse($device, 'Device Remove successfully .', 200);
    }

    public function assessment_result()
    {
        try {

            $assessment_results = AssessmentResults::with('resultEvent', 'resultParticipant', 'assessments', 'resultGrade', 'resultGender', 'color')->where(['is_archive' => 'false', 'Status' => 1])->get();

            if (!$assessment_results->isEmpty()) {
                return $this->sendResponse($assessment_results, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    // Assessment Result

    // Event Assessment Fetch

    public function EventAssessmentFetch()
    {
        try {
            $auth_id =  auth('sanctum')->user()->id;
            $facilitator = Facilitator::where(['is_archive' => 'false', 'Status' => 1, 'id' => $auth_id])->first();
            $organizations = Organization::where(['is_archive' => 'false', 'Status' => 1, 'id' => $facilitator->OrganizationID])->get();
            foreach ($organizations as $org_item) {
                $event = Event::where(['is_archive' => 'false', 'Status' => 1, 'OrganizationID' => $org_item->id])->get();

                foreach ($event as $all_events_item) {
                    $event_assessments = EventAssessment::where(['is_archive' => 'false', 'Status' => 1, 'EventID' => $all_events_item->id])->get();
                    foreach ($event_assessments as $event_assessments_items) {
                        $assessments[] = Assessment::with('event_assessment', 'event_assessment.event')->where(['is_archive' => 'false', 'Status' => 1, 'id' => $event_assessments_items->AssessmentID])->first();
                    }
                }
            }
            // return $assessments;
            $data_int = array_unique($assessments);
            $renumbered = array_merge($data_int, array());
            $data_en = json_encode($renumbered);
            $data = json_decode($data_en);
            if (count($data) != 0) {
                return $this->sendResponse($data, 'Data Fetched successfully.', 200);
            } else {
                return $this->sendError(
                    'Invalid.',
                    ['error' => 'Record Not Found'],
                    200
                );
            }
        } catch (\Exception $e) {
            return response()->json(['success' => false, 'message' => $e->getMessage()], 500);
        }
    }

    // Event Assessment Fetch

}
