@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Gender</h2>
            <hr class="w-50 mx-auto">


            @if (in_array('lookup_create', roles_and_permissions()) ||
                    in_array('lookup_archive', roles_and_permissions()))
                <div class="d-flex justify-content-between mb-3">
                    <div>
                        {{-- <a class="btn btn-danger text-white" href="{{ route('gender.trash') }}">Trash</a> --}}
                        @if (in_array('lookup_archive', roles_and_permissions()))
                            <a class="btn btn-success text-white" href="{{ route('gender.archive') }}">Archive</a>
                        @endif
                    </div>
                    @if (in_array('lookup_create', roles_and_permissions()))
                        <a class="btn btn-info text-white" href="{{ route('gender.form') }}">Add Gender</a>
                    @endif
                </div>
            @endif
            <div class="card mb-4">
                <div class="card-body">
                    {{-- @if (Auth::user()->role_id == 5)
                                <form action="{{ route('gender.bulk_delete') }}" method="GET">
                        <div class="text-end mb-3">
                            <input type="submit" class="btn btn-danger text-white" value="Bulk Delete">
                        </div>
                        @endif --}}
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th><input type="checkbox" class="select_all" name="" id=""></th>
                                <th>S.no</th>
                                <th>Gender</th>
                                @if (in_array('lookup_archive', roles_and_permissions()) ||
                                        in_array('lookup_update', roles_and_permissions()))
                                    <th>Action</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($gender as $gender_item)
                                <tr>
                                    <td><input type="checkbox" name="bulk_action[]" value="{{ $gender_item->id }}"
                                            id=""></td>
                                    <td>{{ $key }}</td>
                                    <td>{{ $gender_item->Gender ?? '' }}</td>
                                    @if (in_array('lookup_archive', roles_and_permissions()) ||
                                            in_array('lookup_update', roles_and_permissions()))
                                        <td>
                                            <div class="d-flex">
                                                @if (in_array('lookup_update', roles_and_permissions()))
                                                    <a href="{{ route('gender.edit', ['id' => $gender_item->id]) }}"
                                                        class="btn btn-info text-white">
                                                        <i class="fa fa-pen"></i>
                                                    </a>
                                                @endif
                                                {{-- <a href="{{ route('gender.delete', ['id' => $gender_item->id]) }}"
                                                        class="btn btn-danger me-2">
                                                        <i class="fa fa-trash"></i>
                                                    </a> --}}
                                                @if (in_array('lookup_update', roles_and_permissions()))
                                                    <a href="{{ route('gender.toggle.archive', ['id' => $gender_item->id]) }}"
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
                    {{-- @if (Auth::user()->role_id == 5)
                    </form>
                    @endif --}}
                </div>
            </div>
        </div>
    </main>
@endsection
