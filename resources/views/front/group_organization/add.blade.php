@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Group @if (isset($group_organization_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($group_organization_edit)) action="{{ route('group_organization.update') }}" @else action="{{ route('group_organization.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($group_organization_edit))
                            <input type="hidden" name="id" value="{{ $group_organization_edit->id }}">
                        @endif
                        <div class="row">

                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Group <span class="text-danger">*</span></label>
                                <select id="inputState" name="group" required>
                                    <option disabled selected value="">Select Group</option>
                                    @foreach ($groups as $group)
                                        <option value="{{ $group->id }}"
                                            @if (isset($group_organization_edit)) {{ $group_organization_edit->GroupID == $group->id ? 'selected' : '' }} @endif>
                                            {{ $group->Name }} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-group col-6 mb-3">
                                <label class="mb-2" for="inputState">Organization <span
                                        class="text-danger">*</span></label>
                                <select id="inputState" name="organization" required>
                                    <option disabled selected value="">Select Organization</option>
                                    @foreach ($organizations as $organization)
                                        <option value="{{ $organization->id }}"
                                            @if (isset($group_organization_edit)) {{ $group_organization_edit->OrganizationID == $organization->id ? 'selected' : '' }} @endif>
                                            {{ $organization->Name }} </option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($group_organization_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
