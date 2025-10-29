@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">
                Update Admin
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form action="{{ route('admin.update') }}" method="post">
                        @csrf
                        @if (isset($admin_data))
                            <input type="hidden" name="id" value="{{ $admin_data->id }}">
                        @endif
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label class="mb-2">Name</label>
                                <input type="text" name="name" class="form-control"
                                    @if (isset($admin_data)) value="{{ $admin_data->name }}" @endif required
                                    placeholder="Enter Name">
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Email</label>
                                <input type="email" name="email" class="form-control"
                                    @if (isset($admin_data)) id="pointer_none" value="{{ $admin_data->email }}" @endif
                                    required placeholder="Enter Email">
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Current Password</label>
                                <input type="password" name="current_pass" class="form-control" required
                                    placeholder="Enter Current Password">
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Enter New Password</label>
                                <input type="password" name="new_pass" class="form-control" required
                                    placeholder="Enter New Password">
                            </div>



                            <div class="col-12 text-center">
                                <button class="btn btn-primary w-50 mx-auto">Update</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
