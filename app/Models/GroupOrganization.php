<?php

namespace App\Models;

use App\Models\Group;
use App\Models\Organization;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class GroupOrganization extends Model
{
    use HasFactory;
    // use SoftDeletes;
    public function organization()
    {
        return $this->hasOne(Organization::class, 'id', 'OrganizationID');
    }
    public function group()
    {
        return $this->hasOne(Group::class, 'id', 'GroupID');
    }
}
