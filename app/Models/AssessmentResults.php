<?php

namespace App\Models;

use Carbon\Carbon;
use App\Models\Color;
use App\Models\Event;
use App\Models\Group;
use App\Models\Gender;
use App\Models\Assessment;
use App\Models\Participant;
use App\Models\Participante;
use App\Models\AssessmentScoring;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class AssessmentResults extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'assessment_results';
    protected $fillable = [
        'assessment_score_id', 'participant_id', 'group_id', 'grade_id', 'assessment_id', 'Score', 'Duration', 'Distance', 'Beep', 'event_id'
    ];

    protected $assesments_result;
    // public  function addData($request)
    // {
    //     DB::transaction(function () use ($request) {
    //         // $find_admin = User::where("id",$request->teacher_id)->first();

    //         $assesments_results = new AssessmentResults;
    //         $assesments_results->assessment_score_id = $request->assessment_score_id;
    //         $assesments_results->assessment_id = $request->assessment_id;
    //         $assesments_results->participant_id = $request->participant_id;
    //         $assesments_results->Score = $request->Score;
    //         $assesments_results->grade_id = $request->grade_id;
    //         $assesments_results->group_id = $request->group_id;
    //         $assesments_results->Duration = 0.03;
    //         // $assesments_results->Duration =$request->Duration;
    //         $assesments_results->Distance = $request->Distance;
    //         $assesments_results->Beep = $request->Beep;
    //         // $assesments_results->CreatedBy =$find_admin->CreatedBy;
    //         $assesments_results->event_id = $request->event_id;
    //         $assesments_results->save();

    //         $this->assesments_result = $assesments_results;
    //     });
    //     return $this->assesments_result;
    // }
    public  function addData($request)
    {
        DB::transaction(function () use ($request) {
            // $find_admin = User::where("id",$request->teacher_id)->first();
            $check_past = AssessmentResults::where(['ParticipantID'=>$request->participant_id,'AssessmentID'=>$request->assessment_id])->get();
            $ninty_five = NintyFive::where(['AssessmentID'=>$request->assessment_id,'GradeID'=>$request->grade_id,'GenderID'=>$request->gender_id])->first();
            $assesments_results = new AssessmentResults;
            $assesments_results->EventID = $request->event_id;
            $assesments_results->ParticipantID = $request->participant_id;
            $assesments_results->AssessmentID = $request->assessment_id;
            $assesments_results->GradeID = $request->grade_id;
            $assesments_results->GenderID = $request->gender_id;
            $assesments_results->ColorID = $request->color_id;
            $assesments_results->Results =$request->results;
            $assesments_results->DTRecorded = $request->dt_recorded;
            // $assesments_results->DTRecorded = date("Y-m-d H:i:s");
            $count_assessment = count($check_past)+1;
            $assesments_results->Attempt = $count_assessment;
            $assesments_results->Percent = $ninty_five->Percent;
            $assesments_results->CreatedBy = Auth::user()->id;
            $assesments_results->save();

            $this->assesments_result = $assesments_results;
        });
        return $this->assesments_result;
    }

    public function assessments()
    {
        return $this->hasOne(Assessment::class, 'id', 'AssessmentID');
    }
    public function color()
    {
        return $this->hasOne(Color::class, 'id', 'ColorID');
    }
    public function assessment_scoring_data()
    {
        return $this->hasOne(AssessmentScoring::class, 'id', 'assessment_score_id');
    }
    public function resultParticipant()
    {
        return $this->hasOne(Participant::class, 'id', 'ParticipantID');
    }
    public function resultGroup()
    {
        return $this->hasOne(Group::class, 'id', 'group_id');
    }
    public function resultGender()
    {
        return $this->hasOne(Gender::class, 'id', 'GenderID');
    }
    public function resultGrade()
    {
        return $this->hasOne(Grade::class, 'id', 'GradeID');
    }
    public function resultEvent()
    {
        return $this->hasOne(Event::class, 'id', 'EventID');
    }
    public function setDTRecordedAttribute($value)
    {
        $this->attributes['DTRecorded'] = Carbon::now()->timezone('PST')->toDateTimeString();
    }
    // public function participantEventResult()
    // {
    //     return $this->hasOne(Event::class, 'id', 'EventID');
    // }
}
