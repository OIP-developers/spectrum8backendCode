@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Participant Email @if (isset($participant_email_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($participant_email_edit)) action="{{ route('participant_email.update') }}" @else action="{{ route('participant_email.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($participant_email_edit))
                            <input type="hidden" name="id" value="{{ $participant_email_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Participant <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" name="participant" required>
                                    <option disabled selected value="">Select Participant</option>
                                    @foreach ($participants as $participant)
                                        <option value="{{ $participant->id }}"
                                            @if (isset($participant_email_edit)) {{ $participant_email_edit->ParticipantID == $participant->id ? 'selected' : '' }} @endif>
                                            {{ $participant->Firstname }} {{ $participant->Lastname }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Email Type <span class="text-danger">*</span></label>
                                <select id="inputState" name="email_type" required>
                                    <option disabled selected value="">Select Type</option>
                                    @foreach ($email_types as $email_type)
                                        <option value="{{ $email_type->id }}"
                                            @if (isset($participant_email_edit)) {{ $participant_email_edit->EmailTypeID == $email_type->id ? 'selected' : '' }} @endif>
                                            {{ $email_type->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Email <span class="text-danger">*</span></label>
                                <input type="email" name="email" class="form-control" required placeholder="Email"
                                    @if (isset($participant_email_edit)) value="{{ $participant_email_edit->Email }}" @else value="{{ old('email') }}" @endif>
                            </div>


                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($participant_email_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
