@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">License</h2>
            <hr class="w-50 mx-auto">

            @if (in_array('license_create', roles_and_permissions()) ||
                    in_array('license_archive', roles_and_permissions()) ||
                    in_array('license_delete', roles_and_permissions()))
                <div class="d-flex justify-content-between mb-3">
                    <div>
                        @if (in_array('license_delete', roles_and_permissions()))
                            <a class="btn btn-danger text-white" href="{{ route('license.trash') }}">Trash</a>
                        @endif
                        @if (in_array('license_archive', roles_and_permissions()))
                            <a class="btn btn-success text-white" href="{{ route('license.archive') }}">Archive</a>
                        @endif
                    </div>
                    @if (in_array('license_create', roles_and_permissions()))
                        <a class="btn btn-info text-white" href="{{ route('license.form') }}">Add License</a>
                    @endif
                </div>
            @endif
            <div class="card mb-4">
                <div class="card-body">
                    @if (in_array('license_delete', roles_and_permissions()))
                        <form action="{{ route('license.bulk_delete') }}" method="GET">
                            <div class="text-end mb-3">
                                <input type="submit" class="btn btn-danger text-white" value="Bulk Delete">
                            </div>
                    @endif
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th><input type="checkbox" class="select_all" name="" id=""></th>
                                <th>S.no</th>
                                <th>Organization</th>
                                <th>License Type</th>
                                <th>Start Date</th>
                                <th>Expires</th>
                                <th>Is Expires</th>
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
                            @foreach ($licenses as $license)
                                <tr>
                                    <td><input type="checkbox" name="bulk_action[]" value="{{ $license->id }}"
                                            id=""></td>
                                    <td>{{ $key }}</td>
                                    <td>{{ $license->organization->Name ?? '' }}</td>
                                    <td>{{ $license->license_type->Name ?? '' }}</td>
                                    <td>{{ $license->StartDate ?? '' }}</td>
                                    <td>{{ $license->Expires ?? '' }}</td>
                                    <td>
                                        {{-- @dd($license) --}}
                                        @if($license->is_expire == "true")
                                        <div class="badge badge-danger">Expire</div>
                                        @else
                                        <div class="badge badge-success">Valid</div>
                                        @endif
                                    </td>
                                    @if (in_array('license_update', roles_and_permissions()) ||
                                            in_array('license_archive', roles_and_permissions()) ||
                                            in_array('license_delete', roles_and_permissions()))
                                        <td>
                                            <div class="d-flex">
                                                @if (in_array('license_update', roles_and_permissions()))
                                                    <a href="{{ route('license.edit', ['id' => $license->id]) }}"
                                                        class="btn btn-info text-white">
                                                        <i class="fa fa-pen"></i>
                                                    </a>
                                                @endif
                                                @if (in_array('license_delete', roles_and_permissions()))
                                                    <a href="{{ route('license.delete', ['id' => $license->id]) }}"
                                                        class="btn btn-danger me-2">
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                @endif
                                                @if (in_array('license_archive', roles_and_permissions()))
                                                    <a href="{{ route('license.toggle.archive', ['id' => $license->id]) }}"
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
