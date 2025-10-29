@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Role @if (isset($role_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($role_edit)) action="{{ route('role.update') }}" @else action="{{ route('role.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($role_edit))
                            <input type="hidden" name="id" value="{{ $role_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label class="mb-2">Role Name <span class="text-danger">*</span></label>
                                <input type="text" name="role_name" class="form-control" required placeholder="Role Name"
                                    @if (isset($role_edit)) value="{{ $role_edit->RoleName }}" @else value="{{ old('role_name') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <h6>Select Permissions <span class="text-danger">*</span></h6>
                                {{-- <label class="mb-2">Select Permissions <span class="text-danger">*</span></label> --}}
                                <hr>
                                <div class="permissions_section_main">
                                    <div class="permissions_section_sub">
                                        <label class="mb-2">Users <span class="text-danger">*</span></label>
                                        <div class="d-flex justify-content-evenly">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="user_create" value="user_create"
                                                    @if (isset($role_edit)) {{ in_array('user_create', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="user_create">
                                                    Create
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="user_read" value="user_read"
                                                    @if (isset($role_edit)) {{ in_array('user_read', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="user_read">
                                                    Read
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="user_update" value="user_update"
                                                    @if (isset($role_edit)) {{ in_array('user_update', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="user_update">
                                                    Update
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="user_delete" value="user_delete"
                                                    @if (isset($role_edit)) {{ in_array('user_delete', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="user_delete">
                                                    Delete
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="user_archive" value="user_archive"
                                                    @if (isset($role_edit)) {{ in_array('user_archive', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="user_archive">
                                                    Archive
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="permissions_section_sub">
                                        <label class="mb-2">License <span
                                                class="text-danger">*</span></label>
                                        <div class="d-flex justify-content-evenly">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="license_create" value="license_create"
                                                    @if (isset($role_edit)) {{ in_array('license_create', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="license_create">
                                                    Create
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="license_read" value="license_read"
                                                    @if (isset($role_edit)) {{ in_array('license_read', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="license_read">
                                                    Read
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="license_update" value="license_update"
                                                    @if (isset($role_edit)) {{ in_array('license_update', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="license_update">
                                                    Update
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="license_delete" value="license_delete"
                                                    @if (isset($role_edit)) {{ in_array('license_delete', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="license_delete">
                                                    Delete
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="license_archive" value="license_archive"
                                                    @if (isset($role_edit)) {{ in_array('license_archive', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="license_archive">
                                                    Archive
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="permissions_section_sub">
                                        <label class="mb-2">Lookups <span class="text-danger">*</span></label>
                                        <div class="d-flex justify-content-evenly">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="lookup_create" value="lookup_create"
                                                    @if (isset($role_edit)) {{ in_array('lookup_create', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="lookup_create">
                                                    Create
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="lookup_read" value="lookup_read"
                                                    @if (isset($role_edit)) {{ in_array('lookup_read', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="lookup_read">
                                                    Read
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="lookup_update" value="lookup_update"
                                                    @if (isset($role_edit)) {{ in_array('lookup_update', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="lookup_update">
                                                    Update
                                                </label>
                                            </div>
                                            {{-- <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="lookup_delete" value="lookup_delete"
                                                    @if (isset($role_edit)) {{ in_array('lookup_delete', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="lookup_delete">
                                                    Delete
                                                </label>
                                            </div> --}}
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="lookup_archive" value="lookup_archive"
                                                    @if (isset($role_edit)) {{ in_array('lookup_archive', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="lookup_archive">
                                                    Archive
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="permissions_section_sub">
                                        <label class="mb-2">Organizations <span class="text-danger">*</span></label>
                                        <div class="d-flex justify-content-evenly">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="organization_create" value="organization_create"
                                                    @if (isset($role_edit)) {{ in_array('organization_create', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="organization_create">
                                                    Create
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="organization_read" value="organization_read"
                                                    @if (isset($role_edit)) {{ in_array('organization_read', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="organization_read">
                                                    Read
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="organization_update" value="organization_update"
                                                    @if (isset($role_edit)) {{ in_array('organization_update', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="organization_update">
                                                    Update
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="organization_delete" value="organization_delete"
                                                    @if (isset($role_edit)) {{ in_array('organization_delete', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="organization_delete">
                                                    Delete
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="organization_archive" value="organization_archive"
                                                    @if (isset($role_edit)) {{ in_array('organization_archive', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="organization_archive">
                                                    Archive
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="permissions_section_sub">
                                        <label class="mb-2">Facilitators <span class="text-danger">*</span></label>
                                        <div class="d-flex justify-content-evenly">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="facilitator_create" value="facilitator_create"
                                                    @if (isset($role_edit)) {{ in_array('facilitator_create', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="facilitator_create">
                                                    Create
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="facilitator_read" value="facilitator_read"
                                                    @if (isset($role_edit)) {{ in_array('facilitator_read', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="facilitator_read">
                                                    Read
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="facilitator_update" value="facilitator_update"
                                                    @if (isset($role_edit)) {{ in_array('facilitator_update', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="facilitator_update">
                                                    Update
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="facilitator_delete" value="facilitator_delete"
                                                    @if (isset($role_edit)) {{ in_array('facilitator_delete', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="facilitator_delete">
                                                    Delete
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="facilitator_archive" value="facilitator_archive"
                                                    @if (isset($role_edit)) {{ in_array('facilitator_archive', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="facilitator_archive">
                                                    Archive
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="permissions_section_sub">
                                        <label class="mb-2">Participants <span class="text-danger">*</span></label>
                                        <div class="d-flex justify-content-evenly">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="participant_create" value="participant_create"
                                                    @if (isset($role_edit)) {{ in_array('participant_create', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="participant_create">
                                                    Create
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="participant_read" value="participant_read"
                                                    @if (isset($role_edit)) {{ in_array('participant_read', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="participant_read">
                                                    Read
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="participant_update" value="participant_update"
                                                    @if (isset($role_edit)) {{ in_array('participant_update', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="participant_update">
                                                    Update
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="participant_delete" value="participant_delete"
                                                    @if (isset($role_edit)) {{ in_array('participant_delete', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="participant_delete">
                                                    Delete
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="participant_archive" value="participant_archive"
                                                    @if (isset($role_edit)) {{ in_array('participant_archive', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="participant_archive">
                                                    Archive
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="permissions_section_sub">
                                        <label class="mb-2">Groups <span class="text-danger">*</span></label>
                                        <div class="d-flex justify-content-evenly">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="group_create" value="group_create"
                                                    @if (isset($role_edit)) {{ in_array('group_create', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="group_create">
                                                    Create
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="group_read" value="group_read"
                                                    @if (isset($role_edit)) {{ in_array('group_read', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="group_read">
                                                    Read
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="group_update" value="group_update"
                                                    @if (isset($role_edit)) {{ in_array('group_update', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="group_update">
                                                    Update
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="group_delete" value="group_delete"
                                                    @if (isset($role_edit)) {{ in_array('group_delete', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="group_delete">
                                                    Delete
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="group_archive" value="group_archive"
                                                    @if (isset($role_edit)) {{ in_array('group_archive', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="group_archive">
                                                    Archive
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="permissions_section_sub">
                                        <label class="mb-2">Events <span class="text-danger">*</span></label>
                                        <div class="d-flex justify-content-evenly">
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="event_create" value="event_create"
                                                    @if (isset($role_edit)) {{ in_array('event_create', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="event_create">
                                                    Create
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="event_read" value="event_read"
                                                    @if (isset($role_edit)) {{ in_array('event_read', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="event_read">
                                                    Read
                                                </label>
                                            </div>
                                            <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="event_update" value="event_update"
                                                    @if (isset($role_edit)) {{ in_array('event_update', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="event_update">
                                                    Update
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="event_delete" value="event_delete"
                                                    @if (isset($role_edit)) {{ in_array('event_delete', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="event_delete">
                                                    Delete
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="event_archive" value="event_archive"
                                                    @if (isset($role_edit)) {{ in_array('event_archive', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="event_archive">
                                                    Archive
                                                </label>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="permissions_section_sub">
                                        <label class="mb-2">Assessment Results <span
                                                class="text-danger">*</span></label>
                                        <div class="d-flex justify-content-evenly">
                                            {{-- <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="assessment_result_create" value="assessment_result_create"
                                                    @if (isset($role_edit)) {{ in_array('assessment_result_create', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="assessment_result_create">
                                                    Create
                                                </label>
                                            </div> --}}
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="assessment_result_read" value="assessment_result_read"
                                                    @if (isset($role_edit)) {{ in_array('assessment_result_read', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="assessment_result_read">
                                                    Read
                                                </label>
                                            </div>
                                            {{-- <div class="form-check">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="assessment_result_update" value="assessment_result_update"
                                                    @if (isset($role_edit)) {{ in_array('assessment_result_update', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="assessment_result_update">
                                                    Update
                                                </label>
                                            </div> --}}
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="assessment_result_delete" value="assessment_result_delete"
                                                    @if (isset($role_edit)) {{ in_array('assessment_result_delete', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="assessment_result_delete">
                                                    Delete
                                                </label>
                                            </div>
                                            <div class="form-check ms-3">
                                                <input class="form-check-input" type="checkbox" name="permissions[]"
                                                    id="assessment_result_archive" value="assessment_result_archive"
                                                    @if (isset($role_edit)) {{ in_array('assessment_result_archive', $role_edit->Permission) ? 'checked' : '' }} @endif>
                                                <label class="form-check-label" for="assessment_result_archive">
                                                    Archive
                                                </label>
                                            </div>
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($role_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
