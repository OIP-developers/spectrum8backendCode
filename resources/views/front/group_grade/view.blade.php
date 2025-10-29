@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Group Grades</h2>
            <hr class="w-50 mx-auto">


            @if (Auth::user()->role_id != 1 && Auth::user()->role_id != 6 && Auth::user()->role_id != 11)
                <div class="d-flex justify-content-between mb-3">
                    <div>
                        <a class="btn btn-danger text-white" href="{{ route('group_grade.trash') }}">Trash</a>
                        <a class="btn btn-success text-white" href="{{ route('group_grade.archive') }}">Archive</a>
                    </div>
                    <a class="btn btn-info text-white" href="{{ route('group_grade.form') }}">Add Group Grade</a>
                </div>
            @endif
            <div class="card mb-4">
                <div class="card-body">
                    @if (Auth::user()->role_id != 1 && Auth::user()->role_id != 6 && Auth::user()->role_id != 11)
                        <form action="{{ route('group_grade.bulk_delete') }}" method="GET">
                            <div class="text-end mb-3">
                                <input type="submit" class="btn btn-danger text-white" value="Bulk Delete">
                            </div>
                    @endif
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th><input type="checkbox" class="select_all" name="" id=""></th>
                                <th>S.no</th>
                                <th>Group</th>
                                <th>Grade</th>
                                @if (Auth::user()->role_id != 1 && Auth::user()->role_id != 6 && Auth::user()->role_id != 11)
                                    <th>Action</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($group_grades as $group_grade)
                                <tr>
                                    <td><input type="checkbox" name="bulk_action[]" value="{{ $group_grade->id }}"
                                            id=""></td>
                                    <td>{{ $key }}</td>
                                    <td>{{ $group_grade->group->Name ?? '' }}</td>
                                    <td>{{ $group_grade->grade->Name ?? '' }}</td>
                                    @if (Auth::user()->role_id != 1 && Auth::user()->role_id != 6 && Auth::user()->role_id != 11)
                                        <td>
                                            <div class="d-flex">
                                                <a href="{{ route('group_grade.edit', ['id' => $group_grade->id]) }}"
                                                    class="btn btn-info text-white">
                                                    <i class="fa fa-pen"></i>
                                                </a>
                                                <a href="{{ route('group_grade.delete', ['id' => $group_grade->id]) }}"
                                                    class="btn btn-danger me-2">
                                                    <i class="fa fa-trash"></i>
                                                </a>
                                                <a href="{{ route('group_grade.toggle.archive', ['id' => $group_grade->id]) }}"
                                                    class="btn btn-success text-white" title="Archive">
                                                    <i class="fa fa-box-archive"></i>
                                                </a>
                                            </div>
                                    @endif
                                    </td>
                                </tr>
                                @php
                                    $key++;
                                @endphp
                            @endforeach
                        </tbody>
                    </table>
                    @if (Auth::user()->role_id != 1 && Auth::user()->role_id != 6 && Auth::user()->role_id != 11)
                        </form>
                    @endif
                </div>
            </div>
        </div>
    </main>
@endsection
