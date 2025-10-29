@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Group Gender @if (isset($group_gender_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">
           
          
            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($group_gender_edit)) action="{{ route('group_gender.update') }}" @else action="{{ route('group_gender.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($group_gender_edit))
                            <input type="hidden" name="id" value="{{ $group_gender_edit->id }}">
                        @endif
                        <div class="row">

                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Group <span class="text-danger">*</span></label>
                                <select id="inputState" name="group" required>
                                    <option disabled selected value="">Select Group</option>
                                    @foreach ($groups as $group)
                                        <option value="{{ $group->id }}"
                                            @if (isset($group_gender_edit)) {{ $group_gender_edit->GroupID == $group->id ? 'selected' : '' }} @endif>
                                            {{ $group->Name }} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Gender <span class="text-danger">*</span></label>
                                <select id="inputState" name="gender" required>
                                    <option disabled selected value="">Select Gender</option>
                                    @foreach ($genders as $gender)
                                        <option value="{{ $gender->id }}"
                                            @if (isset($group_gender_edit)) {{ $group_gender_edit->GenderID == $gender->id ? 'selected' : '' }} @endif>
                                            {{ $gender->Gender }} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($group_gender_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>


@endsection
