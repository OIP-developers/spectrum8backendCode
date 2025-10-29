@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Gender @if (isset($gender_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($gender_edit)) action="{{ route('gender.update') }}" @else action="{{ route('gender.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($gender_edit))
                            <input type="hidden" name="id" value="{{ $gender_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label class="mb-2">Gender <span class="text-danger">*</span></label>
                                <input type="text" name="gender" class="form-control" required placeholder="Gender"
                                    @if (isset($gender_edit)) value="{{ $gender_edit->Gender }}" @else value="{{ old('gender') }}" @endif>
                            </div>

                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($gender_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
