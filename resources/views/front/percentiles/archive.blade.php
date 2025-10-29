@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Archive Percentiles</h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Assessment</th>
                                <th>Grade</th>
                                <th>Gender</th>
                                <th>Percent</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($percentiles as $percentile)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $percentile->assessment->Name ?? '' }}</td>
                                    <td>{{ $percentile->grade->Name ?? '' }}</td>
                                    <td>{{ $percentile->gender ?? '' }}</td>
                                    <td>{{ $percentile->percent ?? '' }}</td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('percentile.toggle.archive', ['id' => $percentile->id]) }}"
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
