@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Trashed Ninty Five</h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                {{-- <th>Image</th> --}}
                                <th>Assessment</th>
                                <th>Grade</th>
                                <th>Gender</th>
                                <th>Percent</th>
                                <th>Use Segment</th>
                                {{-- <th>Color Segment</th> --}}
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($ninty_five as $ninty_five_item)
                                <tr>
                                    <td>{{ $key }}</td>
                                    {{-- <td>
                                        @if ($ninty_five_item->Image)
                                            <img src="{{ asset('images/ninty_five/' . $ninty_five_item->Image) }}"
                                                class="logo_image" alt="">
                                        @endif
                                    </td> --}}
                                    <td>{{ $ninty_five_item->assessment->Name ?? '' }}</td>
                                    <td>{{ $ninty_five_item->grade->Name ?? '' }}</td>
                                    <td>{{ $ninty_five_item->gender->Gender ?? '' }}</td>
                                    <td>{{ $ninty_five_item->Percent ?? '' }}</td>
                                    {{-- <td>{{ $ninty_five_item->UseSegment ?? '' }}</td> --}}
                                    {{-- <td>{{ $ninty_five_item->ColorSegment ?? '' }}</td> --}}
                                    <td>{{ $ninty_five_item->UseSegment == 1 ? 'Yes' : 'No' }}</td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('ninty_five.restore', ['id' => $ninty_five_item->id]) }}"
                                                class="btn btn-success text-white" title="restore">
                                                <i class="fa fa-trash-arrow-up"></i>
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
