@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">FAQ's</h2>
            <hr class="w-50 mx-auto">


            <div class="text-end mb-3">
                <a class="btn btn-info text-white" href="{{ route('faq.form') }}">Add Faq</a>
            </div>
            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Question</th>
                                <th>Answer</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($faq as $data)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $data->question ?? '' }}</td>
                                    <td>{{ $data->answer ?? '' }}</td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('faq.edit', ['id' => $data->id]) }}"
                                                class="me-2 btn btn-info text-white">
                                                <i class="fa fa-pen"></i>
                                            </a>
                                            {{-- <a href="{{ route('faq.delete', ['id' => $data->id]) }}" class="btn btn-danger"
                                                title="Archive">
                                                <i class="fa fa-trash"></i>
                                            </a> --}}
                                        </div>
                                    </td>
                                </tr>
                                @php
                                    $key++;
                                @endphp
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </main>
@endsection
