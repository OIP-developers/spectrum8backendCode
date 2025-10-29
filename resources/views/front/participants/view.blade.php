@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Participants</h2>
            <hr class="w-50 mx-auto">



            @if (in_array('participant_create', roles_and_permissions()) ||
                    in_array('participant_archive', roles_and_permissions()) ||
                    in_array('participant_delete', roles_and_permissions()))
                <div class="d-flex justify-content-between mb-3">
                    <div>
                        @if (in_array('participant_delete', roles_and_permissions()))
                            <a class="btn btn-danger text-white" href="{{ route('participant.trash') }}">Trash</a>
                        @endif
                        @if (in_array('participant_archive', roles_and_permissions()))
                            <a class="btn btn-success text-white" href="{{ route('participant.archive') }}">Archive</a>
                        @endif
                    </div>
                    @if (in_array('participant_create', roles_and_permissions()))
                        <a class="btn btn-secondary text-white" href="{{ route('participant.assign') }}">Assign
                            Participant</a>
                    @endif
                    @if (in_array('participant_create', roles_and_permissions()))
                        <div>
                            <a class="btn btn-info text-white" href="{{ route('participant.form') }}">Add Participants</a>
                            {{-- <a class="btn btn-success text-white" href="{{ route('participant.importParticipant') }}">Import
                                Participants</a> --}}
                        </div>
                    @endif
                </div>
            @endif
            <div class="card mb-4">
                <div class="card-body">
                    @if (in_array('participant_delete', roles_and_permissions()))
                        <form action="{{ route('participant.bulk_delete') }}" method="GET">
                            <div class="text-end mb-3">
                                <input type="submit" class="btn btn-danger text-white" value="Bulk Delete">
                            </div>
                    @endif
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th><input type="checkbox" class="select_all" name="" id=""></th>
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
                                @if (in_array('participant_update', roles_and_permissions()))
                                    <th>Status</th>
                                @endif
                                @if (in_array('participant_update', roles_and_permissions()) ||
                                        in_array('participant_archive', roles_and_permissions()) ||
                                        in_array('participant_delete', roles_and_permissions()))
                                    <th>Action</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($participants as $participant)
                                <tr>
                                    <td><input type="checkbox" name="bulk_action[]" value="{{ $participant->id }}"
                                            id=""></td>
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
                                    @if (in_array('participant_update', roles_and_permissions()))
                                        <td>
                                            <select name="status" class="status_change" data-id="{{ $participant->id }}"
                                                data-route="{{ route('change_status_participants') }}">
                                                <option value="1" @if ($participant->Status == 1) selected @endif>
                                                    Active
                                                </option>
                                                <option value="0" @if ($participant->Status == 0) selected @endif>
                                                    Deactive
                                                </option>
                                            </select>
                                        </td>
                                    @endif
                                    @if (in_array('participant_update', roles_and_permissions()) ||
                                            in_array('participant_archive', roles_and_permissions()) ||
                                            in_array('participant_delete', roles_and_permissions()))
                                        <td>
                                            <div class="d-flex">
                                                @if (in_array('participant_update', roles_and_permissions()))
                                                    <a href="{{ route('participant.edit', ['id' => $participant->id]) }}"
                                                        class="btn btn-info text-white">
                                                        <i class="fa fa-pen"></i>
                                                    </a>
                                                @endif
                                                @if (in_array('participant_delete', roles_and_permissions()))
                                                    <a href="{{ route('participant.delete', ['id' => $participant->id]) }}"
                                                        class="btn btn-danger me-2">
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                @endif
                                                @if (in_array('participant_archive', roles_and_permissions()))
                                                    <a href="{{ route('participant.toggle.archive', ['id' => $participant->id]) }}"
                                                        class="btn btn-success text-white" title="Archive">
                                                        <i class="fa fa-box-archive"></i>
                                                    </a>
                                                @endif
                                            </div>
                                        </td>
                                    @endif
                                </tr>
                                @php
                                    $key++;
                                @endphp
                            @endforeach
                        </tbody>
                    </table>
                    @if (in_array('participant_delete', roles_and_permissions()))
                        </form>
                    @endif
                </div>
            </div>
        </div>
    </main>
@endsection
