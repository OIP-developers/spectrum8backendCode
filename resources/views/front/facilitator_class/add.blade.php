@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Facilitator Class @if (isset($facilitator_class_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($facilitator_class_edit)) action="{{ route('facilitator_class.update') }}" @else action="{{ route('facilitator_class.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($facilitator_class_edit))
                            <input type="hidden" name="id" value="{{ $facilitator_class_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="form-group col-12 mb-3">
                                <label class="mb-2" for="inputState">Facilitator <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" name="facilitator" required>
                                    <option value="" selected disabled>Select Facilitator</option>
                                    @foreach ($facilitators as $facilitator)
                                        <option value="{{ $facilitator->id }}"
                                            @if (isset($facilitator_class_edit)) {{ $facilitator_class_edit->FacilitatorID == $facilitator->id ? 'selected' : '' }} @endif>
                                            {{ $facilitator->Firstname }} {{ $facilitator->Lastname }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-12 mb-3">
                                <label class="mb-2" for="inputState">Class <span class="text-danger">*</span></label>
                                <select id="inputState" name="class" required>
                                    <option value="" selected disabled>Select Class</option>
                                    @foreach ($classes as $class)
                                        <option value="{{ $class->id }}"
                                            @if (isset($facilitator_class_edit)) {{ $facilitator_class_edit->ClassID == $facilitator->id ? 'selected' : '' }} @endif>
                                            {{ $class->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Class Name <span class="text-danger">*</span></label>
                                <input type="text" name="class_name" class="form-control" required
                                    placeholder="Class Name"
                                    @if (isset($facilitator_class_edit)) value="{{ $facilitator_class_edit->ClassName }}" @else value="{{ old('class_name') }}" @endif>
                            </div>
                            {{-- <div class="col-12 mb-3">
                                <label class="mb-2">Is Active <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="is_active" id="is_active_yes"
                                            value="1" required
                                            @if (isset($facilitator_class_edit)) {{ $facilitator_class_edit->IsActive == 1 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="is_active_yes">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="is_active" id="is_active_no"
                                            value="0" required
                                            @if (isset($facilitator_class_edit)) {{ $facilitator_class_edit->IsActive == 0 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="is_active_no">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div> --}}

                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($facilitator_class_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
