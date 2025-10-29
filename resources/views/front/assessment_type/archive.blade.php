@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Archive Assessment Types</h2>
            <hr class="mx-auto w-50">



            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Name</th>
                                <th>Timed</th>
                                <th>Distance</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($assessment_type as $assessment)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $assessment->Name ?? '' }}</td>
                                    <td>{{ $assessment->Timed == 1 ? 'Yes' : 'No' }}</td>
                                    <td>{{ $assessment->Distance == 1 ? 'Yes' : 'No' }}</td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('assessment_type.toggle.archive', ['id' => $assessment->id]) }}"
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
