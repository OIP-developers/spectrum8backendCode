@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Trashed Facilitators</h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Organization</th>
                                <th>Manage Participants</th>
                                <th>Show Video</th>
                                {{-- <th>Is Active</th> --}}
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($facilitators as $facilitator)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $facilitator->Firstname ?? '' }} {{ $facilitator->Lastname ?? '' }}</td>
                                    <td>{{ $facilitator->Email ?? '' }}</td>
                                    <td>{{ $facilitator->organization->Name ?? '' }}</td>
                                    <td>{{ $facilitator->ManageParticipants == 1 ? 'Yes' : 'No' }}</td>
                                    <td>{{ $facilitator->show_video == 1 ? 'Yes' : 'No' }}</td>
                                    {{-- <td>{{ $facilitator->IsActive == 1 ? 'Yes' : 'No' }}</td> --}}
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('facilitator.restore', ['id' => $facilitator->id]) }}"
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
