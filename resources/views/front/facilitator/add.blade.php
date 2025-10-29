@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Facilitator @if (isset($facilitator_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($facilitator_edit)) action="{{ route('facilitator.update') }}" @else action="{{ route('facilitator.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($facilitator_edit))
                            <input type="hidden" name="id" value="{{ $facilitator_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="organization">Organization <span
                                        class="text-danger">*</span></label>
                                <select name="organization" required id="organization" class="organization_for_events">
                                    <option disabled selected value="">Select Organization</option>
                                    @foreach ($organizations as $organization)
                                        <option value="{{ $organization->id }}"
                                            @if (isset($facilitator_edit)) {{ $facilitator_edit->OrganizationID == $organization->id ? 'selected' : '' }} @endif>
                                            {{ $organization->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            @if (isset($facilitator_edit) && count($events_facilitator) > 0)
                                @php
                                    $a = $events_facilitator;
                                    foreach ($a as $val) {
                                        $event_id[] = $val->EventID;
                                    }
                                    $data = $event_id;
                                    // dd($data);
                                @endphp
                                @foreach ($data as $item)
                                    <input type="hidden" value="{{ $item }}" class="event_id_edit">
                                @endforeach
                            @endif
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="organization">Events <span class="text-danger">*</span></label>
                                <div class="events_assign_area">
                                    <select class="js-example-basic-multiple" id="inputState" name="events[]"
                                        multiple="multiple">
                                        @if (isset($facilitator_edit) && count($events_facilitator) > 0)
                                            @php
                                                $a = $events_facilitator;
                                                foreach ($a as $val) {
                                                    $event_id[] = $val->EventID;
                                                }
                                                $data = $event_id;
                                                // dd($data);
                                            @endphp
                                        @endif
                                        {{-- @foreach ($events as $event)
                                    <option value="{{ $event->id }}"
                                        @if (isset($facilitator_edit) && count($events_facilitator) > 0) {{ in_array($event->id, $data) ? 'selected' : '' }} @endif>
                                        {{ $event->Name }}</option>
                                @endforeach --}}

                                    </select>
                                </div>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">First Name <span class="text-danger">*</span></label>
                                <input type="text" name="first_name" class="form-control" required
                                    placeholder="First Name"
                                    @if (isset($facilitator_edit)) value="{{ $facilitator_edit->Firstname }}" @else value="{{ old('first_name') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Last Name <span class="text-danger">*</span></label>
                                <input type="text" name="last_name" class="form-control" required placeholder="Last Name"
                                    @if (isset($facilitator_edit)) value="{{ $facilitator_edit->Lastname }}" @else value="{{ old('last_name') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Email <span class="text-danger">*</span></label>
                                <input type="email" name="email" class="form-control" required placeholder="Email"
                                    @if (isset($facilitator_edit)) value="{{ $facilitator_edit->Email }}" id="pointer_none" @else value="{{ old('email') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Manage Participants <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="manage_participants"
                                            id="ManageParticipants_yes" value="1" required
                                            @if (isset($facilitator_edit)) {{ $facilitator_edit->ManageParticipants == 1 ? 'checked' : '' }} disabled @endif>
                                        <label class="form-check-label" for="ManageParticipants_yes">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="manage_participants"
                                            id="ManageParticipants_no" value="0" required
                                            @if (isset($facilitator_edit)) {{ $facilitator_edit->ManageParticipants == 0 ? 'checked' : '' }} disabled @endif>
                                        <label class="form-check-label" for="ManageParticipants_no">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Show Video <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="show_video"
                                            id="show_video_yes" value="1" required
                                            @if (isset($facilitator_edit)) {{ $facilitator_edit->show_video == 1 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="show_video_yes">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="show_video"
                                            id="show_video_no" value="0" required
                                            @if (isset($facilitator_edit)) {{ $facilitator_edit->show_video == 0 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="show_video_no">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div>
                            {{-- <div class="col-12 mb-3">
                                <label class="mb-2">Is Active <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="is_active" id="is_active_yes"
                                            value="1" required
                                            @if (isset($facilitator_edit)) {{ $facilitator_edit->IsActive == 1 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="is_active_yes">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="is_active" id="is_active_no"
                                            value="0" required
                                            @if (isset($facilitator_edit)) {{ $facilitator_edit->IsActive == 0 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="is_active_no">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div> --}}
                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($facilitator_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>

@endsection
