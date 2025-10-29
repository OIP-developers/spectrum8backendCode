@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Event Catagory @if (isset($event_catagory_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($event_catagory_edit)) action="{{ route('event_catagory.update') }}" @else action="{{ route('event_catagory.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($event_catagory_edit))
                            <input type="hidden" name="id" value="{{ $event_catagory_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label class="mb-2">Name <span class="text-danger">*</span></label>
                                <input type="text" name="name" class="form-control" required placeholder="Name"
                                    @if (isset($event_catagory_edit)) value="{{ $event_catagory_edit->Name }}" @else value="{{ old('name') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Abbr <span class="text-danger">*</span></label>
                                <input type="text" name="abbr" class="form-control" required placeholder="Abbr"
                                    @if (isset($event_catagory_edit)) value="{{ $event_catagory_edit->Abbr }}" @else value="{{ old('abbr') }}" @endif>
                            </div>



                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($event_catagory_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
