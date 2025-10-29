<?php

namespace App\Models;

use App\Models\Group;
use App\Models\Facilitator;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class GroupFacilitator extends Model
{
    use HasFactory;
    // use SoftDeletes;
    public function facilitator()
    {
        return $this->hasOne(Facilitator::class, 'id', 'FacilitatorID');
    }
    public function group()
    {
        return $this->hasOne(Group::class, 'id', 'GroupID');
    }
    public function participants()
    {
        return $this->hasMany(Participant::class,'FacilitatorID','FacilitatorID');
    }
}
