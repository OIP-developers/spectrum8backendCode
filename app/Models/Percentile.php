<?php

namespace App\Models;

use App\Models\Grade;
use App\Models\Assessment;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Percentile extends Model
{
    use HasFactory;
    use SoftDeletes;

    public function assessment()
    {
        return $this->hasOne(Assessment::class, 'id', 'assessment_id');
    }
    public function grade()
    {
        return $this->hasOne(Grade::class, 'id', 'grade_id');
    }
}
