@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Participant @if (isset($participant_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($participant_edit)) action="{{ route('participant.update') }}" @else action="{{ route('participant.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($participant_edit))
                            <input type="hidden" name="id" value="{{ $participant_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="col-6 mb-3">
                                <label class="mb-2">First Name <span class="text-danger">*</span></label>
                                <input type="text" name="first_name" class="form-control" required
                                    placeholder="First Name"
                                    @if (isset($participant_edit)) value="{{ $participant_edit->Firstname }}" @else value="{{ old('first_name') }}" @endif>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Last Name <span class="text-danger">*</span></label>
                                <input type="text" name="last_name" class="form-control" required placeholder="Last Name"
                                    @if (isset($participant_edit)) value="{{ $participant_edit->Lastname }}" @else value="{{ old('last_name') }}" @endif>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Age <span class="text-danger">*</span></label>
                                <input type="number" min="0" name="age" class="form-control" required
                                    placeholder="Age"
                                    @if (isset($participant_edit)) value="{{ $participant_edit->Age }}" @else value="{{ old('age') }}" @endif>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Jersy Number <span class="text-danger">*</span></label>
                                <input type="text" name="jersyNumber" class="form-control" required
                                    placeholder="Jersy Number"
                                    @if (isset($participant_edit)) value="{{ $participant_edit->JerseyNumber }}" @else value="{{ old('jersyNumber') }}" @endif>
                            </div>
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Gender <span class="text-danger">*</span></label>
                                <select id="inputState" name="gender" class="gender" required>
                                    <option disabled selected value="">Select Gender</option>
                                    @foreach ($genders as $gender)
                                        <option value="{{ $gender->id }}"
                                            @if (isset($participant_edit)) {{ $participant_edit->GenderID == $gender->id ? 'selected' : '' }} @endif>
                                            {{ $gender->Gender }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Grade <span class="text-danger">*</span></label>
                                <select id="inputState" name="grade" class="grade_dd" required>
                                    <option disabled selected value="">Select Grade</option>
                                    @foreach ($grades as $grade)
                                        <option value="{{ $grade->id }}"
                                            @if (isset($participant_edit)) {{ $participant_edit->GradeID == $grade->id ? 'selected' : '' }} @endif>
                                            {{ $grade->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Organization <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" name="organization" required class="organization_assign">
                                    <option disabled selected value="">Select Organization</option>
                                    @foreach ($organizations as $organization)
                                        <option value="{{ $organization->id }}"
                                            @if (isset($participant_edit)) {{ $participant_edit->OrganizationID == $organization->id ? 'selected' : '' }} @endif>
                                            {{ $organization->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            @if (isset($participant_edit))
                                <input type="hidden" class="get_facilitator_val"
                                    value="{{ $participant_edit->FacilitatorID }} ">
                            @endif
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Facilitator <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" name="facilitator" required class="facilitator_area_participant">
                                    <option disabled selected value="">Select Facilitator</option>
                                    {{-- @foreach ($facilitators as $facilitator)
                                        <option value="{{ $facilitator->id }}"
                                            @if (isset($participant_edit)) {{ $participant_edit->FacilitatorID == $facilitator->id ? 'selected' : '' }} @endif>
                                            {{ $facilitator->Firstname }} {{ $facilitator->Lastname }}</option>
                                    @endforeach --}}
                                </select>
                            </div>
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Class <span class="text-danger">*</span></label>
                                <select id="inputState" name="class" required>
                                    <option disabled selected value="">Select Class</option>
                                    @foreach ($classes as $class)
                                        <option value="{{ $class->id }}"
                                            @if (isset($participant_edit)) {{ $participant_edit->ClassID == $class->id ? 'selected' : '' }} @endif>
                                            {{ $class->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Participant Type <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" name="participant_type" required>
                                    <option disabled selected value="">Select Type</option>
                                    @foreach ($participant_types as $participant_type)
                                        <option value="{{ $participant_type->id }}"
                                            @if (isset($participant_edit)) {{ $participant_edit->ParticipantTypeID == $participant_type->id ? 'selected' : '' }} @endif>
                                            {{ $participant_type->Classification }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Jersy Color <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" name="jersyColor" class="grade_dd" required>
                                    <option disabled selected value="">Select Color</option>
                                    @foreach ($colors as $color)
                                        <option value="{{ $color->id }}"
                                            @if (isset($participant_edit)) {{ $participant_edit->JerseyColorID == $color->id ? 'selected' : '' }} @endif>
                                            {{ $color->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            {{-- <div class="col-6 mb-3">
                                <label class="mb-2">Is Facilitator <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="is_facilitator"
                                            id="is_facilitator_yes" value="1" required
                                            @if (isset($participant_edit)) {{ $participant_edit->IsActive == 1 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="is_facilitator_yes">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="is_facilitator"
                                            id="is_facilitator_no" value="0" required
                                            @if (isset($participant_edit)) {{ $participant_edit->IsActive == 0 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="is_facilitator_no">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div> --}}
                            {{-- <div class="col-6 mb-3">
                                <label class="mb-2">Is Active <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="is_active"
                                            id="is_active_yes" value="1" required
                                            @if (isset($participant_edit)) {{ $participant_edit->IsActive == 1 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="is_active_yes">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="is_active"
                                            id="is_active_no" value="0" required
                                            @if (isset($participant_edit)) {{ $participant_edit->IsActive == 0 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="is_active_no">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div> --}}

                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($participant_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
{{-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> --}}
{{-- @if (isset($participant_edit))
<script>
    $(document).ready(function(){
        var group_val = $('.get_grade_val').val();
        var a = $('.toggle_area select option[value="'+group_val+'"]').attr('selected',true);
        console.log(a)
    });
</script>
    @endif --}}
