@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Assessment Evaluate @if (isset($assessment_evaluate_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($assessment_evaluate_edit)) action="{{ route('assessment_evaluate.update') }}" @else action="{{ route('assessment_evaluate.add') }}" @endif
                        method="post" enctype="multipart/form-data">
                        @csrf
                        @if (isset($assessment_evaluate_edit))
                            <input type="hidden" name="id" value="{{ $assessment_evaluate_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="form-group col-12 mb-3">
                                <label class="mb-2" for="inputState">Assessment <span class="text-danger">*</span></label>
                                <select id="inputState" name="assessment_id" required>
                                    <option value="" selected disabled>Select Assessment</option>
                                    @foreach ($assessments as $assessment)
                                        <option value="{{ $assessment->id }}"
                                            @if (isset($assessment_evaluate_edit)) {{ $assessment_evaluate_edit->AssessmentID == $assessment->id ? 'selected' : '' }} @endif>
                                            {{ $assessment->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Name <span class="text-danger">*</span></label>
                                <input type="text" name="name" class="form-control" required placeholder="Name"
                                    @if (isset($assessment_evaluate_edit)) value="{{ $assessment_evaluate_edit->Name }}" @else value="{{ old('name') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Weight <span class="text-danger">*</span></label>
                                <input type="number" name="weight" class="form-control" required placeholder="Weight"
                                    @if (isset($assessment_evaluate_edit)) value="{{ $assessment_evaluate_edit->Weight }}" @else value="{{ old('weight') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Sort <span class="text-danger">*</span></label>
                                <input type="number" name="sort" class="form-control" required placeholder="Sort"
                                    @if (isset($assessment_evaluate_edit)) value="{{ $assessment_evaluate_edit->Sort }}" @else value="{{ old('sort') }}" @endif>
                            </div>

                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($assessment_evaluate_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
