@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">FAQ's @if (isset($faqs_edit))
                    Update
                @else
                    Add
                @endif
            </h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4 col-md-6 col-sm-12 mx-auto">
                <div class="card-body">
                    <form
                        @if (isset($faqs_edit)) action="{{ route('faq.update') }}" @else action="{{ route('faq.add') }}" @endif
                        method="post">
                        @csrf
                        @if (isset($faqs_edit))
                            <input type="hidden" name="id" value="{{ $faqs_edit->id }}">
                        @endif
                        <div class="row">
                            <div class="col-12 mb-3">
                                <label class="mb-2">Question</label>
                                <input type="text" name="question" class="form-control" required
                                    placeholder="Enter Question"
                                    @if (isset($faqs_edit)) value="{{ $faqs_edit->question }}" @else value="{{ old('question') }}" @endif>
                            </div>
                            <div class="col-12 mb-3">
                                <label class="mb-2">Answer</label>
                                <textarea name="answer" id="" cols="30" placeholder="Enter Answer" rows="2" class="form-control">
@if (isset($faqs_edit))
{{ $faqs_edit->answer }} @else{{ old('answer') }}
@endif
</textarea>
                            </div>

                            <div class="col-12 text-center">
                                <input type="submit" class="btn btn-primary w-50 mx-auto"
                                    @if (isset($faqs_edit)) value="Update" @else value="Submit" @endif>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
