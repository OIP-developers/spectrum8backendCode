<?php

namespace App\Models;

use App\Models\AssessmentScoring;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Color extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'colors';
    protected $fillable = [
        'Name', 'Information', 'Sort', 'WebColor'
    ];

    public function assessment_scoring_color()
    {
        return $this->hasMany(AssessmentScoring::class, 'color_id', 'id');
    }
    // public function scoring_color()
    // {
    //     return $this->belongsTo(AssessmentScoring::class,'color_id','id');
    // }
}
