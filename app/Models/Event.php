<?php

namespace App\Models;

use App\Models\Contact;
use App\Models\EventType;
use App\Models\Organization;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Event extends Model
{
    use HasFactory;
    use SoftDeletes;

    public function organization()
    {
        return $this->hasOne(Organization::class, 'id', 'OrganizationID');
    }
    public function facility_contact()
    {
        return $this->hasOne(Contact::class, 'id', 'FacilityContactID');
    }
    public function event_type()
    {
        return $this->hasOne(EventType::class, 'id', 'EventTypeID');
    }
}
