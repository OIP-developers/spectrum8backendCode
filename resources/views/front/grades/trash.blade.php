@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Trashed Grades</h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Grade</th>
                                <th>Name</th>
                                <th>Short</th>
                                <th>Color</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($grades as $grade)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $grade->Grade ?? '' }}</td>
                                    <td>{{ $grade->Name ?? '' }}</td>
                                    <td>{{ $grade->Short ?? '' }}</td>
                                    <td><span
                                            style="background-color:{{ $grade->colors->WebColor ?? '' }};color: transparent;padding: 5px 40px;"></span>
                                    </td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('grade.restore', ['id' => $grade->id]) }}"
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
