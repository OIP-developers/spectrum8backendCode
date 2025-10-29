@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Ninty Five @if (isset($ninty_five_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($ninty_five_edit)) action="{{ route('ninty_five.update') }}" @else action="{{ route('ninty_five.add') }}" @endif
                        method="post" enctype="multipart/form-data">
                        @csrf
                        @if (isset($ninty_five_edit))
                            <input type="hidden" name="assessment_id_find" value="{{ $ninty_five_edit->AssessmentID }}">
                            <input type="hidden" name="gender_id_find" value="{{ $ninty_five_edit->GenderID }}">
                            <input type="hidden" name="grade_id_find" value="{{ $ninty_five_edit->GradeID }}">
                        @endif
                        <div class="row">
                            <div class="form-group col-12 mb-3">
                                <label class="mb-2" for="inputState">Assessment <span class="text-danger">*</span></label>
                                <select id="inputState" name="assessment_id" required>
                                    <option value="" selected disabled>Select Assessment</option>
                                    @foreach ($assessments as $assessment)
                                        <option value="{{ $assessment->id }}"
                                            @if (isset($ninty_five_edit)) {{ $ninty_five_edit->AssessmentID == $assessment->id ? 'selected' : '' }} @endif>
                                            {{ $assessment->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-12 mb-3">
                                <label class="mb-2" for="inputState">Grade <span class="text-danger">*</span></label>
                                <select id="inputState" name="grade_id" required>
                                    <option value="" selected disabled>Select Grade</option>
                                    @foreach ($grades as $grade)
                                        <option value="{{ $grade->id }}"
                                            @if (isset($ninty_five_edit)) {{ $ninty_five_edit->GradeID == $grade->id ? 'selected' : '' }} @endif>
                                            {{ $grade->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-12 mb-3">
                                <label class="mb-2" for="inputState">Gender <span class="text-danger">*</span></label>
                                <select id="inputState" name="gender_id" required>
                                    <option value="" selected disabled>Select Gender</option>
                                    @foreach ($genders as $gender)
                                        <option value="{{ $gender->id }}"
                                            @if (isset($ninty_five_edit)) {{ $ninty_five_edit->GenderID == $gender->id ? 'selected' : '' }} @endif>
                                            {{ $gender->Gender }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-4 mb-3">
                                <label class="mb-2">Percent <span class="text-danger">*</span></label>
                                <input type="text" name="percent" class="form-control" required placeholder="Percent"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->Percent }}" @else value="{{ old('percent') }}" @endif>
                            </div>
                            {{-- <div class="col-12 mb-3">
                                <label class="mb-2">Use Segment <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="use_segment"
                                            id="exampleRadios1" value="1" required
                                            @if (isset($ninty_five_edit)) {{ $ninty_five_edit->UseSegment == 1 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="exampleRadios1">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="use_segment"
                                            id="exampleRadios2" value="0" required
                                            @if (isset($ninty_five_edit)) {{ $ninty_five_edit->UseSegment == 0 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="exampleRadios2">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div> --}}
                            <div class="col-4 mb-3">
                                <label class="mb-2">Color Segment <span class="text-danger">*</span></label>
                                <input type="text" name="color_segment" class="form-control" required
                                    placeholder="Color Segment"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->ColorSegment }}" @else value="{{ old('color_segment') }}" @endif>
                            </div>
                            <div class="col-4 mb-3">
                                <label class="mb-2">Distance To Red <span class="text-danger">*</span></label>
                                <input type="text" name="distance_to_red" class="form-control" required
                                    placeholder="Distance To Red"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->DistanceToRed }}" @else value="{{ old('distance_to_red') }}" @endif>
                            </div>
                            <div class="col-3 mb-3">
                                <label class="mb-2">RL <span class="text-danger">*</span></label>
                                <input type="text" name="RL" class="form-control" required placeholder="RL"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->RL }}" @else value="{{ old('RL') }}" @endif>
                            </div>
                            <div class="col-3 mb-3">
                                <label class="mb-2">RU <span class="text-danger">*</span></label>
                                <input type="text" name="RU" class="form-control" required placeholder="RU"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->RU }}" @else value="{{ old('RU') }}" @endif>
                            </div>
                            <div class="col-3 mb-3">
                                <label class="mb-2">BL <span class="text-danger">*</span></label>
                                <input type="text" name="BL" class="form-control" required placeholder="BL"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->BL }}" @else value="{{ old('BL') }}" @endif>
                            </div>
                            <div class="col-3 mb-3">
                                <label class="mb-2">BU <span class="text-danger">*</span></label>
                                <input type="text" name="BU" class="form-control" required placeholder="BU"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->BU }}" @else value="{{ old('BU') }}" @endif>
                            </div>
                            <div class="col-3 mb-3">
                                <label class="mb-2">GL <span class="text-danger">*</span></label>
                                <input type="text" name="GL" class="form-control" required placeholder="GL"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->GL }}" @else value="{{ old('GL') }}" @endif>
                            </div>
                            <div class="col-3 mb-3">
                                <label class="mb-2">GU <span class="text-danger">*</span></label>
                                <input type="text" name="GU" class="form-control" required placeholder="GU"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->GU }}" @else value="{{ old('GU') }}" @endif>
                            </div>
                            <div class="col-3 mb-3">
                                <label class="mb-2">OL <span class="text-danger">*</span></label>
                                <input type="text" name="OL" class="form-control" required placeholder="OL"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->OL }}" @else value="{{ old('OL') }}" @endif>
                            </div>
                            <div class="col-3 mb-3">
                                <label class="mb-2">OU <span class="text-danger">*</span></label>
                                <input type="text" name="OU" class="form-control" required placeholder="OU"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->OU }}" @else value="{{ old('OU') }}" @endif>
                            </div>
                            <div class="col-3 mb-3">
                                <label class="mb-2">VL <span class="text-danger">*</span></label>
                                <input type="text" name="VL" class="form-control" required placeholder="VL"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->VL }}" @else value="{{ old('VL') }}" @endif>
                            </div>
                            <div class="col-3 mb-3">
                                <label class="mb-2">VU <span class="text-danger">*</span></label>
                                <input type="text" name="VU" class="form-control" required placeholder="VU"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->VU }}" @else value="{{ old('VU') }}" @endif>
                            </div>
                            <div class="col-3 mb-3">
                                <label class="mb-2">YL <span class="text-danger">*</span></label>
                                <input type="text" name="YL" class="form-control" required placeholder="YL"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->YL }}" @else value="{{ old('YL') }}" @endif>
                            </div>
                            <div class="col-3 mb-3">
                                <label class="mb-2">YU <span class="text-danger">*</span></label>
                                <input type="text" name="YU" class="form-control" required placeholder="YU"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->YU }}" @else value="{{ old('YU') }}" @endif>
                            </div>
                            <div class="col-3 mb-3">
                                <label class="mb-2">PL <span class="text-danger">*</span></label>
                                <input type="text" name="PL" class="form-control" required placeholder="PL"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->PL }}" @else value="{{ old('PL') }}" @endif>
                            </div>
                            <div class="col-3 mb-3">
                                <label class="mb-2">PU <span class="text-danger">*</span></label>
                                <input type="text" name="PU" class="form-control" required placeholder="PU"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->PU }}" @else value="{{ old('PU') }}" @endif>
                            </div>
                            <div class="col-3 mb-3">
                                <label class="mb-2">WL <span class="text-danger">*</span></label>
                                <input type="text" name="WL" class="form-control" required placeholder="WL"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->WL }}" @else value="{{ old('WL') }}" @endif>
                            </div>
                            <div class="col-3 mb-3">
                                <label class="mb-2">WU <span class="text-danger">*</span></label>
                                <input type="text" name="WU" class="form-control" required placeholder="WU"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->WU }}" @else value="{{ old('WU') }}" @endif>
                            </div>
                            
                            <div class="col-12 mb-3">
                                <label class="mb-2">Use Segment <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="use_segment"
                                            id="use_segment_yes" value="1" required
                                            @if (isset($ninty_five_edit)) {{ $ninty_five_edit->UseSegment == 1 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="use_segment_yes">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="use_segment"
                                            id="use_segment_no" value="0" required
                                            @if (isset($ninty_five_edit)) {{ $ninty_five_edit->UseSegment == 0 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="use_segment_no">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div>
                            {{-- <div class="col-12 mb-3">
                                <label class="mb-2">Upload Image <span class="text-danger">*</span></label>
                                <input type="file" name="image" accept="image/png, image/jpeg, image/jpg"
                                    class="form-control"
                                    @if (isset($ninty_five_edit)) value="{{ $ninty_five_edit->Image }}" @else required  value="{{ old('image') }}" @endif>
                            </div> --}}

                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($ninty_five_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
