<?php

namespace App\Exports;

use App\Models\AssessmentResults;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;


class AssessmentResultsExport implements FromCollection , WithHeadings , WithStyles
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        $results = AssessmentResults::
        join('assessment_scorings', 'assessment_results.assessment_score_id' , '=' ,'assessment_scorings.id')
        ->join('participantes', 'assessment_results.participant_id', '=', 'participantes.id')
        ->join('groups', 'assessment_results.group_id' , '=' ,'groups.id')
        ->join('grades', 'assessment_results.grade_id' , '=' ,'grades.id')
        ->join('assessments', 'assessment_results.assessment_id', '=', 'assessments.id')
        ->join('events', 'assessment_results.event_id', '=', 'events.id')
        ->select('assessment_results.id','participantes.Firstname','participantes.Lastname', 'grades.Name as Grade_Name', 'groups.Name as Group_Name','assessments.Name','assessment_results.score as assesst_score','events.name as Event_Name'
        // ,'assessment_results.duration as assesst_duration','assessment_results.distance as assesst_distance','assessment_results.beep as assesst_beep'
        )->get();
        // $results = AssessmentResults::with(['resultParticipant','assessment_scoring_data','assessments','resultGroup','resultGrade','resultEvent'])
        // ->select('assessment_results.id as id','resultParticipant.Firstname as First Name')
        // ->get();
        return $results;
    }
    public function headings(): array
    {
        return [
            'id',
            'First Name',
            'Last Name',
            'Grade',
            'Group',
            'Assessment',
            'Event',
            'Score',
            // 'Duration',
            // 'Distance',
            // 'Beep',
        ];
    }
    public function styles(Worksheet $sheet)
    {
        return [
            1    => ['font' => ['bold' => true]],
        ];
    }
}
