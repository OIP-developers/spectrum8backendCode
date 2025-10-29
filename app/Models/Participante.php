<?php

namespace App\Models;

use App\Models\Grade;
use App\Models\Group;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Participante extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'participantes';
    protected $fillable = [
        'Lastname', 'Firstname', 'Gender', 'grade_id', 'group_id', 'JerseyColor', 'Age', 'ParticipantTypeID', 'Status', 'JerseyNumber', 'JerseyColorID', 'Active'
    ];

    protected $participante;
    public  function addData($request)
    {

        DB::transaction(function () use ($request) {

            $participantes = Participante::create([

                'Lastname' => $request->lastname,
                'Firstname' => $request->firstname,
                'Gender' => $request->gender,
                'group_id' => $request->groupid,
                'Age' => $request->age,
                'ParticipantTypeID' => $request->participanttypeid,
                'JerseyNumber' => $request->jerseynumber,
                'JerseyColorID' => $request->jerseycolorid,
                'Active' => 1,
            ]);
            $this->participante = $participantes;
        });
        return $this->participante;
    }

    public function groups()
    {
        return $this->belongsTo(Group::class, 'group_id', 'id');
    }
    public function grades_participantes()
    {
        return $this->hasOne(Grade::class, 'id', 'grade_id');
    }
}
