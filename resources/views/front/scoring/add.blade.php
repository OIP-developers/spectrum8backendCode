@extends('front.layout.app')
@section('content')
    <style>
        input[type=time]::-webkit-datetime-edit-ampm-field {
            display: none;
        }
    </style>
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Assessment Scoring @if (isset($scoring_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">

            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($scoring_edit)) action="{{ route('scoring.update') }}" @else action="{{ route('scoring.add') }}" @endif
                        method="post" enctype="multipart/form-data">
                        @csrf
                        @if (isset($scoring_edit))
                            <input type="hidden" name="id" value="{{ $scoring_edit->id }}">
                        @endif
                        <div class="row">

                            <div class="form-group col-12 mb-3">
                                <label class="mb-2" for="assessment_score_type">Assessments</label>
                                <select name="assessment" required id="assessment_score_type">
                                    <option disabled selected>Select Assessments</option>
                                    @foreach ($assessments as $assessment)
                                        <option value="{{ $assessment->id }}"
                                            @if (isset($scoring_edit)) {{ $scoring_edit->assessment_id == $assessment->id ? 'selected' : '' }} @endif>
                                            {{ $assessment->Name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group col-12 mb-3">
                                <label class="mb-2" for="inputState">Color</label>
                                <select id="inputState" name="color" required>
                                    <option disabled selected>Select Color</option>
                                    @foreach ($colors as $color)
                                        <option value="{{ $color->id }}"
                                            @if (isset($scoring_edit)) {{ $scoring_edit->color_id == $color->id ? 'selected' : '' }} @endif>
                                            {{ $color->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            {{-- <div class="col-12 mb-3">
                                <label class="mb-2">Select Periority</label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="mode" id="exampleRadios1"
                                            value="Duration" required
                                            @if (isset($scoring_edit)) {{ $scoring_edit->Score_target == 'Duration' ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="exampleRadios1">
                                            Duration
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="mode" id="exampleRadios2"
                                            value="Distance" required
                                            @if (isset($scoring_edit)) {{ $scoring_edit->Score_target == 'Distance' ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="exampleRadios2">
                                            Distance
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="mode" id="exampleRadios3"
                                            value="Beep" required
                                            @if (isset($scoring_edit)) {{ $scoring_edit->Score_target == 'Beep' ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="exampleRadios3">
                                            Beep
                                        </label>
                                    </div>
                                </div>
                            </div> --}}
                            {{-- <div class="col-6 mb-3">
                                <label class="mb-2">Duration</label>
                                <input id="duration" required type="time" step="1" class="form-control" name="duration" placeholder="Duration"
                                @if (isset($scoring_edit)) value="{{ $scoring_edit->Duration }}" @endif>
                           <input type="time" name="duration" id="duration" class="form-control" placeholder="Duration"
                                    @if (isset($scoring_edit)) value="{{ $scoring_edit->Duration }}" @endif> 
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Distance</label>
                                <input type="text" name="distance" class="form-control" placeholder="Distance"
                                    @if (isset($scoring_edit)) value="{{ $scoring_edit->Distance }}" @endif>
                            </div> --}}
                            <div class="col-12 mb-3">
                                <label class="mb-2">Upload Image</label>
                                <input type="file" name="image" accept="image/png, image/jpeg, image/jpg"
                                    class="form-control"
                                    @if (isset($scoring_edit)) value="{{ $scoring_edit->Image }}" @else value="{{ old('image') }}" @else required value="" @endif>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Min</label>
                                <input type="number" min="1" name="min" class="form-control" required
                                    placeholder="Min"
                                    @if (isset($scoring_edit)) value="{{ $scoring_edit->MinValue }}" @else value="{{ old('min') }}" @endif>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Max</label>
                                <input type="number" min="1" name="max" class="form-control" required
                                    placeholder="Max"
                                    @if (isset($scoring_edit)) value="{{ $scoring_edit->MaxValue }}" @else value="{{ old('max') }}" @endif>
                            </div>
                            <div class="col-6 mb-3 hide_for_duration">
                                <label class="mb-2">Min Time</label>
                                <input type="text" name="minTime" class="form-control" placeholder="Min Time"
                                    @if (isset($scoring_edit)) value="{{ $scoring_edit->minTime == '0' ? '' : $scoring_edit->minTime }}" @else value="{{ old('minTime') }}" @endif>
                            </div>
                            <div class="col-6 mb-3 hide_for_duration">
                                <label class="mb-2">Max Time</label>
                                <input type="text" name="maxTime" class="form-control" placeholder="Max Time"
                                    @if (isset($scoring_edit)) value="{{ $scoring_edit->maxTime == '0' ? '' : $scoring_edit->maxTime }}" @else value="{{ old('maxTime') }}" @endif>
                            </div>

                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($scoring_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
