@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Trashed Results</h2>
            <hr class="w-50 mx-auto">




            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple" class="set_result">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Event</th>
                                <th>Participant</th>
                                <th>Assessment</th>
                                <th>Grade</th>
                                <th>Gender</th>
                                <th>Color</th>
                                <th>Results</th>
                                <th>DT Recorded</th>
                                <th>Attempt</th>
                                <th>Percent</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($results as $result)
                                {{-- @dd($result->assessments); --}}
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $result->resultEvent->Name ?? '' }}</td>
                                    <td>{{ $result->resultParticipant->Firstname ?? '' }}
                                        {{ $result->resultParticipant->Lastname ?? '' }}</td>
                                    <td>{{ $result->assessments->Name ?? '' }}</td>
                                    <td>{{ $result->resultGrade->Name ?? '' }}</td>
                                    <td>{{ $result->resultGender->Gender ?? '' }}
                                    </td>
                                    <td>
                                        <span
                                            style="background-color:{{ $result->color->WebColor ?? '' }};color: transparent;padding: 5px 40px;"></span>
                                    </td>
                                    <td>{{ $result->Results ?? '' }}
                                    <td>{{ $result->DTRecorded ?? '' }}
                                    <td>{{ $result->Attempt ?? '' }}
                                    <td>{{ $result->Percent ?? '' }}
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('result.restore', ['id' => $result->id]) }}"
                                                class="btn btn-success text-white" title="restore">
                                                <i class="fa fa-trash-arrow-up"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                @php
                                    $key++;
                                @endphp
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
@endsection
