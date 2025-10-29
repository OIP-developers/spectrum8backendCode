<?php

namespace App\Models;

use App\Models\Contact;
use App\Models\OrganizationType;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Organization extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $fillable = [
        'Name', 'Abbr', 'Address', 'City', 'StateProvince', 'PostalCode', 'OrgEmail', 'CreatedBy'
    ];

    public function organization_type()
    {
        return $this->hasOne(OrganizationType::class,'id','OrganizationTypeID');
    }
    public function contact()
    {
        return $this->hasOne(Contact::class,'id','PrimaryContactID');
    }
}
