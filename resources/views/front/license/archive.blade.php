@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Archive License</h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Organization</th>
                                <th>License Type</th>
                                <th>Start Date</th>
                                <th>Expires</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($licenses as $license)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $license->organization->Name ?? '' }}</td>
                                    <td>{{ $license->license_type->Name ?? '' }}</td>
                                    <td>{{ $license->StartDate ?? '' }}</td>
                                    <td>{{ $license->Expires ?? '' }}</td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('license.toggle.archive', ['id' => $license->id]) }}"
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
