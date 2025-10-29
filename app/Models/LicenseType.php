<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class LicenseType extends Model
{
    public $hidden = ['DurationDays'];
    use SoftDeletes;
    use HasFactory;
}
