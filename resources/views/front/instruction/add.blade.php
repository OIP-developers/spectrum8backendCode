@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Instruction @if (isset($instruction_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($instruction_edit)) action="{{ route('instruction.update') }}" @else action="{{ route('instruction.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($instruction_edit))
                            <input type="hidden" name="id" value="{{ $instruction_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="form-group col-12 mb-3">
                                <label class="mb-2" for="inputState">Assessment</label>
                                <select id="inputState" name="assessment">
                                    <option disabled selected>Select Assessment</option>
                                    @foreach ($assessments as $assessment)
                                        <option value="{{ $assessment->id }}"
                                            @if (isset($instruction_edit)) {{ $instruction_edit->assessment_id == $assessment->id ? 'selected' : '' }} @endif>
                                            {{ $assessment->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Instruction</label>
                                <textarea name="instruction" id="" cols="30" rows="2" class="form-control">
@if (isset($instruction_edit))
{{ $instruction_edit->instructions }} @else{{ old('instruction') }}
@endif
</textarea>
                            </div>

                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($instruction_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
