@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Roles</h2>
            <hr class="w-50 mx-auto">


                <div class="d-flex justify-content-between mb-3">
                    <div>
                        {{-- <a class="btn btn-danger text-white" href="{{ route('role.trash') }}">Trash</a> --}}
                        {{-- <a class="btn btn-success text-white" href="{{ route('role.archive') }}">Archive</a> --}}
                    </div>
                    <a class="btn btn-info text-white" href="{{ route('role.form') }}">Add Role</a>
                </div>
            <div class="card mb-4">
                <div class="card-body">
                        {{-- <form action="{{ route('role.bulk_delete') }}" method="GET">
                            <div class="text-end mb-3">
                                <input type="submit" class="btn btn-danger text-white" value="Bulk Delete">
                            </div> --}}
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                {{-- <th><input type="checkbox" class="select_all" name="" id=""></th> --}}
                                <th>S.no</th>
                                <th>Name</th>
                                    <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($roles as $role)
                                <tr>
                                    {{-- <td><input type="checkbox" name="bulk_action[]" value="{{ $role->id }}"
                                            id=""></td> --}}
                                    <td>{{ $key }}</td>
                                    <td>{{ $role->RoleName ?? '' }}</td>
                                        <td>
                                            <div class="d-flex">
                                                <a href="{{ route('role.edit', ['id' => $role->id]) }}"
                                                    class="btn btn-info text-white">
                                                    <i class="fa fa-pen"></i>
                                                </a>
                                                    {{-- <a href="{{ route('role.delete', ['id' => $role->id]) }}"
                                                        class="btn btn-danger me-2">
                                                        <i class="fa fa-trash"></i>
                                                    </a> --}}
                                                    {{-- <a href="{{ route('role.toggle.archive', ['id' => $role->id]) }}"
                                                        class="btn btn-success text-white" title="Archive">
                                                        <i class="fa fa-box-archive"></i>
                                                    </a> --}}
                                            </div>
                                        </td>
                                </tr>
                                @php
                                    $key++;
                                @endphp
                            @endforeach
                        </tbody>
                    </table>
                        {{-- </form> --}}
                </div>
            </div>
        </div>
    </main>
@endsection
