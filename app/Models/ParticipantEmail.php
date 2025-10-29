<?php

namespace App\Models;

use App\Models\EmailType;
use App\Models\Participant;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class ParticipantEmail extends Model
{
    use HasFactory;
    use SoftDeletes;

    public function email_type()
    {
        return $this->hasOne(EmailType::class, 'id', 'EmailTypeID');
    }
    public function participant()
    {
        return $this->hasOne(Participant::class, 'id', 'ParticipantID');
    }
}
