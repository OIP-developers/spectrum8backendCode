@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Sub Organization @if (isset($organization_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($organization_edit)) action="{{ route('suborg.update') }}" @else action="{{ route('suborg.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($organization_edit))
                            <input type="hidden" name="id" value="{{ $organization_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label class="mb-2">Sub Organization Name</label>
                                <input type="text" name="org_name" class="form-control" required placeholder="Name"
                                    @if (isset($organization_edit)) value="{{ $organization_edit->Name }}"  @else value="{{ old('org_name') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Sub Organization Abbreviation</label>
                                <input type="text" name="org_abbr" class="form-control" required
                                    placeholder="Abbreviation"
                                    @if (isset($organization_edit)) value="{{ $organization_edit->Abbr }}" @else value="{{ old('org_abbr') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Organization Email</label>
                                <input type="email" name="org_email" class="form-control" required placeholder="Email"
                                    @if (isset($organization_edit)) disabled value="{{ $organization_edit->OrgEmail }}" @else value="{{ old('org_email') }}" @endif>
                            </div>
                            @if (isset($organization_edit))
                            @else
                                <div class="col-12 mb-3">
                                    <label class="mb-2">Password</label>
                                    <input type="password" name="org_password" class="form-control" required
                                        placeholder="Password" @if (isset($organization_edit)) value="" @endif>
                                </div>
                            @endif
                            <div class="col-12 mb-3">
                                <label class="mb-2">State</label>
                                <input type="text" name="org_state" class="form-control" required placeholder="State"
                                    @if (isset($organization_edit)) value="{{ $organization_edit->StateProvince }}" @else value="{{ old('org_state') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">City</label>
                                <input type="text" name="org_city" class="form-control" required placeholder="City"
                                    @if (isset($organization_edit)) value="{{ $organization_edit->City }}" @else value="{{ old('org_city') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Postal Code</label>
                                <input type="number" name="org_postal_code" class="form-control" required
                                    placeholder="Postal Code"
                                    @if (isset($organization_edit)) value="{{ $organization_edit->PostalCode }}" @else value="{{ old('org_postal_code') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Address</label>
                                <input type="text" name="org_address" class="form-control" required placeholder="Address"
                                    @if (isset($organization_edit)) value="{{ $organization_edit->Address }}" @else value="{{ old('org_address') }}" @endif>
                            </div>


                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($organization_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
{{-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> --}}
{{-- @if (isset($organization_edit))
<script>
    $(document).ready(function(){
        var group_val = $('.get_grade_val').val();
        var a = $('.toggle_area select option[value="'+group_val+'"]').attr('selected',true);
        console.log(a)
    });
</script>
    @endif --}}
