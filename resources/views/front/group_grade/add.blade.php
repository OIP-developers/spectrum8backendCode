@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Group Gender @if (isset($group_grade_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($group_grade_edit)) action="{{ route('group_grade.update') }}" @else action="{{ route('group_grade.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($group_grade_edit))
                            <input type="hidden" name="id" value="{{ $group_grade_edit->id }}">
                        @endif
                        <div class="row">

                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Group <span class="text-danger">*</span></label>
                                <select id="inputState" name="group" required>
                                    <option disabled selected value="">Select Group</option>
                                    @foreach ($groups as $group)
                                        <option value="{{ $group->id }}"
                                            @if (isset($group_grade_edit)) {{ $group_grade_edit->GroupID == $group->id ? 'selected' : '' }} @endif>
                                            {{ $group->Name }} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Grade <span class="text-danger">*</span></label>
                                <select id="inputState" name="grade" required>
                                    <option disabled selected value="">Select Grade</option>
                                    @foreach ($grades as $grade)
                                        <option value="{{ $grade->id }}"
                                            @if (isset($group_grade_edit)) {{ $group_grade_edit->GradeID == $grade->id ? 'selected' : '' }} @endif>
                                            {{ $grade->Name }} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($group_grade_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
