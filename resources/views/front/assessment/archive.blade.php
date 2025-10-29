@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Archive Assessments</h2>
            <hr class="mx-auto w-50">



            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Name</th>
                                <th>Short Name</th>
                                <th>Nick Name</th>
                                <th>Abbreviation</th>
                                <th>Max Participant</th>
                                <th>Assessment Type</th>
                                <th>Color</th>
                                <th>Sort</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($assessments as $assessment)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $assessment->Name ?? '' }}</td>
                                    <td>{{ $assessment->ShortName ?? '' }}</td>
                                    <td>{{ $assessment->NickName ?? '' }}</td>
                                    <td>{{ $assessment->Abbr ?? '' }}</td>
                                    <td>{{ $assessment->MaxParticipants ?? '' }}</td>
                                    <td>{{ $assessment->assessment_type->Name ?? '' }}</td>
                                    <td><span
                                            style="background-color:{{ $assessment->colors->WebColor ?? '' }};color: transparent;padding: 5px 40px;"></span>
                                    </td>
                                    <td>{{ $assessment->Sort ?? '' }}</td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('assessment.toggle.archive', ['id' => $assessment->id]) }}"
                                                class="btn btn-success text-white" title="unarchive">
                                                <i class="fa fa-clock-rotate-left"></i>
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
