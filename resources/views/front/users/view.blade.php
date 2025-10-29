@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Users</h2>
            <hr class="w-50 mx-auto">

            @if (in_array('user_delete', roles_and_permissions()) ||
                    in_array('user_create', roles_and_permissions()) ||
                    in_array('user_archive', roles_and_permissions()))
                <div class="d-flex justify-content-between mb-3">
                    <div>
                        @if (in_array('user_delete', roles_and_permissions()))
                            <a class="btn btn-danger text-white" href="{{ route('users.trash') }}">Trash</a>
                        @endif
                        @if (in_array('user_archive', roles_and_permissions()))
                            <a class="btn btn-success text-white" href="{{ route('users.archive') }}">Archive</a>
                        @endif
                    </div>
                    @if (in_array('user_create', roles_and_permissions()))
                        <a class="btn btn-info text-white" href="{{ route('users.form') }}">Add user</a>
                    @endif
                </div>
            @endif
            <div class="card mb-4">
                <div class="card-body">
                    @if (in_array('user_delete', roles_and_permissions()))
                        <form action="{{ route('users.bulk_delete') }}" method="GET">
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
                                <th>Role</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($users as $user)
                                <tr>
                                    <td><input type="checkbox" name="bulk_action[]" value="{{ $user->id }}"
                                            id=""></td>
                                    <td>{{ $key }}</td>
                                    <td>{{ $user->name ?? '' }}</td>
                                    <td>{{ $user->email ?? '' }}</td>
                                    <td>
                                        {{ $user->roles->RoleName }}
                                    </td>
                                    <td>
                                        <div class="d-flex">
                                            @if (in_array('user_update', roles_and_permissions()))
                                                <a href="{{ route('users.edit', ['id' => $user->id]) }}"
                                                    class="btn btn-info text-white">
                                                    <i class="fa fa-pen"></i>
                                                </a>
                                            @endif
                                            @if (in_array('user_delete', roles_and_permissions()))
                                                <a href="{{ route('users.delete', ['id' => $user->id]) }}"
                                                    class="btn btn-danger me-2">
                                                    <i class="fa fa-trash"></i>
                                                </a>
                                            @endif
                                            @if (in_array('user_archive', roles_and_permissions()))
                                                <a href="{{ route('users.toggle.archive', ['id' => $user->id]) }}"
                                                    class="btn btn-success text-white" title="Archive">
                                                    <i class="fa fa-box-archive"></i>
                                                </a>
                                            @endif
                                        </div>
                                    </td>
                                </tr>
                                @php
                                    $key++;
                                @endphp
                            @endforeach
                        </tbody>
                    </table>
                    @if (in_array('user_delete', roles_and_permissions()))
                        </form>
                    @endif
                </div>
            </div>
        </div>
    </main>
@endsection
