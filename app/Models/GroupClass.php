<?php

namespace App\Models;

use App\Models\Classes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class GroupClass extends Model
{
    use HasFactory;
    // use SoftDeletes;
    public function class()
    {
        return $this->hasOne(Classes::class, 'id', 'ClassID');
    }
    public function group()
    {
        return $this->hasOne(Group::class, 'id', 'GroupID');
    }
}
