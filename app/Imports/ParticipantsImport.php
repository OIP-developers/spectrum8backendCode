<?php

namespace App\Imports;

use App\Models\Participant;
use Maatwebsite\Excel\Concerns\ToModel;

class ParticipantsImport implements ToModel
{
    /**
    * @param array $row
    *
    * @return \Illuminate\Database\Eloquent\Model|null
    */
    public function model(array $row)
    {
        return new Participant([
                'Firstname'     => $row['Firstname'],
                'Lastname'     => $row['Lastname'],
                'group_id'    => $row['group_id'], 
                'Gender'    => $row['Gender'], 
                'Age'    => $row['Age'], 
                'JerseyColor'    => $row['JerseyColor'], 
                'JerseyNumber'    => $row['JerseyNumber'],
        ]);
    }
}
