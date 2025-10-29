<?php

namespace App\Models;

use App\Models\Event;
use App\Models\Assessment;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class EventAssessment extends Model
{
    use HasFactory;
    use SoftDeletes;
    public function assessment()
    {
        return $this->hasOne(Assessment::class, 'id', 'AssessmentID');
    }
    public function event()
    {
        return $this->hasOne(Event::class, 'id', 'EventID');
    }
}
