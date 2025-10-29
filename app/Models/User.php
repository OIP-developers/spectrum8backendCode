<?php

namespace App\Models;

use App\Models\Organization;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Notifications\ResetPasswordNotification;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use HasFactory, Notifiable, HasApiTokens, SoftDeletes;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'role_id', 'device_token'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    public function roles()
    {
        return $this->hasOne(Role::class,'id','role_id');
    }
    public function customer()
    {
        return $this->hasOne(Customer::class);
    }
    public function sheet()
    {
        return $this->hasOne(gSheet::class, 'Client_Email', 'email');
    }
    public function invoice_data()
    {
        return $this->hasMany(Invoice::class, 'user_id', 'id');
    }
    public function organizationData()
    {
        return $this->hasOne(Organization::class, 'CreatedBy', 'id');
    }


    public function sendPasswordResetNotification($token)
    {

        $url = 'http://localhost/resd/public/api/reset-password?token=' . $token;

        $this->notify(new ResetPasswordNotification($url));
    }

    public function facilitator_assisstant()
    {
        return $this->hasOne(Self::class, 'id', 'facilitator_id');
    }
}
