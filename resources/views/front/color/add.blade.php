@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Color @if (isset($color_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($color_edit)) action="{{ route('color.update') }}" @else action="{{ route('color.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($color_edit))
                            <input type="hidden" name="id" value="{{ $color_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label class="mb-2">Name <span class="text-danger">*</span></label>
                                <input type="text" name="name" class="form-control" required placeholder="Name"
                                    @if (isset($color_edit)) value="{{ $color_edit->Name }}" @else value="{{ old('name') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Information <span class="text-danger">*</span></label>
                                <textarea name="desc" id="" cols="30" rows="2" class="form-control">
@if (isset($color_edit))
{{ $color_edit->Information }}
@else
{{ old('desc') }}
@endif
</textarea>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">WebColor <span class="text-danger">*</span></label>
                                <input type="color" name="code" style="height: 45px" class="form-control" required
                                    placeholder="Color Code"
                                    @if (isset($color_edit)) value="{{ $color_edit->WebColor }}" @else value="{{ old('code') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Sort <span class="text-danger">*</span></label>
                                <input type="number" name="sort" class="form-control" required placeholder="Sort Number"
                                    @if (isset($color_edit)) value="{{ $color_edit->Sort }}" @else value="{{ old('sort') }}" @endif>
                            </div>


                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($color_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
