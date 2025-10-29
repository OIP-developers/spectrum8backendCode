@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Trashed Event Type</h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Name</th>
                                {{-- <th>In Person</th>
                                <th>Vitrual</th> --}}
                                <th>Event Category</th>
                                {{-- <th>Is Active</th> --}}
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($event_type as $event_type_item)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $event_type_item->Name ?? '' }}</td>
                                    {{-- <td>{{ $event_type_item->InPerson == 1 ? 'Yes' : 'No' }}</td>
                                    <td>{{ $event_type_item->Vitrual == 1 ? 'Yes' : 'No' }}</td> --}}
                                    <td>{{ $event_type_item->event_category->Name ?? '' }}</td>
                                    {{-- <td>{{ $event_type_item->IsActive == 1 ? 'Yes' : 'No' }}</td> --}}
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('event_type.restore', ['id' => $event_type_item->id]) }}"
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
