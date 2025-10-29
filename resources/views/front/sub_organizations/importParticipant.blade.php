@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Import Participant
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form id="excel-csv-import-form" method="POST" action="{{ route('import_participant') }}"
                        accept-charset="utf-8" enctype="multipart/form-data">

                        @csrf

                        <div class="row">

                            {{-- <div class="col-md-12"> --}}
                            {{-- <div class="form-group">
                                      <input type="file" name="file" placeholder="Choose file">
                                  </div> --}}
                            <div class="col-12 mb-3">
                                <label class="mb-2">Upload Image</label>
                                <input type="file" name="file" class="form-control" required value="">
                            </div>
                            {{-- @error('file')
                                      <div class="alert alert-danger mt-1 mb-1">{{ $message }}</div>
                                  @enderror --}}
                            {{-- </div>               --}}

                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto" value="Submit">
                            </div>
                            {{-- <div class="col-md-12 mt-3">
                                  <button type="submit" class="btn btn-primary" id="submit">Submit</button>
                              </div> --}}
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
