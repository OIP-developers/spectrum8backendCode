@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Contact @if (isset($contact_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($contact_edit)) action="{{ route('contact.update') }}" @else action="{{ route('contact.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($contact_edit))
                            <input type="hidden" name="id" value="{{ $contact_edit->id }}">
                        @endif
                        <div class="row">

                            <div class="form-group col-4 mb-3">
                                <label class="mb-2" for="inputState">Contact Type <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" name="contact" required>
                                    <option disabled selected value="">Select Type</option>
                                    @foreach ($contact_types as $contact_type)
                                        <option value="{{ $contact_type->id }}"
                                            @if (isset($contact_edit)) {{ $contact_edit->ContactTypeID == $contact_type->id ? 'selected' : '' }} @endif>
                                            {{ $contact_type->Classification }} </option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="form-group col-4 mb-3">
                                <label class="mb-2" for="inputState">Organization <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" name="organization" class="organization_assign" required>
                                    <option disabled selected value="">Select Organization</option>
                                    @foreach ($organizations as $organization)
                                        <option value="{{ $organization->id }}"
                                            @if (isset($contact_edit)) {{ $contact_edit->OrganizationID == $organization->id ? 'selected' : '' }} @endif>
                                            {{ $organization->Name }} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-4 mb-3">
                                <label class="mb-2" for="inputState">Facilitators <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" name="facilitator" required class="facilitator_area_participant">
                                    <option disabled selected value="">Select Facilitator</option>
                                    {{-- @foreach ($facilitators as $facilitator)
                                        <option value="{{ $facilitator->id }}"
                                            @if (isset($contact_edit)) {{ $contact_edit->FacilitatorID == $facilitator->id ? 'selected' : '' }} @endif>
                                            {{ $facilitator->Firstname }} {{ $facilitator->Lastname }} </option>
                                    @endforeach --}}
                                </select>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">First Name <span class="text-danger">*</span></label>
                                <input type="text" name="first_name" class="form-control" required
                                    placeholder="First Name"
                                    @if (isset($contact_edit)) value="{{ $contact_edit->Firstname }}" @else value="{{ old('first_name') }}" @endif>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Last Name <span class="text-danger">*</span></label>
                                <input type="text" name="last_name" class="form-control" required placeholder="Last Name"
                                    @if (isset($contact_edit)) value="{{ $contact_edit->Lastname }}" @else value="{{ old('last_name') }}" @endif>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Phone Work <span class="text-danger">*</span></label>
                                <input type="text" name="phone_work" class="form-control" required
                                    placeholder="Phone Work"
                                    @if (isset($contact_edit)) value="{{ $contact_edit->PhoneWork }}" @else value="{{ old('phone_work') }}" @endif>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Can Text Work <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="can_text_work"
                                            id="CanTextWork_yes" value="1" required
                                            @if (isset($contact_edit)) {{ $contact_edit->CanTextWork == 1 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="CanTextWork_yes">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="can_text_work"
                                            id="CanTextWork_no" value="0" required
                                            @if (isset($contact_edit)) {{ $contact_edit->CanTextWork == 0 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="CanTextWork_no">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Phone Mobile <span class="text-danger">*</span></label>
                                <input type="text" name="phone_mobile" class="form-control" required
                                    placeholder="Phone Mobile"
                                    @if (isset($contact_edit)) value="{{ $contact_edit->PhoneMobil }}" @else value="{{ old('phone_mobile') }}" @endif>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Can Text Mobile <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="can_text_mobile"
                                            id="CanTextMobil_yes" value="1" required
                                            @if (isset($contact_edit)) {{ $contact_edit->CanTextMobil == 1 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="CanTextMobil_yes">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="can_text_mobile"
                                            id="CanTextMobil_no" value="0" required
                                            @if (isset($contact_edit)) {{ $contact_edit->CanTextMobil == 0 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="CanTextMobil_no">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Address <span class="text-danger">*</span></label>
                                <input type="text" name="address" class="form-control" required placeholder="Address"
                                    @if (isset($contact_edit)) value="{{ $contact_edit->Address }}" @else value="{{ old('address') }}" @endif>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Email <span class="text-danger">*</span></label>
                                <input type="email" name="email" class="form-control" required placeholder="Email"
                                    @if (isset($contact_edit)) value="{{ $contact_edit->Email }}" @else value="{{ old('email') }}" @endif>
                            </div>
                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($contact_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
