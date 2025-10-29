@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Archive Classes</h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Name</th>
                                <th>Color</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($class as $class_item)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $class_item->Name ?? '' }}</td>
                                    <td><span
                                            style="background-color:{{ $class_item->colors->WebColor }};color: transparent;padding: 5px 40px;"></span>
                                    </td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('class.toggle.archive', ['id' => $class_item->id]) }}"
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
