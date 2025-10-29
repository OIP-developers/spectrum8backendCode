@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Organization @if (isset($organization_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($organization_edit)) action="{{ route('organization.update') }}" @else action="{{ route('organization.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($organization_edit))
                            <input type="hidden" name="id" value="{{ $organization_edit->id }}">
                        @endif
                        {{-- @dd($organization_edit) --}}
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label class="mb-2">Organization Type <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input organization" type="radio" name="type"
                                            {{ isset($organization_edit) && $organization_edit->ParentOrganizationID == null ? 'checked' : '' }}
                                            required id="exampleRadios1" value="parent">
                                        <label class="form-check-label" for="exampleRadios1">
                                            Parent
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input organization" type="radio" name="type"
                                            {{ isset($organization_edit) && $organization_edit->ParentOrganizationID != null ? 'checked' : '' }}
                                            required id="exampleRadios2" value="sub">
                                        <label class="form-check-label" for="exampleRadios2">
                                            Sub
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group col-12 mb-3 organization_area">
                                <label class="mb-2" for="organiztion">Organization <span
                                        class="text-danger">*</span></label>
                                <select name="parent_organization_id" id="organiztion">
                                    <option disabled selected value="">Select Organization</option>
                                    @foreach ($organizations as $organization)
                                        <option value="{{ $organization->id }}"
                                            @if (isset($organization_edit)) {{ $organization_edit->ParentOrganizationID == $organization->id ? 'selected' : '' }} @endif>
                                            {{ $organization->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Organization Type <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" name="organization_type" required>
                                    <option value="" selected disabled>Select Type</option>
                                    @foreach ($organization_type as $organization_type_item)
                                        <option value="{{ $organization_type_item->id }}"
                                            @if (isset($organization_edit)) {{ $organization_edit->OrganizationTypeID == $organization_type_item->id ? 'selected' : '' }} @endif>
                                            {{ $organization_type_item->Classification }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="organization">Events <span class="text-danger">*</span></label>
                                <select class="js-example-basic-multiple" id="inputState" name="events[]"
                                    multiple="multiple">
                                    @if (isset($organization_edit) && count($events_organization) > 0)
                                        @php
                                            $a = $events_organization;
                                            foreach ($a as $val) {
                                                $event_id[] = $val->EventID;
                                            }
                                            $data = $event_id;
                                        @endphp
                                    @endif
                                    @foreach ($events as $event)
                                        <option value="{{ $event->id }}"
                                            @if (isset($organization_edit) && count($events_organization) > 0) {{ in_array($event->id, $data) ? 'selected' : '' }} @endif>
                                            {{ $event->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Organization Name <span class="text-danger">*</span></label>
                                <input type="text" name="org_name" class="form-control" required placeholder="Name"
                                    @if (isset($organization_edit)) value="{{ $organization_edit->Name }}" @else value="{{ old('org_name') }}" @endif>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Organization Abbreviation <span class="text-danger">*</span></label>
                                <input type="text" name="org_abbr" class="form-control" required
                                    placeholder="Abbreviation"
                                    @if (isset($organization_edit)) value="{{ $organization_edit->Abbr }}" @else value="{{ old('org_abbr') }}" @endif>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Organization Email <span class="text-danger">*</span></label>
                                <input type="email" name="OrgEmail" class="form-control" required placeholder="Email"
                                    @if (isset($organization_edit)) value="{{ $organization_edit->OrgEmail }}" @else value="{{ old('OrgEmail') }}" @endif>
                            </div>
                            {{-- @if (isset($organization_edit))
                            @else
                                <div class="col-6 mb-3">
                                    <label class="mb-2">Password <span class="text-danger">*</span></label>
                                    <input type="password" name="org_password" class="form-control" required
                                        placeholder="Password" @if (isset($organization_edit)) value="" @endif>
                                </div>
                            @endif --}}
                            <div class="col-6 mb-3">
                                <label class="mb-2">State <span class="text-danger">*</span></label>
                                <input type="text" name="org_state" class="form-control" required placeholder="State"
                                    @if (isset($organization_edit)) value="{{ $organization_edit->StateProvince }}" @else value="{{ old('org_state') }}" @endif>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">City <span class="text-danger">*</span></label>
                                <input type="text" name="org_city" class="form-control" required placeholder="City"
                                    @if (isset($organization_edit)) value="{{ $organization_edit->City }}" @else value="{{ old('org_city') }}" @endif>
                            </div>
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Primary Contact <span
                                        class="text-danger">*</span></label>
                                <input type="number" name="primary_contact" class="form-control" required
                                    placeholder="Primary Contact"
                                    @if (isset($organization_edit)) value="{{ $organization_edit->PrimaryContactID }}" @else value="{{ old('primary_contact') }}" @endif>

                                {{-- <select id="inputState" name="primary_contact" required>
                                    <option value="" selected disabled>Select Assessment</option>
                                    @foreach ($contact as $contact_item)
                                        <option value="{{ $contact_item->id }}"
                                            @if (isset($organization_edit)) {{ $organization_edit->PrimaryContactID == $contact_item->id ? 'selected' : '' }} @endif>
                                            {{ $contact_item->Firstname }} {{ $contact_item->Lasstname }}</option>
                                    @endforeach
                                </select> --}}
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Postal Code <span class="text-danger">*</span></label>
                                <input type="number" name="org_postal_code" class="form-control" required
                                    placeholder="Postal Code"
                                    @if (isset($organization_edit)) value="{{ $organization_edit->PostalCode }}" @else value="{{ old('org_postal_code') }}" @endif>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Address <span class="text-danger">*</span></label>
                                <input type="text" name="org_address" class="form-control" required
                                    placeholder="Address"
                                    @if (isset($organization_edit)) value="{{ $organization_edit->Address }}" @else value="{{ old('org_address') }}" @endif>
                            </div>


                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($organization_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
{{-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> --}}
{{-- @if (isset($organization_edit))
<script>
    $(document).ready(function(){
        var group_val = $('.get_grade_val').val();
        var a = $('.toggle_area select option[value="'+group_val+'"]').attr('selected',true);
        console.log(a)
    });
</script>
    @endif --}}
