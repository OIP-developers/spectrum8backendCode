@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Archive Colors</h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Name</th>
                                <th>Description</th>
                                <th>Sort</th>
                                <th>Web Color</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($colors as $color)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $color->Name ?? '' }}</td>
                                    <td>{{ $color->Information ?? '' }}</td>
                                    <td>{{ $color->Sort ?? '' }}</td>
                                    <td class="text-center"><span
                                            style="background-color:{{ $color->WebColor ?? '' }};color: transparent;padding: 5px 40px;"></span>
                                    </td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('color.toggle.archive', ['id' => $color->id]) }}"
                                                class="btn btn-success text-white" title="unarchive">
                                                <i class="fa fa-clock-rotate-left"></i>
                                            </a>
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
