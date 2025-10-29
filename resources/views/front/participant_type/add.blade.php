@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Participant Type @if (isset($participant_type_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($participant_type_edit)) action="{{ route('participant_type.update') }}" @else action="{{ route('participant_type.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($participant_type_edit))
                            <input type="hidden" name="id" value="{{ $participant_type_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label class="mb-2">Classification <span class="text-danger">*</span></label>
                                <input type="text" name="classification" class="form-control" required
                                    placeholder="Classification"
                                    @if (isset($participant_type_edit)) value="{{ $participant_type_edit->Classification }}" @else value="{{ old('classification') }}" @endif>
                            </div>


                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($participant_type_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
