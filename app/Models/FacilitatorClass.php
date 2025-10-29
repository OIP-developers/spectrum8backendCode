<?php

namespace App\Models;

use App\Models\Classes;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class FacilitatorClass extends Model
{
    use HasFactory;
    use SoftDeletes;
    public function facilitator()
    {
        return $this->hasOne(Facilitator::class, 'id', 'FacilitatorID');
    }
    public function class()
    {
        return $this->hasOne(Classes::class, 'id', 'ClassID');
    }
}
