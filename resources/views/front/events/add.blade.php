@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Event @if (isset($events_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form id="myTablee"
                        @if (isset($events_edit)) action="{{ route('event.update') }}" @else action="{{ route('event.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($events_edit))
                            <input type="hidden" name="id" value="{{ $events_edit->id }}">
                        @endif
                        <div class="row t-row">

                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Organization <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" name="organization" required>
                                    <option disabled selected value="">Select Organization</option>
                                    @foreach ($organizations as $organization)
                                        <option value="{{ $organization->id }}"
                                            @if (isset($events_edit)) {{ $events_edit->OrganizationID == $organization->id ? 'selected' : '' }} @endif>
                                            {{ $organization->Name }} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Name <span class="text-danger">*</span></label>
                                <input type="text" name="name" class="form-control" required placeholder="Name"
                                    @if (isset($events_edit)) value="{{ $events_edit->Name }}" @else value="{{ old('name') }}" @endif>
                            </div>

                            <div class="col-6 mb-3">
                                <label class="mb-2">Start Date <span class="text-danger">*</span></label>
                                <input type="date" id="StartDate" name="start_date" class="form-control" required
                                    placeholder="Start Date"
                                    @if (isset($events_edit)) value="{{ $events_edit->StartDate }}" @else value="{{ old('start_date') }}" @endif>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Start Time <span class="text-danger">*</span></label>
                                <input type="time" name="start_time" onfocus="clearError(this)"
                                    class="form-control vTimeStart" required placeholder="Start Time"
                                    @if (isset($events_edit)) value="{{ $events_edit->StartTime }}" @else value="{{ old('start_time') }}" @endif>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">End Date <span class="text-danger">*</span></label>
                                <input type="date" id="EndDate" name="end_date" class="form-control" required
                                    placeholder="End Date"
                                    @if (isset($events_edit)) value="{{ $events_edit->EndDate }}" @else value="{{ old('end_date') }}" @endif>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">End Time <span class="text-danger">*</span></label>
                                <input type="time" name="end_time" onfocus="clearError(this)"
                                    class="form-control vTimeEnd" required placeholder="End Time"
                                    @if (isset($events_edit)) value="{{ $events_edit->EndTime }}" @else value="{{ old('end_time') }}" @endif>
                            </div>
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Facility Contact <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" name="contact" required>
                                    <option disabled selected value="">Select Contact</option>
                                    @foreach ($facility_contacts as $contact)
                                        <option value="{{ $contact->id }}"
                                            @if (isset($events_edit)) {{ $events_edit->FacilityContactID == $contact->id ? 'selected' : '' }} @endif>
                                            {{ $contact->Firstname }} {{ $contact->Lastname }}
                                            ({{ $contact->PhoneMobil }})</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Facility Name <span class="text-danger">*</span></label>
                                <input type="text" name="facility_name" class="form-control" required
                                    placeholder="Facility Name"
                                    @if (isset($events_edit)) value="{{ $events_edit->FacilityName }}" @else value="{{ old('facility_name') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Facility Address <span class="text-danger">*</span></label>
                                <input type="text" name="facility_address" class="form-control" required
                                    placeholder="Facility Address"
                                    @if (isset($events_edit)) value="{{ $events_edit->FacilityAddress }}" @else value="{{ old('facility_address') }}" @endif>
                            </div>

                            <div class="form-group col-12 mb-3">
                                <label class="mb-2" for="inputState">Event Type <span class="text-danger">*</span></label>
                                <select id="inputState" name="event" required>
                                    <option disabled selected value="">Select Type</option>
                                    @foreach ($event_types as $event_type)
                                        <option value="{{ $event_type->id }}"
                                            @if (isset($events_edit)) {{ $events_edit->EventTypeID == $event_type->id ? 'selected' : '' }} @endif>
                                            {{ $event_type->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            {{-- <div class="col-6 mb-3">
                                <label class="mb-2">Is Active <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="is_active" id="is_active_yes"
                                            value="1" required
                                            @if (isset($events_edit)) {{ $events_edit->IsActive == 1 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="is_active_yes">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="is_active" id="is_active_no"
                                            value="0" required
                                            @if (isset($events_edit)) {{ $events_edit->IsActive == 0 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="is_active_no">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div> --}}



                            <div class="col-12 text-center">
                                <input type="submit" id="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($events_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
