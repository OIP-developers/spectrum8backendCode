@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Organization Assessments</h2>
            <hr class="mx-auto w-50">



            {{-- <div class="text-end mb-3">
                <a class="btn btn-info text-white" href="{{ route('assessment.form') }}">Add Assessment</a>
            </div> --}}
            <div class="card mb-4">
                <div class="card-body">
                    <form action="{{ route('assessment.bulk_delete') }}" method="GET">
                        <div class="text-end mb-3">
                            <input type="submit" class="btn btn-danger text-white" value="Bulk Delete">
                        </div>
                        <table id="datatablesSimple">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" class="select_all" name="" id=""></th>
                                    <th>S.no</th>
                                    <th>Name</th>
                                    <th>Short Name</th>
                                    <th>Nick Name</th>
                                    <th>Abbreviation</th>
                                    <th>Images</th>
                                    <th>Max Participant</th>
                                    <th>Type</th>
                                    <th>Assessment Type</th>
                                    <th>Sort</th>
                                    {{-- <th>Status</th> --}}
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $key = 1;
                                @endphp
                                @foreach ($assessments as $assessment)
                                    <tr>
                                        <td><input type="checkbox" name="bulk_action[]" value="{{ $assessment->id }}"
                                                id=""></td>
                                        <td>{{ $key }}</td>
                                        <td>{{ $assessment->Name ?? '' }}</td>
                                        <td>{{ $assessment->ShortName ?? '' }}</td>
                                        <td>{{ $assessment->NickName ?? '' }}</td>
                                        <td>{{ $assessment->Abbr ?? '' }}</td>
                                        <td>
                                            @if ($assessment->Image)
                                                <img src="{{ asset('images/assessment_image/' . $assessment->Image) }}"
                                                    width="50" height="50" alt="">
                                            @endif
                                        </td>
                                        <td>{{ $assessment->MaxParticipants ?? '' }}</td>
                                        <td>{{ $assessment->Type ?? '' }}</td>
                                        <td>{{ $assessment->CreatedBy == 1 ? 'Public' : 'Private' }}</td>
                                        <td>{{ $assessment->Sort ?? '' }}</td>
                                        {{-- <td>
                                        <select name="status" class="status_change" data-id="{{ $assessment->id }}"
                                            data-route="{{ route('change_status_assessment') }}">
                                            <option value="0" @if ($assessment->Status == 0) selected @endif>Active
                                            </option>
                                            <option value="1" @if ($assessment->Status == 1) selected @endif>Deactive
                                            </option>
                                        </select>
                                    </td> --}}
                                        <td>
                                            <select name="status" class="status_change" data-id="{{ $assessment->id }}"
                                                data-route="{{ route('change_status_organization_assessments') }}">
                                                <option value="0" @if ($assessment->Status == 0) selected @endif>
                                                    Active
                                                </option>
                                                <option value="1" @if ($assessment->Status == 1) selected @endif>
                                                    Deactive
                                                </option>
                                            </select>
                                            {{-- <div class="d-flex">
                                            <a href="{{ route('assessment.edit', ['id' => $assessment->id]) }}"
                                                class="me-2 btn btn-info text-white">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                                    <path
                                                        d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                                                </svg>
                                            </a>
                                            <a href="{{ route('assessment.delete', ['id' => $assessment->id]) }}"
                                                class="btn btn-danger">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                                    <path
                                                        d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                                                    <path fill-rule="evenodd"
                                                        d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                                                </svg>
                                            </a>
                                        </div> --}}
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
