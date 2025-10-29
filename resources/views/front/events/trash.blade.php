@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Trashed Events</h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
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
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($events as $event)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $event->Name ?? '' }}</td>
                                    <td>{{ $event->organization->Name ?? '' }}</td>
                                    <td>{{ $event->facility_contact->Firstname ?? '' }}
                                        {{ $event->facility_contact->Lastname ?? '' }}</td>
                                    <td>{{ $event->FacilityName ?? '' }}</td>
                                    <td>{{ $event->FacilityAddress ?? '' }}</td>
                                    <td>{{ $event->event_type->Name ?? '' }}</td>
                                    <td>{{ $event->StartDate ?? '' }}</td>
                                    <td>{{ $event->StartTime ?? '' }}</td>
                                    <td>{{ $event->EndDate ?? '' }}</td>
                                    <td>{{ $event->EndTime ?? '' }}</td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('event.restore', ['id' => $event->id]) }}"
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
