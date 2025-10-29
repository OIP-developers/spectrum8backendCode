@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">License Type</h2>
            <hr class="w-50 mx-auto">

            @if (in_array('license_create', roles_and_permissions()) ||
                    in_array('license_archive', roles_and_permissions()) ||
                    in_array('license_delete', roles_and_permissions()))
                <div class="d-flex justify-content-between mb-3">
                    <div>
                        @if (in_array('license_delete', roles_and_permissions()))
                            <a class="btn btn-danger text-white" href="{{ route('license_type.trash') }}">Trash</a>
                        @endif
                        @if (in_array('license_archive', roles_and_permissions()))
                            <a class="btn btn-success text-white" href="{{ route('license_type.archive') }}">Archive</a>
                        @endif
                    </div>
                    @if (in_array('license_create', roles_and_permissions()))
                        <a class="btn btn-info text-white" href="{{ route('license_type.form') }}">Add License Type</a>
                    @endif
                </div>
            @endif
            <div class="card mb-4">
                <div class="card-body">
                    @if (in_array('license_delete', roles_and_permissions()))
                        <form action="{{ route('license_type.bulk_delete') }}" method="GET">
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
                                <th>Subscription</th>
                                <th>Facilitators</th>
                                <th>Participants</th>
                                {{-- <th>Duration Days</th> --}}
                                <th>Number of Devices</th>
                                @if (in_array('license_update', roles_and_permissions()) ||
                                        in_array('license_archive', roles_and_permissions()) ||
                                        in_array('license_delete', roles_and_permissions()))
                                    <th>Action</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($license_types as $license_type)
                                <tr>
                                    <td><input type="checkbox" name="bulk_action[]" value="{{ $license_type->id }}"
                                            id=""></td>
                                    <td>{{ $key }}</td>
                                    <td>{{ $license_type->Name ?? '' }}</td>
                                    <td>{{ $license_type->Subscription == 1 ? 'Yes' : 'No' }}</td>
                                    <td>{{ $license_type->Facilitators ?? '' }}</td>
                                    <td>{{ $license_type->Participants ?? '' }}</td>
                                    {{-- <td>{{ $license_type->DurationDays ?? '' }}</td> --}}
                                    <td>{{ $license_type->number_of_devices_login ?? '' }}</td>
                                    @if (in_array('license_update', roles_and_permissions()) ||
                                            in_array('license_archive', roles_and_permissions()) ||
                                            in_array('license_delete', roles_and_permissions()))
                                        <td>
                                            <div class="d-flex">
                                                @if (in_array('license_update', roles_and_permissions()))
                                                    <a href="{{ route('license_type.edit', ['id' => $license_type->id]) }}"
                                                        class="btn btn-info text-white">
                                                        <i class="fa fa-pen"></i>
                                                    </a>
                                                @endif
                                                @if (in_array('license_delete', roles_and_permissions()))
                                                    <a href="{{ route('license_type.delete', ['id' => $license_type->id]) }}"
                                                        class="btn btn-danger me-2">
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                @endif
                                                @if (in_array('license_archive', roles_and_permissions()))
                                                    <a href="{{ route('license_type.toggle.archive', ['id' => $license_type->id]) }}"
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
                    @if (in_array('license_delete', roles_and_permissions()))
                        </form>
                    @endif
                </div>
            </div>
        </div>
    </main>
@endsection
