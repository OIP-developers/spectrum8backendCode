@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">User @if (isset($user_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($user_edit)) action="{{ route('users.update') }}" @else action="{{ route('users.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($user_edit))
                            <input type="hidden" name="id" value="{{ $user_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="form-group col-12 mb-3 user_area">
                                <label class="mb-2" for="user_check">User Role <span class="text-danger">*</span></label>
                                {{-- <select name="role" required id="user_check">
                                    <option disabled selected value="">Select role</option>
                                    <option value="1"
                                        @if (isset($user_edit)) {{ $user_edit->role_id == 1 ? 'selected' : '' }} @endif>
                                        System Manager</option>
                                    <option value="2"
                                        @if (isset($user_edit)) {{ $user_edit->role_id == 2 ? 'selected' : '' }} @endif>
                                        Manage Roles</option>
                                    <option value="3"
                                        @if (isset($user_edit)) {{ $user_edit->role_id == 3 ? 'selected' : '' }} @endif>
                                        Manage Profiles</option>
                                    <option value="4"
                                        @if (isset($user_edit)) {{ $user_edit->role_id == 4 ? 'selected' : '' }} @endif>
                                        Manage Guests</option>
                                    <option value="5"
                                        @if (isset($user_edit)) {{ $user_edit->role_id == 5 ? 'selected' : '' }} @endif>
                                        Application Manager</option>
                                    <option value="6"
                                        @if (isset($user_edit)) {{ $user_edit->role_id == 6 ? 'selected' : '' }} @endif>
                                        Manage Organizations</option>
                                    <option value="7"
                                        @if (isset($user_edit)) {{ $user_edit->role_id == 7 ? 'selected' : '' }} @endif>
                                        Manage Facilitators</option>
                                    <option value="8"
                                        @if (isset($user_edit)) {{ $user_edit->role_id == 8 ? 'selected' : '' }} @endif>
                                        Manage Participants</option>
                                    <option value="9"
                                        @if (isset($user_edit)) {{ $user_edit->role_id == 9 ? 'selected' : '' }} @endif>
                                        Manage Classes</option>
                                    <option value="10"
                                        @if (isset($user_edit)) {{ $user_edit->role_id == 10 ? 'selected' : '' }} @endif>
                                        Manage Groups</option>
                                    <option value="11"
                                        @if (isset($user_edit)) {{ $user_edit->role_id == 11 ? 'selected' : '' }} @endif>
                                        Manage Events</option>
                                </select> --}}
                                <select name="role" required id="user_check">
                                    <option disabled selected value="">Select role</option>
                                    @foreach ($roles as $role)
                                        <option value="{{ $role->id }}"
                                            @if (isset($user_edit)) {{ $user_edit->role_id == $role->id ? 'selected' : '' }} @endif>
                                            {{ $role->RoleName }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Username <span class="text-danger">*</span></label>
                                <input type="text" name="name" class="form-control" required placeholder="Name"
                                    @if (isset($user_edit)) value="{{ $user_edit->name }}" @else value="{{ old('name') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Email <span class="text-danger">*</span></label>
                                <input type="email" name="email" class="form-control" required placeholder="Email"
                                    @if (isset($user_edit)) value="{{ $user_edit->email }}" @else value="{{ old('email') }}" @endif>
                            </div>
                            {{-- @if (isset($user_edit))
                            @else --}}
                            <div class="col-12 mb-3">
                                <label class="mb-2">Password <span class="text-danger">*</span></label>
                                <input type="password" name="password" class="form-control" required placeholder="Password">
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Confirm Password <span class="text-danger">*</span></label>
                                <input type="password" name="confirm_password" class="form-control" required
                                    placeholder="Confirm Password">
                            </div>
                            {{-- @endif --}}

                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($user_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
