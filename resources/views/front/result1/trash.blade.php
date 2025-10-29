@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Trashed Results</h2>
            <hr class="w-50 mx-auto">




            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple" class="set_result">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Assessment</th>
                                <th>Participant</th>
                                <th>Grade</th>
                                <th>Group</th>
                                <th>Event</th>
                                <th>Score</th>
                                <th>Color</th>
                                <th>Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($results as $result)
                                {{-- @dd($result->assessments); --}}
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $result->assessments->first()->Name ?? '' }}</td>
                                    <td>{{ $result->resultParticipant->first()->Firstname ?? '' }}
                                        {{ $result->resultParticipant->first()->Lastname ?? '' }}</td>
                                    <td>{{ $result->resultGrade->first()->Name ?? '' }}</td>
                                    <td>{{ $result->resultGroup->first()->Name ?? '' }}-{{ $result->resultGroup->first()->Abbr ?? '' }}
                                    </td>
                                    <td>{{ $result->resultEvent->first()->name ?? '' }}</td>
                                    <td>{{ $result->sum('Score') }}</td>
                                    <td>
                                        @if (!empty($result->assessment_scoring_data->first()) && $result->assessment_scoring_data->first()->image != null)
                                            <img src="{{ asset('images/assessment_image/scoring/' . $result->assessment_scoring_data->first()->image) }}"
                                                width="50" height="50" alt="">
                                            <div class="d-none">
                                                {{ $result->assessment_scoring_data->first()->color->Name ?? 'Undefine Color' }}
                                            </div>
                                        @else
                                            @if ($result->assessment_score_id == 0)
                                                <div class="d-none">black</div>
                                                <img src="{{ asset('images/assessment_image/scoring/black.png') }}"
                                                    width="50" height="50" alt="">
                                            @else
                                                <div class="d-none">error</div>
                                                <img src="{{ asset('images/assessment_image/scoring/error.png') }}"
                                                    width="50" height="50" alt="">
                                            @endif
                                        @endif
                                    </td>
                                    <td>{{ isset($result->created_at) ? date_format($result->created_at, 'd-m-Y') : '' }}
                                    </td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('result.restore', ['id' => $result->id]) }}"
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
