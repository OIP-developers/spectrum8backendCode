@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Group @if (isset($groups_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($groups_edit)) action="{{ route('group.update') }}" @else action="{{ route('group.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($groups_edit))
                            <input type="hidden" name="id" value="{{ $groups_edit->id }}">
                        @endif
                        {{-- @foreach ($grades as $grade)
                        @php
                        $exp = explode('|',$groups_edit->grade_id);
                        dd($exp);
                        @endphp
                        @endforeach --}}
                        <div class="row">
                            {{-- <div class="col-12 mb-3">
                                <label class="mb-2">Grade</label>
                                <div class="d-flex">
                                    @foreach ($grades as $grade)
                                    <div class="form-check me-2">
                                        <input class="form-check-input" type="checkbox" name="grade[]" id="exampleRadios{{ $grade->id }}"
                                            value="{{ $grade->id }}"
                                            @if (isset($groups_edit)) {{ $groups_edit->grade_id == $grade->id ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="exampleRadios{{ $grade->id }}">
                                            {{ $grade->Name }}
                                        </label>
                                    </div>
                                    @endforeach

                                </div>
                            </div> --}}

                            {{-- <div class="form-group col-12 mb-3">
                                <label class="mb-2" for="inputState">Grade</label>
                                @if (isset($groups_edit))
                                    @php
                                        $a = explode(',', $groups_edit->grade_id);
                                    @endphp
                                @endif

                                <select class="js-example-basic-multiple" id="inputState" name="grade[]" multiple="multiple"
                                    required>
                                    @foreach ($grades as $grade)
                                        <option value="{{ $grade->id }}"
                                            @if (isset($groups_edit)) {{ in_array($grade->id, $a) ? 'selected' : '' }} @endif>
                                            {{ $grade->Name }}</option>
                                    @endforeach
                                </select>

                            </div> --}}
                            <div class="col-6 mb-3">
                                <label class="mb-2">Group Name <span class="text-danger">*</span></label>
                                <input type="text" name="name" class="form-control" required placeholder="Group Name"
                                    @if (isset($groups_edit)) value="{{ $groups_edit->Name }}" @else value="{{ old('name') }}" @endif>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="mb-2">Group Abbreviation <span class="text-danger">*</span></label>
                                <input type="text" name="abbr" class="form-control" required placeholder="Group Abbr"
                                    @if (isset($groups_edit)) value="{{ $groups_edit->Abbr }}" @else value="{{ old('abbr') }}" @endif>
                            </div>

                            {{-- <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Organization <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" name="organization[]" required
                                    class="organization_assign_group select_all_check" multiple="multiple">
                                    <option value="all">Select All</option>
                                    @foreach ($organizations as $organization)
                                        <option value="{{ $organization->id }}"
                                            @if (isset($groups_edit) && count($groups_edit->group_organization) > 0) {{ in_array($organization->id, $organization_data) ? 'selected' : '' }} @endif>
                                            {{ $organization->Name }} </option>
                                    @endforeach
                                </select>
                            </div> --}}
                            {{-- @if (isset($groups_edit))
                                @foreach ($facilitator_data as $item)
                                    <input type="hidden" value="{{ $item }}"
                                        class="facilitator_id_edit_for_group">
                                @endforeach
                            @endif --}}
                            {{-- <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Facilitator <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" name="facilitator[]" required
                                    class="facilitator_area_group select_all_check" multiple="multiple">
                                    <option value="all">Select All</option>
                                    @foreach ($facilitators as $facilitator)
                                        <option value="{{ $facilitator->id }}"
                                            @if (isset($groups_edit)) {{ $groups_edit->FacilitatorID == $facilitator->id ? 'selected' : '' }} @endif>
                                            {{ $facilitator->Firstname }} - {{ $facilitator->Lastname }}</option>
                                    @endforeach
                                </select>
                            </div> --}}
                            {{-- <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Facilitators <span class="text-danger">*</span></label>
                                <select id="inputState" name="facilitator" required>
                                    <option disabled selected value="">Select Facilitators</option>
                                    @foreach ($facilitators as $facilitator)
                                        <option value="{{ $facilitator->id }}"
                                            @if (isset($group_facilitator_edit)) {{ $group_facilitator_edit->FacilitatorID == $facilitator->id ? 'selected' : '' }} @endif>
                                            {{ $facilitator->Firstname }} {{ $facilitator->Lastname }} </option>
                                    @endforeach
                                </select>
                            </div> --}}
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Gender <span class="text-danger">*</span></label>
                                <select id="inputState" name="gender[]" required multiple="multiple"
                                    class="select_all_check">
                                    <option value="all">Select All</option>
                                    @foreach ($genders as $gender)
                                        <option value="{{ $gender->id }}"
                                            @if (isset($groups_edit) && count($groups_edit->group_gender) > 0) {{ in_array($gender->id, $gender_data) ? 'selected' : '' }} @endif>
                                            {{ $gender->Gender }} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Grade <span class="text-danger">*</span></label>
                                <select id="inputState" name="grade[]" required multiple="multiple"
                                    class="select_all_check">
                                    <option value="all">Select All</option>
                                    @foreach ($grades as $grade)
                                        <option value="{{ $grade->id }}"
                                            @if (isset($groups_edit) && count($groups_edit->group_grade) > 0) {{ in_array($grade->id, $grade_data) ? 'selected' : '' }} @endif>
                                            {{ $grade->Name }} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Class <span class="text-danger">*</span></label>
                                <select id="inputState" name="class[]" required multiple="multiple"
                                    class="select_all_check">
                                    <option value="all">Select All</option>
                                    {{-- <option value="not" {{ isset($group_edit) && count($groups_edit->group_class) == 0 ? 'selected' : '' }}>Not
                                        Used</option> --}}
                                    @foreach ($classes as $class)
                                        <option value="{{ $class->id }}"
                                            @if (isset($groups_edit) && count($groups_edit->group_class) > 0) {{ in_array($class->id, $class_data) ? 'selected' : '' }} @endif>
                                            {{ $class->Name }} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($groups_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
