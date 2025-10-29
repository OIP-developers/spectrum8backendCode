@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Ninty Five</h2>
            <hr class="w-50 mx-auto">


           @if (in_array('lookup_create', roles_and_permissions()) ||
                    in_array('lookup_archive', roles_and_permissions()))
                 <div class="d-flex justify-content-between mb-3">
                    <div>
                        {{-- <a class="btn btn-danger text-white" href="{{ route('ninty_five.trash') }}">Trash</a> --}}
                        @if (in_array('lookup_archive', roles_and_permissions()))
                        <a class="btn btn-success text-white" href="{{ route('ninty_five.archive') }}">Archive</a>
            @endif
        </div>
                        @if (in_array('lookup_create', roles_and_permissions()))
                    <a class="btn btn-info text-white" href="{{ route('ninty_five.form') }}">Add Ninty Five</a>
            @endif
        </div>
            @endif
            <div class="card mb-4">
                <div class="card-body">
                    {{-- @if (Auth::user()->role_id == 5)
                    <form action="{{ route('ninty_five.bulk_delete') }}" method="GET">
                        <div class="text-end mb-3">
                            <input type="submit" class="btn btn-danger text-white" value="Bulk Delete">
                        </div>
                        @endif --}}
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                {{-- <th><input type="checkbox" class="select_all" name="" id=""></th> --}}
                                <th>S.no</th>
                                {{-- <th>Image</th> --}}
                                <th>Assessment</th>
                                <th>Grade</th>
                                <th>Gender</th>
                                <th>Percent</th>
                                <th>Use Segment</th>
                                {{-- <th>Color Segment</th> --}}
                                @if (in_array('lookup_archive', roles_and_permissions()) ||
                                in_array('lookup_update', roles_and_permissions()))
                            <th>Action</th>
                        @endif
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($ninty_five as $ninty_five_item)
                                <tr>
                                    {{-- <td><input type="checkbox" name="bulk_action[]" valAssessmentID="{{ $ninty_five_item->AssessmentID,'GenderID'$ninty_five_item->GenderID,'GradeID'=>$ninty_five_item->AssessmentID=> }}"
                                            id=""></td> --}}
                                    <td>{{ $key }}</td>
                                    {{-- <td>
                                        @if ($ninty_five_item->Image)
                                            <img src="{{ asset('images/ninty_five/' . $ninty_five_item->Image) }}"
                                                class="logo_image" alt="">
                                        @endif
                                    </td> --}}
                                    <td>{{ $ninty_five_item->assessment->Name ?? '' }}</td>
                                    <td>{{ $ninty_five_item->grade->Name ?? '' }}</td>
                                    <td>{{ $ninty_five_item->gender->Gender ?? '' }}</td>
                                    <td>{{ $ninty_five_item->Percent ?? '' }}</td>
                                    {{-- <td>{{ $ninty_five_item->UseSegment ?? '' }}</td> --}}
                                    <td>{{ $ninty_five_item->UseSegment == 1 ? 'Yes' : 'No' }}</td>
                                    @if (in_array('lookup_archive', roles_and_permissions()) ||
                                        in_array('lookup_update', roles_and_permissions()))
                                        <td>
                                            <div class="d-flex">
                                                @if (in_array('lookup_update', roles_and_permissions()))
                                                <a href="{{ route('ninty_five.edit', ['assessment_id' => $ninty_five_item->AssessmentID, 'gender_id' => $ninty_five_item->GenderID, 'grade_id' => $ninty_five_item->GradeID]) }}"
                                                    class="btn btn-info text-white">
                                                    <i class="fa fa-pen"></i>
                                                </a>
                                                @endif
                                                {{-- <a href="{{ route('ninty_five.delete',['assessment_id' => $ninty_five_item->AssessmentID,'gender_id'=>$ninty_five_item->GenderID,'grade_id'=>$ninty_five_item->GradeID]) }}"
                                                        class="btn btn-danger me-2">
                                                        <i class="fa fa-trash"></i>
                                                    </a> --}}
                                                @if (in_array('lookup_archive', roles_and_permissions()))
                                                <a href="{{ route('ninty_five.toggle.archive', ['assessment_id' => $ninty_five_item->AssessmentID, 'gender_id' => $ninty_five_item->GenderID, 'grade_id' => $ninty_five_item->GradeID]) }}"
                                                    class="btn btn-success text-white" title="Archive">
                                                    <i class="fa fa-box-archive"></i>
                                                </a>
                                                @endif
                                            </div>
                                        </td>
                                    @endif
                                </tr>
                                @php
                                    $key++;
                                @endphp
                            @endforeach
                        </tbody>
                    </table>
                    {{-- @if (Auth::user()->role_id == 5)
                </form>
                @endif --}}
                </div>
            </div>
        </div>
    </main>
@endsection
