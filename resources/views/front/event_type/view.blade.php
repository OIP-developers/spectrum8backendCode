@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Event Type</h2>
            <hr class="w-50 mx-auto">


            @if (in_array('lookup_create', roles_and_permissions()) ||
            in_array('lookup_archive', roles_and_permissions()))
          <div class="d-flex justify-content-between mb-3">
                    <div>
                        {{-- <a class="btn btn-danger text-white" href="{{ route('event_type.trash') }}">Trash</a> --}}
                        @if (in_array('lookup_archive', roles_and_permissions()))
                        <a class="btn btn-success text-white" href="{{ route('event_type.archive') }}">Archive</a>
            @endif
        </div>
                        @if (in_array('lookup_create', roles_and_permissions()))
                        <a class="btn btn-info text-white" href="{{ route('event_type.form') }}">Add Event Type</a>
            @endif
        </div>
            @endif
            <div class="card mb-4">
                <div class="card-body">
                    {{-- @if (Auth::user()->role_id == 5)
                        <form action="{{ route('event_type.bulk_delete') }}" method="GET">
                            <div class="text-end mb-3">
                                <input type="submit" class="btn btn-danger text-white" value="Bulk Delete">
                            </div>
                    @endif --}}
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th><input type="checkbox" class="select_all" name="" id=""></th>
                                <th>S.no</th>
                                <th>Name</th>
                                {{-- <th>In Person</th>
                                <th>Vitrual</th> --}}
                                <th>Event Category</th>
                                {{-- <th>Is Active</th> --}}
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
                            @foreach ($event_type as $event_type_item)
                                <tr>
                                    <td><input type="checkbox" name="bulk_action[]" value="{{ $event_type_item->id }}"
                                            id=""></td>
                                    <td>{{ $key }}</td>
                                    <td>{{ $event_type_item->Name }}</td>
                                    {{-- <td>{{ $event_type_item->InPerson == 1 ? 'Yes' : 'No' }}</td>
                                    <td>{{ $event_type_item->Vitrual == 1 ? 'Yes' : 'No' }}</td> --}}
                                    <td>{{ $event_type_item->event_category->Name ?? '' }}</td>
                                    {{-- <td>{{ $event_type_item->IsActive == 1 ? 'Yes' : 'No' }}</td> --}}
                                    @if (in_array('lookup_archive', roles_and_permissions()) ||
                                    in_array('lookup_update', roles_and_permissions()))
                                   <td>
                                            <div class="d-flex">
                                                @if (in_array('lookup_update', roles_and_permissions()))
                                                <a href="{{ route('event_type.edit', ['id' => $event_type_item->id]) }}"
                                                    class="btn btn-info text-white">
                                                    <i class="fa fa-pen"></i>
                                                </a>
                                                @endif
                                                {{-- <a href="{{ route('event_type.delete', ['id' => $event_type_item->id]) }}"
                                                    class="btn btn-danger me-2">
                                                    <i class="fa fa-trash"></i>
                                                </a> --}}
                                                @if (in_array('lookup_archive', roles_and_permissions()))
                                                <a href="{{ route('event_type.toggle.archive', ['id' => $event_type_item->id]) }}"
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
