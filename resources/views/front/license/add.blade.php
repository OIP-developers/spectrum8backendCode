@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">License @if (isset($license_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($license_edit)) action="{{ route('license.update') }}" @else action="{{ route('license.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($license_edit))
                            <input type="hidden" name="id" value="{{ $license_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="form-group col-12 mb-3">
                                <label class="mb-2" for="inputState">Organization <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" name="organization" required>
                                    <option disabled selected value="">Select Organization</option>
                                    @foreach ($organizations as $organization)
                                        <option value="{{ $organization->id }}"
                                            @if (isset($license_edit)) {{ $license_edit->OrganizationID == $organization->id ? 'selected' : '' }} @endif>
                                            {{ $organization->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-12 mb-3">
                                <label class="mb-2" for="inputState">License Type <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" class="license_type" name="license_type" required>
                                    <option disabled selected value="">Select License Type</option>
                                    @foreach ($license_types as $license_type)
                                        <option value="{{ $license_type->id }}"
                                            @if (isset($license_edit)) {{ $license_edit->LicenseTypeID == $license_type->id ? 'selected' : '' }} @endif>
                                            {{ $license_type->Name }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="col-12 mb-3">
                                <label class="mb-2">Start Date <span class="text-danger">*</span></label>
                                <input type="date" name="start_date" id="start-date"  class="form-control" required
                                    @if (isset($license_edit)) value="{{ $license_edit->StartDate }}" @else value="{{ old('start_date') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Expires <span class="text-danger">*</span></label>
                                <input type="date" name="expires" id="expiry-date" class="form-control" required
                                    @if (isset($license_edit)) value="{{ $license_edit->Expires }}" @else value="{{ old('expires') }}" @endif>
                            </div>

                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($license_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
