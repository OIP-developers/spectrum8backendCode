@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Events</h2>
            <hr class="w-50 mx-auto">


            @if (in_array('event_create', roles_and_permissions()) ||
                    in_array('event_archive', roles_and_permissions()) ||
                    in_array('event_delete', roles_and_permissions()))
                <div class="d-flex justify-content-between mb-3">
                    <div>
                        @if (in_array('event_delete', roles_and_permissions()))
                            <a class="btn btn-danger text-white" href="{{ route('event.trash') }}">Trash</a>
                        @endif
                        @if (in_array('event_archive', roles_and_permissions()))
                            <a class="btn btn-success text-white" href="{{ route('event.archive') }}">Archive</a>
                        @endif
                    </div>
                    @if (in_array('event_create', roles_and_permissions()))
                        <a class="btn btn-info text-white" href="{{ route('event.form') }}">Add Event</a>
                    @endif
                </div>
            @endif
            <div class="card mb-4">
                <div class="card-body">
                    @if (in_array('event_delete', roles_and_permissions()))
                        <form action="{{ route('event.bulk_delete') }}" method="GET">
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
                                <th>Organization</th>
                                <th>Facility Contact</th>
                                <th>Facility Name</th>
                                <th>Facility Address</th>
                                <th>Event Type</th>
                                <th>Start Date</th>
                                <th>Start Time</th>
                                <th>End Date</th>
                                <th>End Time</th>
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
                            @foreach ($events as $event)
                                <tr>
                                    <td><input type="checkbox" name="bulk_action[]" value="{{ $event->id }}"
                                            id=""></td>
                                    <td>{{ $key }}</td>
                                    <td>{{ $event->Name ?? '' }}</td>
                                    <td>{{ $event->organization->Name ?? '' }}</td>
                                    <td>{{ $event->facility_contact->Firstname ?? '' }}
                                        {{ $event->facility_contact->Lastname ?? '' }}
                                    </td>
                                    <td>{{ $event->FacilityName ?? '' }}</td>
                                    <td>{{ $event->FacilityAddress ?? '' }}</td>
                                    <td>{{ $event->event_type->Name ?? '' }}</td>
                                    <td>{{ $event->StartDate ?? '' }}</td>
                                    <td>{{ $event->StartTime ?? '' }}</td>
                                    <td>{{ $event->EndDate ?? '' }}</td>
                                    <td>{{ $event->EndTime ?? '' }}</td>
                                    @if (in_array('event_update', roles_and_permissions()) ||
                                            in_array('event_archive', roles_and_permissions()) ||
                                            in_array('event_delete', roles_and_permissions()))
                                        <td>
                                            <div class="d-flex">
                                                @if (in_array('event_update', roles_and_permissions()))
                                                    <a href="{{ route('event.edit', ['id' => $event->id]) }}"
                                                        class="btn btn-info text-white">
                                                        <i class="fa fa-pen"></i>
                                                    </a>
                                                    @endif
                                                    @if (in_array('event_delete', roles_and_permissions()))
                                                        <a href="{{ route('event.delete', ['id' => $event->id]) }}"
                                                            class="btn btn-danger me-2">
                                                            <i class="fa fa-trash"></i>
                                                        </a>
                                                        @endif
                                                        @if (in_array('event_archive', roles_and_permissions()))
                                                            <a href="{{ route('event.toggle.archive', ['id' => $event->id]) }}"
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
