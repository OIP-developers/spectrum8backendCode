@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Assessment @if (isset($assessments_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">

            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($assessments_edit)) action="{{ route('assessment.update') }}" @else action="{{ route('assessment.add') }}" @endif
                        method="post" enctype="multipart/form-data">
                        @csrf
                        @if (isset($assessments_edit))
                            <input type="hidden" name="id" value="{{ $assessments_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="col-4 mb-3">
                                <label class="mb-2">Name <span class="text-danger">*</span></label>
                                <input type="text" name="name" class="form-control" required placeholder="Name"
                                    @if (isset($assessments_edit)) value="{{ $assessments_edit->Name }}" @else value="{{ old('name') }}" @endif>
                            </div>
                            <div class="col-4 mb-3">
                                <label class="mb-2">Short Name <span class="text-danger">*</span></label>
                                <input type="text" name="ShortName" class="form-control" required
                                    placeholder="Short Name"
                                    @if (isset($assessments_edit)) value="{{ $assessments_edit->ShortName }}" @else value="{{ old('ShortName') }}" @endif>
                            </div>
                            <div class="col-4 mb-3">
                                <label class="mb-2">Nick Name <span class="text-danger">*</span></label>
                                <input type="text" name="NickName" class="form-control" required placeholder="Nick Name"
                                    @if (isset($assessments_edit)) value="{{ $assessments_edit->NickName }}" @else value="{{ old('NickName') }}" @endif>
                            </div>
                            <div class="col-4 mb-3">
                                <label class="mb-2">Abbreviation <span class="text-danger">*</span></label>
                                <input type="text" name="Abbr" class="form-control" required
                                    placeholder="Abbreviation"
                                    @if (isset($assessments_edit)) value="{{ $assessments_edit->Abbr }}" @else value="{{ old('Abbr') }}" @endif>
                            </div>
                            <div class="col-4 mb-3">
                                <label class="mb-2">Max Participants <span class="text-danger">*</span></label>
                                <input type="number" name="max_participants" class="form-control" required
                                    placeholder="Max Participants"
                                    @if (isset($assessments_edit)) value="{{ $assessments_edit->MaxParticipants }}" @else value="{{ old('max_participants') }}" @endif>
                            </div>
                            <div class="col-4 mb-3">
                                <label class="mb-2">Sort Number <span class="text-danger">*</span></label>
                                <input type="number" min="1" name="sort" class="form-control" required
                                    placeholder="Sort Number"
                                    @if (isset($assessments_edit)) value="{{ $assessments_edit->Sort }}" @else value="{{ old('sort') }}" @endif>
                            </div>
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Assessment Type <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" name="assessment_type_id" required>
                                    <option value="" selected disabled>Select Color</option>
                                    @foreach ($assessment_type as $assessment_type_item)
                                        <option value="{{ $assessment_type_item->id }}"
                                            @if (isset($assessments_edit)) {{ $assessments_edit->AssessmentTypeID == $assessment_type_item->id ? 'selected' : '' }} @endif>
                                            {{ $assessment_type_item->Name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Color <span class="text-danger">*</span></label>
                                <select id="inputState" name="color_id" required>
                                    <option value="" selected disabled>Select Color</option>
                                    @foreach ($colors as $color)
                                        <option value="{{ $color->id }}"
                                            @if (isset($assessments_edit)) {{ $assessments_edit->ColorID == $color->id ? 'selected' : '' }} @endif>
                                            {{ $color->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Setup <span class="text-danger">*</span></label>
                                <textarea name="Setup" id="" class="form-control" required placeholder="Setup" cols="30" rows="2">
@if (isset($assessments_edit))
{{ $assessments_edit->Setup }} @else{{ old('Setup') }}
@endif
</textarea>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Instructions <span class="text-danger">*</span></label>
                                <textarea name="Instructions" id="" class="form-control" required placeholder="Instructions" cols="30"
                                    rows="2">
@if (isset($assessments_edit))
{{ $assessments_edit->Instructions }} @else{{ old('Instructions') }}
@endif
</textarea>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">EvalList <span class="text-danger">*</span></label>
                                <textarea name="EvalList" id="" class="form-control" required placeholder="EvalList" cols="30"
                                    rows="2">
                                @if (isset($assessments_edit))
{{ $assessments_edit->EvalList }} @else{{ old('EvalList') }}
@endif
                                </textarea>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Upload Image</label>
                                <input type="file" name="image" accept="image/png, image/jpeg, image/jpg"
                                    class="form-control"
                                    @if (isset($assessments_edit)) value="{{ $assessments_edit->Image }}" @else required  value="{{ old('image') }}" @endif>
                                    <div class="col-md-12 my-2">
                                        @if (isset($assessments_edit->Image))
                                            <img id="preview-image-before-upload" class="logo_image"
                                                src="{{ asset('images/assessment_image/' . $assessments_edit->Image) }}" alt=""
                                                alt="preview image">
                                        @endif
                                    </div>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Upload Video</label>
                                <input type="file" name="video" accept="video/*" class="form-control"
                                    @if (isset($assessments_edit)) value="{{ $assessments_edit->video }}" @else required  value="{{ old('video') }}" @endif>
                                <div class="col-md-12 my-2">
                                    @if (isset($assessments_edit->video))
                                        <video width="320" controls="">
                                            <source src="{{ asset('images/assessment_image/' . $assessments_edit->video) }}"
                                                preload="auto" type="video/mp4" width="100" height="100">
                                        </video>
                                    @endif
                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($assessments_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
