<?php

namespace App\Imports;

use App\Models\Participant;

use Illuminate\Support\Facades\Auth;
use Maatwebsite\Excel\Concerns\ToModel;
use Maatwebsite\Excel\Concerns\WithHeadingRow;

class ParticipanteImport implements ToModel, WithHeadingRow
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        //return new Participante($row);
    //   dd($row);
    $participant = new Participant;
    // $participant->Lastname = $row['last_name'];
    // $participant->Firstname = $row['first_name'];
    // $participant->grade_id = $row['grade'];
    // $participant->group_id = $row['group'];
    // $participant->Age = $row['age'];
    // $participant->Gender = $row['gender'];
    // $participant->JerseyColor = $row['jersey_color'];
    // $participant->JerseyNumber = $row['jersey_number'];
    // $participant->Status = 0;
    // $participant->CreatedBy = Auth::user()->id;
    $participant->Firstname = $row['first_name'];
    $participant->Lastname = $row['last_name'];
    $participant->GenderID = $row['gender'];
    $participant->GradeID = $row['grade'];
    $participant->OrganizationID = $row['organization'];
    $participant->FacilitatorID = $row['facilitator'];
    $participant->ClassID = $row['class'];
    $participant->Age = $row['age'];
    $participant->JerseyNumber = $row['jersyNumber'];
    $participant->JerseyColorID = $row['jersyColor'];
    $participant->IsFacilitator = 1;
    $participant->IsActive = 1;
    $participant->S8S_ID = Auth::user()->id;
    $participant->CreatedBy = Auth::user()->id;
    $participant->save();

    return $participant;
        // return new Participante([
        //     'Lastname'     => $row['last_name'],
        //     'Firstname'     => $row['first_name'],
        //     'grade_id'    => $row['grade'], 
        //     'group_id'    => $row['group'], 
        //     'Age'    => $row['age'],
        //     'Gender'    => $row['gender'], 
        //     'JerseyColor'    => $row['jersey_color'], 
        //     'JerseyNumber'    => $row['jersey_number'],
        //     'Status'=>0,
        //     'CreatedBy'=>Auth::user()->id
        // ]);
    }
};