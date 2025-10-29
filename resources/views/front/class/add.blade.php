@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Class @if (isset($class_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($class_edit)) action="{{ route('class.update') }}" @else action="{{ route('class.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($class_edit))
                            <input type="hidden" name="id" value="{{ $class_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label class="mb-2">Name <span class="text-danger">*</span></label>
                                <input type="text" name="name" class="form-control" required placeholder="Name"
                                    @if (isset($class_edit)) value="{{ $class_edit->Name }}" @else value="{{ old('name') }}" @endif>
                            </div>
                            <div class="form-group col-12 mb-3">
                                <label class="mb-2" for="inputState">Color <span class="text-danger">*</span></label>
                                <select id="inputState" name="color_id" required>
                                    <option value="" selected disabled>Select Color</option>
                                    @foreach ($colors as $color)
                                        <option value="{{ $color->id }}"
                                            @if (isset($class_edit)) {{ $class_edit->ColorID == $color->id ? 'selected' : '' }} @endif>
                                            {{ $color->Name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($class_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
