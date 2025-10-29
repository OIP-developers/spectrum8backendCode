<?php

namespace App\Models;

use App\Models\Grade;
use App\Models\Gender;
use App\Models\Assessment;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class NintyFive extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $appends = ['Percent','ColorSegment','DistanceToRed'];
    // protected $appends = ['RL','RU','BL','BU','GL','GU','OL','OU','VL','VU','YL','YU','PL','PU','WL','WU'];
    public function assessment()
    {
        return $this->hasOne(Assessment::class, 'id', 'AssessmentID');
    }
    public function grade()
    {
        return $this->hasOne(Grade::class, 'id', 'GradeID');
    }
    public function gender()
    {
        return $this->hasOne(Gender::class, 'id', 'GenderID');
    }
    public function getPercentAttribute($value)
    {
        if (request()->is('api/*')) {
            return ($this->attributes['Percent'])/100;
        }
        else{
            return $this->attributes['Percent'];
        }
    }
    public function getColorSegmentAttribute($value)
    {
        return number_format($this->attributes['ColorSegment'], 2);
    }
    public function getDistanceToRedAttribute($value)
    {
        return number_format($this->attributes['DistanceToRed'], 2);
    }
    // public function getRLAttribute($value)
    // {
    //     return round($this->attributes['RL']);
    // }
    // public function getRUAttribute($value)
    // {
    //     return round($this->attributes['RU']);
    // }
    // public function getBLAttribute($value)
    // {
    //     return round($this->attributes['BL']);
    // }
    // public function getBUAttribute($value)
    // {
    //     return round($this->attributes['BU']);
    // }
    // public function getGLAttribute($value)
    // {
    //     return round($this->attributes['GL']);
    // }
    // public function getGUAttribute($value)
    // {
    //     return round($this->attributes['GU']);
    // }
    // public function getOLAttribute($value)
    // {
    //     return round($this->attributes['OL']);
    // }
    // public function getOUAttribute($value)
    // {
    //     return round($this->attributes['OU']);
    // }
    // public function getVLAttribute($value)
    // {
    //     return round($this->attributes['VL']);
    // }
    // public function getVUAttribute($value)
    // {
    //     return round($this->attributes['VU']);
    // }
    // public function getYLAttribute($value)
    // {
    //     return round($this->attributes['YL']);
    // }
    // public function getYUAttribute($value)
    // {
    //     return round($this->attributes['YU']);
    // }
    // public function getPLAttribute($value)
    // {
    //     return round($this->attributes['PL']);
    // }
    // public function getPUAttribute($value)
    // {
    //     return round($this->attributes['PU']);
    // }
    // public function getWLAttribute($value)
    // {
    //     return round($this->attributes['WL']);
    // }
    // public function getWUAttribute($value)
    // {
    //     return round($this->attributes['WU']);
    // }
}
