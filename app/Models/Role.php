<?php

namespace App\Models;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;


class Role extends Authenticatable
{
    use HasFactory, SoftDeletes;

    public function setPermissionAttribute($value)
    {
        $this->attributes['Permission'] = json_encode($value);
    }

    public function getPermissionAttribute($value)
    {
        return json_decode($value);
    }
}
