@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Email Type @if (isset($email_type_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($email_type_edit)) action="{{ route('email_type.update') }}" @else action="{{ route('email_type.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($email_type_edit))
                            <input type="hidden" name="id" value="{{ $email_type_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label class="mb-2">Name <span class="text-danger">*</span></label>
                                <input type="text" name="name" class="form-control" required placeholder="Name"
                                    @if (isset($email_type_edit)) value="{{ $email_type_edit->Name }}" @else value="{{ old('name') }}" @endif>
                            </div>

                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($email_type_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
