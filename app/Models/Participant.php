<?php

namespace App\Models;

use App\Models\Color;
use App\Models\Grade;
use App\Models\Gender;
use App\Models\Classes;
use App\Models\Facilitator;
use App\Models\Organization;
use App\Models\GroupOrganization;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Participant extends Model
{
    use HasFactory;
    use SoftDeletes;
    public function gender()
    {
        return $this->hasOne(Gender::class, 'id', 'GenderID');
    }
    public function grade()
    {
        return $this->hasOne(Grade::class, 'id', 'GradeID');
    }
    public function organization()
    {
        return $this->hasOne(Organization::class, 'id', 'OrganizationID');
    }
    // public function group_organization()
    // {
    //     return $this->hasOne(GroupOrganization::class,'OrganizationID','OrganizationID');
    // }
    public function group_organization()
    {
        return $this->hasMany(GroupFacilitator::class,'FacilitatorID','FacilitatorID');
    }
    // public function group()
    // {
    //     return $this->hasOne(Group::class,'id',group_organization()->GroupID);
    // }
    public function facilitator()
    {
        return $this->hasOne(Facilitator::class, 'id', 'FacilitatorID');
    }
    public function participant_type()
    {
        return $this->hasOne(ParticipantType::class, 'id', 'ParticipantTypeID');
    }
    public function class()
    {
        return $this->hasOne(Classes::class, 'id', 'ClassID');
    }
    public function color()
    {
        return $this->hasOne(Color::class, 'id', 'JerseyColorID');
    }
    public function event()
    {
        return $this->hasMany(Event::class,'OrganizationID','OrganizationID')->where(['is_archive' => 'false', 'Status' => 1]);
    }
}
