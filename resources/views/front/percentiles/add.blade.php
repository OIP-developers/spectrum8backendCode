@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Percentile @if (isset($percentiles_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($percentiles_edit)) action="{{ route('percentile.update') }}" @else action="{{ route('percentile.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($percentiles_edit))
                            <input type="hidden" name="id" value="{{ $percentiles_edit->id }}">
                        @endif
                        <div class="row">

                            <div class="form-group col-12 mb-3">
                                <label class="mb-2" for="assessment_score_type">Assessments</label>
                                <select name="assessment" required id="assessment_score_type">
                                    <option disabled selected value="">Select Assessments</option>
                                    @foreach ($assessments as $assessment)
                                        <option value="{{ $assessment->id }}"
                                            @if (isset($percentiles_edit)) {{ $percentiles_edit->assessment_id == $assessment->id ? 'selected' : '' }} @endif>
                                            {{ $assessment->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-12 mb-3">
                                <label class="mb-2" for="inputState">Grade</label>
                                <select id="inputState" name="grade" required>
                                    <option disabled selected value="">Select Grade</option>
                                    @foreach ($grades as $grade)
                                        <option value="{{ $grade->id }}"
                                            @if (isset($percentiles_edit)) {{ $percentiles_edit->grade_id == $grade->id ? 'selected' : '' }} @endif>
                                            {{ $grade->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Percent</label>
                                <input step="any" type="number" name="percent" class="form-control" required
                                    placeholder="Percent"
                                    @if (isset($percentiles_edit)) value="{{ $percentiles_edit->percent }}" @else value="{{ old('percent') }}" @endif>
                            </div>

                            <div class="col-12 mb-3">
                                <label class="mb-2">Gender</label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input male" type="radio" name="gender" required
                                            id="exampleRadios1" value="0"
                                            @if (isset($percentiles_edit)) {{ $percentiles_edit->gender == 'Male' ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="exampleRadios1">
                                            Male
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input female" type="radio" name="gender" required
                                            id="exampleRadios2" value="1"
                                            @if (isset($percentiles_edit)) {{ $percentiles_edit->gender == 'Female' ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="exampleRadios2">
                                            Female
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input female" type="radio" name="gender" required
                                            id="exampleRadios2" value="3"
                                            @if (isset($percentiles_edit)) {{ $percentiles_edit->gender == 'Both' ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="exampleRadios2">
                                            Both
                                        </label>
                                    </div>
                                </div>
                            </div>



                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($percentiles_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
