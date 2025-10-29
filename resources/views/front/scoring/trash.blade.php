@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Trashed Assessments Scorings</h2>
            <hr class="w-50 mx-auto">



            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Image</th>
                                <th>Assessment</th>
                                <th>Color</th>
                                <th>Min</th>
                                <th>Max</th>
                                {{-- <th>Duration</th>
                                <th>Distance</th> --}}
                                <th>Type</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($scorings as $scoring)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>
                                        @if ($scoring->image)
                                            <img src="{{ asset('images/assessment_image/scoring/' . $scoring->image) }}"
                                                width="50" height="50" alt="">
                                        @else
                                            <img src="{{ asset('images/assessment_image/scoring/error.png') }}"
                                                width="50" height="50" alt="">
                                        @endif
                                    </td>
                                    <td>{{ $scoring->assessment->Name ?? '' }}</td>
                                    <td>{{ $scoring->color->Name ?? '' }}</td>
                                    <td>{{ $scoring->MinValue ?? '' }}</td>
                                    <td>{{ $scoring->MaxValue ?? '' }}</td>
                                    {{-- <td>{{ $scoring->Duration }}</td>
                                    <td>{{ $scoring->Distance }}</td> --}}
                                    <td>{{ $scoring->Score_target ?? '' }}</td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('scoring.restore', ['id' => $scoring->id]) }}"
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
