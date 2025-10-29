@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Facilitators</h2>
            <hr class="w-50 mx-auto">


            @if (in_array('facilitator_create', roles_and_permissions()) ||
            in_array('facilitator_archive', roles_and_permissions()) ||
            in_array('facilitator_delete', roles_and_permissions()))
                 <div class="d-flex justify-content-between mb-3">
                    <div>
                       @if (in_array('facilitator_delete', roles_and_permissions()))
                       <a class="btn btn-danger text-white" href="{{ route('facilitator.trash') }}">Trash</a>
            @endif
            @if (in_array('facilitator_archive', roles_and_permissions()))
                       <a class="btn btn-success text-white" href="{{ route('facilitator.archive') }}">Archive</a>
            @endif
        </div>
                       @if (in_array('facilitator_create', roles_and_permissions()))
                       <a class="btn btn-info text-white" href="{{ route('facilitator.form') }}">Add Facilitator</a>
            @endif
        </div>
            @endif
            <div class="card mb-4">
                <div class="card-body">
                    @if (in_array('facilitator_delete', roles_and_permissions()))
                        <form action="{{ route('facilitator.bulk_delete') }}" method="GET">
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
                                <th>Email</th>
                                <th>Organization</th>
                                <th>Manage Participants</th>
                                <th>Show Video</th>
                                {{-- <th>Is Active</th> --}}
                                @if (in_array('facilitator_update', roles_and_permissions()) ||
                                in_array('facilitator_archive', roles_and_permissions()) ||
                                in_array('facilitator_delete', roles_and_permissions()))
                                    <th>Action</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($facilitators as $facilitator)
                                <tr>
                                    <td><input type="checkbox" name="bulk_action[]" value="{{ $facilitator->id }}"
                                            id=""></td>
                                    <td>{{ $key }}</td>
                                    <td>{{ $facilitator->Firstname ?? '' }} {{ $facilitator->Lastname ?? '' }}</td>
                                    <td>{{ $facilitator->Email ?? '' }}</td>
                                    <td>{{ $facilitator->organization->Name ?? '' }}</td>
                                    <td>{{ $facilitator->ManageParticipants == 1 ? 'Yes' : 'No' }}</td>
                                    <td>{{ $facilitator->show_video == 1 ? 'Yes' : 'No' }}</td>
                                    {{-- <td>{{ $facilitator->IsActive == 1 ? 'Yes' : 'No' }}</td> --}}
                                    @if (in_array('facilitator_update', roles_and_permissions()) ||
                                in_array('facilitator_archive', roles_and_permissions()) ||
                                in_array('facilitator_delete', roles_and_permissions()))
                                        <td>
                                            <div class="d-flex">
                                            @if (in_array('facilitator_update', roles_and_permissions()))
                                            <a href="{{ route('facilitator.edit', ['id' => $facilitator->id]) }}"
                                                    class="btn btn-info text-white">
                                                    <i class="fa fa-pen"></i>
                                                </a>
                                                @endif
                                                @if (in_array('facilitator_delete', roles_and_permissions()))
                                                    <a href="{{ route('facilitator.delete', ['id' => $facilitator->id]) }}"
                                                        class="btn btn-danger me-2">
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                @endif
                                                @if (in_array('facilitator_archive', roles_and_permissions()))
                                            <a href="{{ route('facilitator.toggle.archive', ['id' => $facilitator->id]) }}"
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
                    @if (in_array('facilitator_delete', roles_and_permissions()))
                        </form>
                    @endif
                </div>
            </div>
        </div>
    </main>
@endsection
