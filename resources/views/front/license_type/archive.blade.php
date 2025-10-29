@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Archive License Type</h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Name</th>
                                <th>Subscription</th>
                                <th>Facilitators</th>
                                <th>Participants</th>
                                {{-- <th>Duration Days</th> --}}
                                <th>Number of Devices</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($license_types as $license_type)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $license_type->Name ?? '' }}</td>
                                    <td>{{ $license_type->Subscription == 1 ? 'Yes' : 'No' }}</td>
                                    <td>{{ $license_type->Facilitators ?? '' }}</td>
                                    <td>{{ $license_type->Participants ?? '' }}</td>
                                    {{-- <td>{{ $license_type->DurationDays ?? '' }}</td> --}}
                                    <td>{{ $license_type->number_of_devices_login ?? '' }}</td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('license_type.toggle.archive', ['id' => $license_type->id]) }}"
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
