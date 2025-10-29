<?php

namespace App\Models;

use App\Models\EventCatagory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class EventType extends Model
{
    use HasFactory;
    use SoftDeletes;
    public function event_category()
    {
        return $this->hasOne(EventCatagory::class, 'id', 'EventCatagoryID');
    }
}
