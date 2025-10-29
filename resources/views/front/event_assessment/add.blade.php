@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Event Assessment @if (isset($event_assessment_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($event_assessment_edit)) action="{{ route('event_assessment.update') }}" @else action="{{ route('event_assessment.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($event_assessment_edit))
                            <input type="hidden" name="id" value="{{ $event_assessment_edit->id }}">
                        @endif
                        <div class="row">

                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Event <span class="text-danger">*</span></label>
                                <select id="inputState" name="event" required>
                                    <option disabled selected value="">Select Event</option>
                                    @foreach ($events as $event)
                                        <option value="{{ $event->id }}"
                                            @if (isset($event_assessment_edit)) {{ $event_assessment_edit->EventID == $event->id ? 'selected' : '' }} @endif>
                                            {{ $event->Name }} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Assessment <span class="text-danger">*</span></label>
                                <select id="inputState" name="assessment" required>
                                    <option disabled selected value="">Select Assessment</option>
                                    @foreach ($assessments as $assessment)
                                        <option value="{{ $assessment->id }}"
                                            @if (isset($event_assessment_edit)) {{ $event_assessment_edit->AssessmentID == $assessment->id ? 'selected' : '' }} @endif>
                                            {{ $assessment->Name }} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($event_assessment_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
