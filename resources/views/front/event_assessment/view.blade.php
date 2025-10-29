@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Event Assessments</h2>
            <hr class="w-50 mx-auto">


            @if (in_array('event_create', roles_and_permissions()) ||
                    in_array('event_archive', roles_and_permissions()) ||
                    in_array('event_delete', roles_and_permissions()))
                <div class="d-flex justify-content-between mb-3">
                    <div>
                        @if (in_array('event_delete', roles_and_permissions()))
                            <a class="btn btn-danger text-white" href="{{ route('event_assessment.trash') }}">Trash</a>
                        @endif
                        @if (in_array('event_archive', roles_and_permissions()))
                            <a class="btn btn-success text-white" href="{{ route('event_assessment.archive') }}">Archive</a>
                        @endif
                    </div>
                    @if (in_array('event_create', roles_and_permissions()))
                        <a class="btn btn-info text-white" href="{{ route('event_assessment.form') }}">Add Event
                            Assessment</a>
                    @endif
                </div>
            @endif
            <div class="card mb-4">
                <div class="card-body">
                    @if (in_array('event_delete', roles_and_permissions()))
                        <form action="{{ route('event_assessment.bulk_delete') }}" method="GET">
                            <div class="text-end mb-3">
                                <input type="submit" class="btn btn-danger text-white" value="Bulk Delete">
                            </div>
                    @endif
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th><input type="checkbox" class="select_all" name="" id=""></th>
                                <th>S.no</th>
                                <th>Event</th>
                                <th>Assessment</th>
                                @if (in_array('event_update', roles_and_permissions()) ||
                                        in_array('event_archive', roles_and_permissions()) ||
                                        in_array('event_delete', roles_and_permissions()))
                                    <th>Action</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($event_assessments as $event_assessment)
                                <tr>
                                    <td><input type="checkbox" name="bulk_action[]" value="{{ $event_assessment->id }}"
                                            id=""></td>
                                    <td>{{ $key }}</td>
                                    <td>{{ $event_assessment->event->Name ?? '' }}</td>
                                    <td>{{ $event_assessment->assessment->Name ?? '' }}</td>
                                    @if (in_array('event_update', roles_and_permissions()) ||
                                            in_array('event_archive', roles_and_permissions()) ||
                                            in_array('event_delete', roles_and_permissions()))
                                        <td>
                                            <div class="d-flex">
                                                @if (in_array('event_update', roles_and_permissions()))
                                                    <a href="{{ route('event_assessment.edit', ['id' => $event_assessment->id]) }}"
                                                        class="btn btn-info text-white">
                                                        <i class="fa fa-pen"></i>
                                                    </a>
                                                @endif
                                                @if (in_array('event_delete', roles_and_permissions()))
                                                    <a href="{{ route('event_assessment.delete', ['id' => $event_assessment->id]) }}"
                                                        class="btn btn-danger me-2">
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                @endif
                                                @if (in_array('event_archive', roles_and_permissions()))
                                                    <a href="{{ route('event_assessment.toggle.archive', ['id' => $event_assessment->id]) }}"
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
                    @if (in_array('event_delete', roles_and_permissions()))
                        </form>
                    @endif
                </div>
            </div>
        </div>
    </main>
@endsection
