<?php

namespace App\Models;

use App\Models\ContactType;
use App\Models\Facilitator;
use App\Models\Organization;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Contact extends Model
{
    use HasFactory;
    use SoftDeletes;
    public function contact_type()
    {
        return $this->hasOne(ContactType::class, 'id', 'ContactTypeID');
    }
    public function organization()
    {
        return $this->hasOne(Organization::class, 'id', 'OrganizationID');
    }
    public function facilitator()
    {
        return $this->hasOne(Facilitator::class, 'id', 'FacilitatorID');
    }
}
