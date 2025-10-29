@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Organization Type @if (isset($organization_type_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($organization_type_edit)) action="{{ route('organization_type.update') }}" @else action="{{ route('organization_type.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($organization_type_edit))
                            <input type="hidden" name="id" value="{{ $organization_type_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label class="mb-2">Is School <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="is_school" id="exampleRadios1"
                                            value="1" required
                                            @if (isset($organization_type_edit)) {{ $organization_type_edit->IsSchool == 1 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="exampleRadios1">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="is_school" id="exampleRadios2"
                                            value="0" required
                                            @if (isset($organization_type_edit)) {{ $organization_type_edit->IsSchool == 0 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="exampleRadios2">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 mb-3">
                                <label class="mb-2">Classification <span class="text-danger">*</span></label>
                                <input type="text" name="classification" class="form-control" required
                                    placeholder="Classification"
                                    @if (isset($organization_type_edit)) value="{{ $organization_type_edit->Classification }}" @else value="{{ old('classification') }}" @endif>
                            </div>

                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($organization_type_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
