@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">License Type @if (isset($license_type_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($license_type_edit)) action="{{ route('license_type.update') }}" @else action="{{ route('license_type.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($license_type_edit))
                            <input type="hidden" name="id" value="{{ $license_type_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label class="mb-2">Name <span class="text-danger">*</span></label>
                                <input type="text" name="name" class="form-control" required placeholder="Name"
                                    @if (isset($license_type_edit)) value="{{ $license_type_edit->Name }}" @else value="{{ old('name') }}" @endif>
                            </div>

                            <div class="col-12 mb-3">
                                <label class="mb-2">Facilitators <span class="text-danger">*</span></label>
                                <input type="number" name="facilitators" class="form-control" required
                                    placeholder="Facilitators"
                                    @if (isset($license_type_edit)) value="{{ $license_type_edit->Facilitators }}" @else value="{{ old('facilitators') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Participants <span class="text-danger">*</span></label>
                                <input type="number" name="participants" class="form-control" required
                                    placeholder="Participants"
                                    @if (isset($license_type_edit)) value="{{ $license_type_edit->Participants }}" @else value="{{ old('participants') }}" @endif>
                            </div>
                            {{-- <div class="col-12 mb-3">
                                <label class="mb-2">Duration Days <span class="text-danger">*</span></label>
                                <input type="number" name="durationDays" class="form-control" required
                                    placeholder="DurationDays"
                                    @if (isset($license_type_edit)) value="{{ $license_type_edit->DurationDays }}" @else value="{{ old('durationDays') }}" @endif>
                            </div> --}}
                            <div class="col-12 mb-3">
                                <label class="mb-2">Number of Devices <span class="text-danger">*</span></label>
                                <input type="number" name="number_of_devices_login" class="form-control" required
                                    placeholder="Number of Devices"
                                    @if (isset($license_type_edit)) value="{{ $license_type_edit->number_of_devices_login }}" @else value="{{ old('number_of_devices_login') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Subscription <span class="text-danger">*</span></label>
                                <div class="d-flex">
                                    <div class="form-check">
                                        <input class="form-check-input" type="radio" name="subscription"
                                            id="subscription_yes" value="1" required
                                            @if (isset($license_type_edit)) {{ $license_type_edit->Subscription == 1 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="subscription_yes">
                                            Yes
                                        </label>
                                    </div>
                                    <div class="form-check ms-3">
                                        <input class="form-check-input" type="radio" name="subscription"
                                            id="subscription_no" value="0" required
                                            @if (isset($license_type_edit)) {{ $license_type_edit->Subscription == 0 ? 'checked' : '' }} @endif>
                                        <label class="form-check-label" for="subscription_no">
                                            No
                                        </label>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($license_type_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
