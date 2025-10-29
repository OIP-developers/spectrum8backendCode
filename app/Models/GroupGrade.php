<?php

namespace App\Models;

use App\Models\Grade;
use App\Models\Group;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class GroupGrade extends Model
{
    use HasFactory;
    // use SoftDeletes;
    public function grade()
    {
        return $this->hasOne(Grade::class, 'id', 'GradeID');
    }
    public function group()
    {
        return $this->hasOne(Group::class, 'id', 'GroupID');
    }
}
