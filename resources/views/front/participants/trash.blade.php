@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Trashed Participants</h2>
            <hr class="w-50 mx-auto">



            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Name</th>
                                <th>Gender</th>
                                <th>Grade</th>
                                <th>Organization</th>
                                <th>Facilitator</th>
                                <th>Participant Type</th>
                                <th>Class</th>
                                <th>Age</th>
                                <th>Jersey Number</th>
                                <th>Jersey Color</th>
                                {{-- <th>Is Facilitator</th>
                                <th>Is Active</th> --}}
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($participants as $participant)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $participant->Firstname ?? '' }} {{ $participant->Lastname ?? '' }}</td>
                                    <td>{{ $participant->gender->Gender ?? '' }}</td>
                                    <td>{{ $participant->grade->Name ?? '' }}</td>
                                    <td>{{ $participant->organization->Name ?? '' }}</td>
                                    <td>{{ $participant->facilitator->Firstname ?? '' }}
                                        {{ $participant->facilitator->Lastname ?? '' }}</td>
                                    <td>{{ $participant->participant_type->Classification ?? '' }}</td>
                                    <td>{{ $participant->class->Name ?? '' }}</td>
                                    <td>{{ $participant->Age ?? '' }}</td>
                                    <td>{{ $participant->JerseyNumber ?? '' }}</td>
                                    <td>
                                        <span
                                            style="background-color:{{ $participant->color->WebColor ?? '' }};color: transparent;padding: 5px 40px;"></span>
                                    </td>
                                    {{-- <td>{{ $participant->IsFacilitator == 1 ? 'Yes' : 'No' }}</td>
                                    <td>{{ $participant->IsActive == 1 ? 'Yes' : 'No' }}</td> --}}
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('participant.restore', ['id' => $participant->id]) }}"
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
