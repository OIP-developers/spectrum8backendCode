@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Assign Participant @if (isset($participant_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form action="{{ route('participant.assign.post') }}" method="post">
                        @csrf
                        <div class="row">
                            <div class="form-group col-12 mb-3">
                                <label class="mb-2" for="inputState">Organization</label>
                                <select id="inputState" class="organization_assign" name="organization" required>
                                    <option disabled selected value="">Select Organization</option>
                                    @foreach ($organizations as $organization)
                                        <option value="{{ $organization->id }}">{{ $organization->Name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-12 mb-3 facilitator_assign_area_main">
                                <label class="mb-2" for="inputState">Facilitator</label>
                                <div class="facilitator_assign_area">
                                    <select id="inputState" name="facilitator" required>
                                        <option disabled selected value="">Select Facilitator</option>
                                        @foreach ($facilitators as $facilitator)
                                            <option value="{{ $facilitator->id }}">{{ $facilitator->Firstname }}
                                                {{ $facilitator->Lastname }}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto" value="Submit">
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
