<?php

namespace App\Models;

use App\Models\LicenseType;
use App\Models\Organization;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class License extends Model
{
    use SoftDeletes;
    use HasFactory;
    public function organization()
    {
        return $this->hasOne(Organization::class, 'id', 'OrganizationID');
    }
    public function license_type()
    {
        return $this->hasOne(LicenseType::class, 'id', 'LicenseTypeID');
    }
}
