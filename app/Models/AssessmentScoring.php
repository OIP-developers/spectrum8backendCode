<?php

namespace App\Models;

use App\Models\Color;
use App\Models\Assessment;
use App\Models\AssessmentResults;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class AssessmentScoring extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'assessment_id', 'group_id', 'Gender', 'MinValue', 'MaxValue', 'color_id', 'Duration'
    ];

    protected $assesmentScore;
    public  function addData($request)
    {

        DB::transaction(function () use ($request) {

            $assesmentScores = AssessmentScoring::create([

                'Name' => $request->name,
                'color_id' => $request->color_id,
                'assessment_id' => $request->assessment_id,
                'Duration' => $request->duration,
            ]);
            $this->assesmentScore = $assesmentScores;
        });
        return $this->assesmentScore;
    }

    public function assessment()
    {
        return $this->belongsTo(Assessment::class, 'assessment_id', 'id');
    }
    public function color()
    {
        return $this->belongsTo(Color::class, 'color_id', 'id');
    }

    public function assessment_scoring_id()
    {
        return $this->hasMany(AssessmentResults::class);
    }
}
