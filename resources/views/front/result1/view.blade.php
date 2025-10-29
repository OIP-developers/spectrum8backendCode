@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Results</h2>
            <hr class="w-50 mx-auto">


            {{-- @if (isset($number) && $number != 'All') --}}
            {{-- @if (isset($results_data))
            @else
            <div class="export_btn text-end mb-3">
                <a class="btn btn-info text-white" href="{{ route('export') }}">Export Result</a>
            </div>
            @endif --}}
            {{-- <button class="btn btn-primary">Export Data</button> --}}
            <div class="card mb-4">
                <div class="card-body">
                    <div class="filter_area mb-3 mr-auto">
                        <h4 class="text-center">
                            Filter Area
                        </h4>
                        <hr>
                        <form action="{{ route('filter_result') }}" class="container" method="GET">
                            <div class="row">
                                <div class="col-2">
                                    <div class="form-group row me-2">
                                        <select id="filter_top" name="top_filter" class="custom-select">
                                            <option selected="" value="">Select All Score</option>
                                            <option {{ isset($number) && $number == 5 ? 'selected' : '' }} value="5">
                                                Top 5</option>
                                            <option {{ isset($number) && $number == 10 ? 'selected' : '' }} value="10">
                                                Top 10</option>
                                            <option {{ isset($number) && $number == 15 ? 'selected' : '' }} value="15">
                                                Top 15</option>
                                            <option {{ isset($number) && $number == 20 ? 'selected' : '' }} value="20">
                                                Top 20</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-group row me-2">
                                        <select id="assesssment_type" name="assesssment_type" class="custom-select">
                                            <option selected="" value="">Select All Assessment</option>
                                            @foreach ($assessments as $assessment)
                                                <option
                                                    {{ isset($assessment_type) && $assessment_type == $assessment->id ? 'selected' : '' }}
                                                    value="{{ $assessment->id }}">{{ $assessment->Name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-group row me-2">
                                        <select id="grade" name="grade" class="custom-select grade_dd_filter">
                                            <option selected="" value="">Select All Grade</option>
                                            @foreach ($grades as $grade)
                                                <option {{ isset($grade_id) && $grade_id == $grade->id ? 'selected' : '' }}
                                                    value="{{ $grade->id }}">{{ $grade->Name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-2">
                                    @if (isset($group_id))
                                        <input type="hidden" class="get_group_val" value="{{ $group_id }}" />
                                    @endif
                                    <div class="form-group row me-2 toggle_area_filter">
                                        <select id="inputState" name="group">
                                            <option selected value="">Select All Group</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-group row me-2">
                                        <select id="event" name="event" class="custom-select">
                                            <option selected="" value="">Select All Event</option>
                                            @foreach ($events as $event)
                                                <option {{ isset($event_id) && $event_id == $event->id ? 'selected' : '' }}
                                                    value="{{ $event->id }}">{{ $event->name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="col-2">
                                    <div class="form-group row me-2">
                                        <input type="text" name="daterange" class="form-control"
                                            @if (isset($daterange)) value="{{ $daterange }}" @else  value="" @endif
                                            placeholder="Select Date Range" autocomplete="off" />
                                    </div>
                                </div>
                                <div class="col-12 text-center mt-2">
                                    <button class="btn btn-info text-white" type="submit">Filter</button>
                                    <a href="{{ route('result.view') }}" class="btn btn-danger text-white"
                                        type="submit">Reset</a>
                                </div>


                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <div class="card mb-4">
                <div class="card-body">
                    @if (isset($results_data))
                    @else
                        <form action="{{ route('result.bulk_delete') }}" method="GET">
                            <div class="d-flex justify-content-between mb-3">
                                <a class="btn btn-danger text-white" href="{{ route('result.trash') }}">Trash</a>
                                <input type="submit" class="btn btn-danger text-white" value="Bulk Delete">
                            </div>
                    @endif
                    <table id="resultTable" class="set_result">
                        <thead>
                            <tr>
                                @if (isset($results_data))
                                @else
                                    <th><input type="checkbox" class="select_all" name="" id=""></th>
                                @endif
                                <th>S.no</th>
                                <th>Assessment</th>
                                <th>Participant</th>
                                <th>Grade</th>
                                <th>Group</th>
                                <th>Event</th>
                                @if (isset($results_data))
                                    <th>Total Score</th>
                                @else
                                    <th>Score</th>
                                @endif
                                <th>Color</th>
                                <th>Date</th>
                                @if (isset($results_data))
                                @else
                                    <th>Action</th>
                                @endif
                                {{-- <th>Duration</th>
                                <th>Distance</th>
                                <th>Beep</th> --}}
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @if (isset($results_data))
                                @foreach ($results_data as $result)
                                    <tr>
                                        <td>{{ $key }}</td>
                                        {{-- <td>{{ $result->first()->assessments->first()->Type??'' }}</td> --}}
                                        <td>{{ $result->first()->assessments->first()->Name ?? '' }}</td>
                                        <td>{{ $result->first()->resultParticipant->first()->Firstname ?? '' }}
                                            {{ $result->first()->resultParticipant->first()->Lastname ?? '' }}</td>
                                        <td>{{ $result->first()->resultGrade->first()->Name ?? '' }}</td>
                                        <td>{{ $result->first()->resultGroup->first()->Name ?? '' }}-{{ $result->first()->resultGroup->first()->Abbr ?? '' }}
                                        </td>
                                        <td>{{ $result->first()->resultEvent->first()->name ?? '' }}</td>
                                        {{-- <td>{{ $result->first()->Score }}</td> --}}
                                        <td>{{ $result->sum('Score') }}</td>
                                        <td>
                                            @if (
                                                !empty($result->first()->assessment_scoring_data->first()) &&
                                                    $result->first()->assessment_scoring_data->first()->image != null)
                                                <img src="{{ asset('images/assessment_image/scoring/' . $result->first()->assessment_scoring_data->first()->image) }}"
                                                    width="50" height="50" alt="">
                                                <div class="d-none">
                                                    {{ $result->first()->assessment_scoring_data->first()->color->Name ?? 'Undefine Color' }}
                                                </div>
                                            @else
                                                @if ($result->first()->assessment_score_id == 0)
                                                    <div class="d-none">black</div>
                                                    <img src="{{ asset('images/assessment_image/scoring/black.png') }}"
                                                        width="50" height="50" alt="">
                                                @else
                                                    <div class="d-none">error</div>
                                                    <img src="{{ asset('images/assessment_image/scoring/error.png') }}"
                                                        width="50" height="50" alt="">
                                                @endif
                                            @endif
                                            {{-- {{ $result->assessment_scoring_data->first()->image??'' }} --}}
                                        </td>
                                        {{-- <td>{{ $result->first()->assessment_scoring_data->first()->image??'' }}</td> --}}
                                        <td>{{ isset($result->created_at) ? date_format($result->created_at, 'd-m-Y') : '' }}
                                        </td>
                                        {{-- <td>
                                        <a href="{{ route('result.delete', ['id' => $result->id]) }}"
                                            class="btn btn-danger">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                                <path
                                                    d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                                                <path fill-rule="evenodd"
                                                    d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                                            </svg>
                                        </a>
                                    </td> --}}
                                    </tr>
                                    @php
                                        $key++;
                                    @endphp
                                @endforeach
                            @else
                                @foreach ($results as $result)
                                    {{-- @php
                             echo $result->assessment_scoring_data->first();
                            @endphp    --}}
                                    <tr>
                                        <td><input type="checkbox" name="bulk_action[]" value="{{ $result->id }}"
                                                id=""></td>
                                        <td>{{ $key }}</td>
                                        {{-- <td>{{ $result->first()->assessments->first()->Type??'' }}</td> --}}
                                        <td>{{ $result->assessments->first()->Name ?? '' }}</td>
                                        <td>{{ $result->resultParticipant->first()->Firstname ?? '' }}
                                            {{ $result->resultParticipant->first()->Lastname ?? '' }}</td>
                                        <td>{{ $result->resultGrade->first()->Name ?? '' }}</td>
                                        <td>{{ $result->resultGroup->first()->Name ?? '' }}-{{ $result->resultGroup->first()->Abbr ?? '' }}
                                        </td>
                                        <td>{{ $result->resultEvent->first()->name ?? '' }}</td>
                                        <td>{{ $result->Score }}</td>
                                        <td>
                                            {{-- @dd($result->assessment_scoring_data->first()) --}}
                                            @if (!empty($result->assessment_scoring_data->first()->image))
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
                                            {{-- {{ $result->assessment_scoring_data->first()->image??'' }} --}}
                                        </td>
                                        <td>{{ isset($result->created_at) ? date_format($result->created_at, 'd-m-Y') : '' }}
                                        </td>
                                        <td>
                                            <a href="{{ route('result.delete', ['id' => $result->id]) }}"
                                                class="btn btn-danger">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                                    <path
                                                        d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                                                    <path fill-rule="evenodd"
                                                        d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                                                </svg>
                                            </a>
                                        </td>
                                        {{-- <td>{{ $key }}</td>
                                   <td>{{ $result->Score_target??'' }}</td>
                                   <td>{{ $result->Firstname??'' }} {{ $result->Lastname??'' }}</td>
                                   <td>{{ $result->grade_name??'' }}</td>
                                   <td>{{ $result->Group_Name??'' }}-{{ $result->Group_Abbr??'' }}</td>
                                   <td>{{ $result->Name??'' }}</td>
                                   <td>{{ $result->assesst_score??'' }}</td>
                                   <td>{{ $result->assesst_duration??'' }}</td>
                                   <td>{{ $result->assesst_distance??'' }}</td>
                                   <td>{{ $result->assesst_beep??'' }}</td> --}}
                                        {{-- <td>
                                        <div class="d-flex">
                                            <a href="{{ route('assessment.edit', ['id' => $result->id]) }}"
                                                class="me-2 btn btn-info text-white">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                                    <path
                                                        d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                                                </svg>
                                            </a>
                                            <a href="{{ route('assessment.delete', ['id' => $result->id]) }}"
                                                class="btn btn-danger">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                                    <path
                                                        d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                                                    <path fill-rule="evenodd"
                                                        d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                                                </svg>
                                            </a>
                                        </div>
                                    </td> --}}
                                    </tr>
                                    @php
                                        $key++;
                                    @endphp
                                @endforeach
                            @endif
                        </tbody>
                    </table>
                    </form>
                </div>
            </div>
        </div>
    </main>

@endsection
