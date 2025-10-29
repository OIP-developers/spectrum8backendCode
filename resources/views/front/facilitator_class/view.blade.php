@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Facilitator Class</h2>
            <hr class="w-50 mx-auto">


            @if (in_array('facilitator_create', roles_and_permissions()) ||
            in_array('facilitator_archive', roles_and_permissions()) ||
            in_array('facilitator_delete', roles_and_permissions()))
                  <div class="d-flex justify-content-between mb-3">
                    <div>
                       @if (in_array('facilitator_delete', roles_and_permissions()))
                       <a class="btn btn-danger text-white" href="{{ route('facilitator_class.trash') }}">Trash</a>
            @endif
            @if (in_array('facilitator_archive', roles_and_permissions()))
            <a class="btn btn-success text-white" href="{{ route('facilitator_class.archive') }}">Archive</a>
            @endif
        </div>
                       @if (in_array('facilitator_create', roles_and_permissions()))
                       <a class="btn btn-info text-white" href="{{ route('facilitator_class.form') }}">Add Facilitator
                        Class</a>
            @endif
        </div>
            @endif
            <div class="card mb-4">
                <div class="card-body">
                                        @if (in_array('facilitator_delete', roles_and_permissions()))
                        <form action="{{ route('facilitator_class.bulk_delete') }}" method="GET">
                            <div class="text-end mb-3">
                                <input type="submit" class="btn btn-danger text-white" value="Bulk Delete">
                            </div>
                    @endif
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th><input type="checkbox" class="select_all" name="" id=""></th>
                                <th>S.no</th>
                                <th>Facilitator</th>
                                <th>Class</th>
                                <th>Class Name</th>
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
                            @foreach ($facilitator_class as $facilitator_class_item)
                                <tr>
                                    <td><input type="checkbox" name="bulk_action[]"
                                            value="{{ $facilitator_class_item->id }}" id=""></td>
                                    <td>{{ $key }}</td>
                                    <td>{{ $facilitator_class_item->facilitator->Firstname ?? '' }}
                                        {{ $facilitator_class_item->facilitator->Lastname ?? '' }}</td>
                                    <td>{{ $facilitator_class_item->class->Name ?? '' }}</td>
                                    <td>{{ $facilitator_class_item->ClassName ?? '' }}</td>
                                    {{-- <td>{{ $facilitator_class_item->IsActive == 1 ? 'Yes' : 'No' }}</td> --}}

                                    @if (in_array('facilitator_update', roles_and_permissions()) ||
                                    in_array('facilitator_archive', roles_and_permissions()) ||
                                    in_array('facilitator_delete', roles_and_permissions()))
                                        <td>
                                            <div class="d-flex">
                                            @if (in_array('facilitator_update', roles_and_permissions()))
                                            <a href="{{ route('facilitator_class.edit', ['id' => $facilitator_class_item->id]) }}"
                                                    class="btn btn-info text-white">
                                                    <i class="fa fa-pen"></i>
                                                </a>
                                                @endif
                                                @if (in_array('facilitator_delete', roles_and_permissions()))
                                                    <a href="{{ route('facilitator_class.delete', ['id' => $facilitator_class_item->id]) }}"
                                                        class="btn btn-danger me-2">
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                @endif
                                                @if (in_array('facilitator_archive', roles_and_permissions()))
                                                <a href="{{ route('facilitator_class.toggle.archive', ['id' => $facilitator_class_item->id]) }}"
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
