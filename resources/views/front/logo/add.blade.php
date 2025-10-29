@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Logo @if (isset($logo_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($logo_edit)) action="{{ route('logo.update') }}" @else action="{{ route('logo.add') }}" @endif
                        method="post" enctype="multipart/form-data">
                        @csrf
                        @if (isset($logo_edit))
                            <input type="hidden" name="id" value="{{ $logo_edit->id }}">
                        @endif
                        <div class="row">

                            <div class="col-6 mb-3">
                                <label class="my-2">Upload Light Mode Image</label>
                                <input type="file" name="light_mode_logo" accept="image/png, image/jpeg, image/jpg"
                                    class="form-control"
                                    @if (isset($logo_edit)) value="{{ $logo_edit->light_mode_logo }}" @else required value="" @endif>

                                <div class="col-md-12 my-2">
                                    @if (isset($logo_edit))
                                        <img id="preview-image-before-upload" class="logo_image"
                                            src="{{ asset('images/logo/' . $logo_edit->light_mode_logo) }}" alt=""
                                            alt="preview image">
                                    @else
                                        <img id="preview-image-before-upload" class="logo_image" src=""
                                            alt="" alt="preview image">
                                    @endif
                                </div>
                            </div>
                            <div class="col-6 mb-3">
                                <label class="my-2">Upload Dark Mode Image</label>
                                <input type="file" name="dark_mode_logo" accept="image/png, image/jpeg, image/jpg"
                                    class="form-control"
                                    @if (isset($logo_edit)) value="{{ $logo_edit->dark_mode_logo }}" @else required value="" @endif>

                                <div class="col-md-12 my-2">
                                    @if (isset($logo_edit))
                                        <img id="preview-image-before-upload" class="logo_image"
                                            src="{{ asset('images/logo/' . $logo_edit->dark_mode_logo) }}" alt=""
                                            alt="preview image">
                                    @else
                                        <img id="preview-image-before-upload" src="" alt=""
                                            alt="preview image">
                                    @endif
                                </div>
                            </div>
                       
                            <div class="col-12 mb-3">
                                <label class="my-2">Upload Video</label>
                                <input type="file" name="video" accept="video/*"
                                    class="form-control"
                                    @if (isset($logo_edit)) value="{{ $logo_edit->video }}" @else required value="" @endif>

                                <div class="col-md-12 my-2">
                                    @if (isset($logo_edit))
                                    <video width="320" controls="">
                                        <source src="{{asset('images/logo/' . $logo_edit->video)}}" preload="auto" type="video/mp4" width="100" height="100">
                                    </video>
                                    @else
                                    <video width="320" controls="">
                                        <source src="" preload="auto" type="video/mp4" width="100" height="100">
                                    </video>
                                    @endif
                                </div>
                            </div>



                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($logo_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>

                    </form>

                </div>
            </div>
        </div>
    </main>
@endsection
