<?php

namespace App\Models;

use App\Models\GroupGrade;
use App\Models\GroupOrganization;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Group extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $table = 'groups';
    protected $fillable = [
        'Name', 'Abbr', 'ColorID'
    ];

    // public function participantes(){

    //     return $this->belongsTo(Participante::class);
    // }

    public function participantes()
    {
        return $this->hasMany(Participante::class);
    }
    public function group_grade()
    {
        return $this->hasMany(GroupGrade::class,'GroupID','id');
    }
    public function group_organization()
    {
        return $this->hasMany(GroupOrganization::class,'GroupID','id');
    }
    public function group_facilitator()
    {
        return $this->hasMany(GroupFacilitator::class,'GroupID','id')->where('FacilitatorID',auth('sanctum')->user()->id);
    }
    public function group_gender()
    {
        return $this->hasMany(GroupGender::class,'GroupID','id');
    }
    public function group_Class()
    {
        return $this->hasMany(GroupClass::class,'GroupID','id');
    }



    public function group_grade_web()
    {
        return $this->hasOne(GroupGrade::class,'GroupID','id');
    }
    public function group_organization_web()
    {
        return $this->hasOne(GroupOrganization::class,'GroupID','id');
    }
    public function group_facilitator_web()
    {
        return $this->hasMany(GroupFacilitator::class,'GroupID','id');
    }
    public function group_gender_web()
    {
        return $this->hasOne(GroupGender::class,'GroupID','id');
    }
    public function group_class_web()
    {
        return $this->hasOne(GroupClass::class,'GroupID','id');
    }
}
