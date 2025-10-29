@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Trashed Assessment Evaluate</h2>
            <hr class="mx-auto w-50">



            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Assessment</th>
                                <th>Name</th>
                                <th>Weight</th>
                                <th>Sort</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($assessment_evaluate as $assessment)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $assessment->assessment->Name ?? '' }}</td>
                                    <td>{{ $assessment->Name ?? '' }}</td>
                                    <td>{{ $assessment->Weight ?? '' }}</td>
                                    <td>{{ $assessment->Sort ?? '' }}</td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('assessment_evaluate.restore', ['id' => $assessment->id]) }}"
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
