<?php

namespace App\Models;

use App\Models\Group;
use App\Models\Gender;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class GroupGender extends Model
{
    use HasFactory;
    // use SoftDeletes;
    public function gender()
    {
        return $this->hasOne(Gender::class, 'id', 'GenderID');
    }
    public function group()
    {
        return $this->hasOne(Group::class, 'id', 'GroupID');
    }
}
