<?php

namespace App\Models;

use App\Models\Device;
use App\Models\Organization;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;


class Facilitator extends Authenticatable
{
    use HasFactory, Notifiable, HasApiTokens, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $table = 'facilitators';
    protected $fillable = [
        'Firstname','Lastname', 'Email', 'Password'
    ];

    public function organization()
    {
        return $this->hasOne(Organization::class, 'id', 'OrganizationID');
    }
    public function devices()
    {
        return $this->hasMany(Device::class, 'facilitator_id', 'id');
    }
    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token','number_of_devices_login',
    ];

    

}
