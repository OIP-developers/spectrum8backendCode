@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Assessments Scorings</h2>
            <hr class="w-50 mx-auto">



            <div class="d-flex justify-content-between mb-3">
                <div>
                    <a class="btn btn-danger text-white" href="{{ route('scoring.trash') }}">Trash</a>
                    <a class="btn btn-success text-white" href="{{ route('scoring.archive') }}">Archive</a>
                </div>
                <a class="btn btn-info text-white" href="{{ route('scoring.form') }}">Add Scoring</a>
            </div>
            <div class="card mb-4">
                <div class="card-body">
                    <form action="{{ route('scoring.bulk_delete') }}" method="GET">
                        <div class="text-end mb-3">
                            <input type="submit" class="btn btn-danger text-white" value="Bulk Delete">
                        </div>
                        <table id="datatablesSimple">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" class="select_all" name="" id=""></th>
                                    <th>S.no</th>
                                    <th>Image</th>
                                    <th>Assessment</th>
                                    <th>Color</th>
                                    <th>Min</th>
                                    <th>Max</th>
                                    {{-- <th>Duration</th>
                                <th>Distance</th> --}}
                                    <th>Type</th>
                                    <th>Scoring Type</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $key = 1;
                                @endphp
                                @foreach ($scorings as $scoring)
                                    <tr>
                                        <td><input type="checkbox" name="bulk_action[]" value="{{ $scoring->id }}"
                                                id=""></td>
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
                                        <td>{{ $scoring->CreatedBy == 1 ? 'Public' : 'Private' }}</td>
                                        <td>
                                            @if ($scoring->CreatedBy != 1 || Auth::user()->id == 1)
                                                <div class="d-flex">
                                                    <a href="{{ route('scoring.edit', ['id' => $scoring->id]) }}"
                                                        class="btn btn-info text-white">
                                                        <i class="fa fa-pen"></i>
                                                    </a>
                                                    <a href="{{ route('scoring.delete', ['id' => $scoring->id]) }}"
                                                        class="btn btn-danger me-2">
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                    <a href="{{ route('scoring.toggle.archive', ['id' => $scoring->id]) }}"
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
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
