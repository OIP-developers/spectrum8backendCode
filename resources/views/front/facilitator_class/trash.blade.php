@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Trashed Facilitator Class</h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Facilitator</th>
                                <th>Class</th>
                                <th>Class Name</th>
                                {{-- <th>Is Active</th> --}}
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($facilitator_class as $facilitator_class_item)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $facilitator_class_item->facilitator->Firstname ?? '' }}
                                        {{ $facilitator_class_item->facilitator->Lastname ?? '' }}</td>
                                    <td>{{ $facilitator_class_item->class->Name ?? '' }}</td>
                                    <td>{{ $facilitator_class_item->ClassName ?? '' }}</td>
                                    {{-- <td>{{ $facilitator_class_item->IsActive == 1 ? 'Yes' : 'No' }}</td> --}}
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('facilitator_class.restore', ['id' => $facilitator_class_item->id]) }}"
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
