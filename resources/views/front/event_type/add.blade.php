@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Event Type @if (isset($event_type_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($event_type_edit)) action="{{ route('event_type.update') }}" @else action="{{ route('event_type.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($event_type_edit))
                            <input type="hidden" name="id" value="{{ $event_type_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label class="mb-2">Name <span class="text-danger">*</span></label>
                                <input type="text" name="name" class="form-control" required placeholder="Name"
                                    @if (isset($event_type_edit)) value="{{ $event_type_edit->Name }}" @else value="{{ old('name') }}" @endif>
                            </div>
                            {{-- <div class="col-12 mb-3">
                                <label class="mb-2">In Person <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="in_person" id="in_person_yes"
                                            value="1" required
                                            @if (isset($event_type_edit)) {{ $event_type_edit->InPerson == 1 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="in_person_yes">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="in_person" id="in_person_no"
                                            value="0" required
                                            @if (isset($event_type_edit)) {{ $event_type_edit->InPerson == 0 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="in_person_no">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Vitrual <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="vitrual" id="vitrual_yes"
                                            value="1" required
                                            @if (isset($event_type_edit)) {{ $event_type_edit->Vitrual == 1 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="vitrual_yes">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="vitrual" id="vitrual_no"
                                            value="0" required
                                            @if (isset($event_type_edit)) {{ $event_type_edit->Vitrual == 0 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="vitrual_no">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div> --}}
                            <div class="form-group col-12 mb-3">
                                <label class="mb-2" for="inputState">Event Catagory <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" name="event_category_id" required>
                                    <option value="" selected disabled>Select Catagory</option>
                                    @foreach ($event_catagories as $event_catagory)
                                        <option value="{{ $event_catagory->id }}"
                                            @if (isset($event_type_edit)) {{ $event_type_edit->EventCatagoryID == $event_catagory->id ? 'selected' : '' }} @endif>
                                            {{ $event_catagory->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            {{-- <div class="col-12 mb-3">
                                <label class="mb-2">Is Active <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="is_active" id="is_active_yes"
                                            value="1" required
                                            @if (isset($event_type_edit)) {{ $event_type_edit->IsActive == 1 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="is_active_yes">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="is_active" id="is_active_no"
                                            value="0" required
                                            @if (isset($event_type_edit)) {{ $event_type_edit->IsActive == 0 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="is_active_no">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div> --}}

                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($event_type_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
