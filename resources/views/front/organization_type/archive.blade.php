@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Archive Organization Type</h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Is School</th>
                                <th>Classification</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($organization_type as $organization_type_item)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $organization_type_item->IsSchool == 1 ? 'Yes' : 'No' }}</td>
                                    <td>{{ $organization_type_item->Classification ?? '' }}</td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('organization_type.toggle.archive', ['id' => $organization_type_item->id]) }}"
                                                class="btn btn-success text-white" title="unarchive">
                                                <i class="fa fa-clock-rotate-left"></i>
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
