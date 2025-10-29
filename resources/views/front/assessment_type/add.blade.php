@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Assessment Type @if (isset($assessment_type_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">

            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($assessment_type_edit)) action="{{ route('assessment_type.update') }}" @else action="{{ route('assessment_type.add') }}" @endif
                        method="post" enctype="multipart/form-data">
                        @csrf
                        @if (isset($assessment_type_edit))
                            <input type="hidden" name="id" value="{{ $assessment_type_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label class="mb-2">Name <span class="text-danger">*</span></label>
                                <input type="text" name="name" class="form-control" required placeholder="Name"
                                    @if (isset($assessment_type_edit)) value="{{ $assessment_type_edit->Name }}" @else value="{{ old('name') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Assessment Type <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="timed" id="timed_yes"
                                            value="1" required
                                            @if (isset($assessment_type_edit)) {{ $assessment_type_edit->Timed == 1 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="timed_yes">
                                            Time
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="timed" id="timed_no"
                                            value="0" required
                                            @if (isset($assessment_type_edit)) {{ $assessment_type_edit->Distance == 1 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="timed_no">
                                            Distance
                                        </label>
                                    </div>
                                </div>
                            </div>
                            {{-- <div class="col-12 mb-3">
                                <label class="mb-2">Distance <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="distance" id="distance_yes"
                                            value="1" required
                                            @if (isset($events_edit)) {{ $events_edit->Distance == 1 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="distance_yes">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="distance" id="distance_no"
                                            value="0" required
                                            @if (isset($events_edit)) {{ $events_edit->Distance == 0 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="distance_no">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div> --}}

                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($assessment_type_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
