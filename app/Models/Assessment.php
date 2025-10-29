<?php

namespace App\Models;

use App\Models\AssessmentType;
use App\Models\AssessmentResults;
use App\Models\AssessmentScoring;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Assessment extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'assessments';
    protected $fillable = [
        'Name', 'MaxParticipants', 'Sort', 'Status'
    ];

    protected $assesment;
    public  function addData($request)
    {

        DB::transaction(function () use ($request) {

            $assesments = Assessment::create([

                'Name' => $request->name,
                'MaxParticipants' => $request->maxparticipants,
                'Sort' => $request->sort,
                'Status' => 0,
            ]);
            $this->assesment = $assesments;
        });
        return $this->assesment;
    }
    public function assessment_scoring()
    {
        return $this->hasMany(AssessmentScoring::class, 'assessment_id', 'id')->OrderBy('MinValue', 'DESC');
    }

    public function assessment_results()
    {
        return $this->hasMany(AssessmentResults::class, 'assessment_id', 'id');
    }
       public function dt_recorded()
    {
        return $this->hasOne(AssessmentResults::class, 'AssessmentID', 'id')->OrderBy('id', 'DESC');
    }
    public function participant_results()
    {
        return $this->hasMany(AssessmentResults::class, 'AssessmentID', 'id')->where('ParticipantID',request()->route('id'))->orderBy('id',"DESC");
    }
    public function colors()
    {
        return $this->hasOne(Color::class, 'id', 'ColorID');
    }
    public function assessment_type()
    {
        return $this->hasOne(AssessmentType::class, 'id', 'AssessmentTypeID');
    }
    public function event_assessment()
    {
        return $this->hasOne(EventAssessment::class, 'AssessmentID', 'id');
    }
    public function assessment_events()
    {
        return $this->hasMany(EventAssessment::class, 'AssessmentID', 'id');
    }
}
