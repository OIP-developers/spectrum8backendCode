@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Facilitators Requests</h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Parent</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($facilitators as $facilitator)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $facilitator->name ?? '' }}</td>
                                    <td>{{ $facilitator->email ?? '' }}</td>
                                    <td>{{ $facilitator->facilitator_assisstant->email ?? 'Parent' }}</td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('facilitate.approved', ['id' => $facilitator->id]) }}"
                                                class="btn btn-success text-white">
                                                <i class="fa fa-check"></i>
                                            </a>

                                            <a href="{{ route('facilitate.reject', ['id' => $facilitator->id]) }}"
                                                class="btn btn-secondary mx-2">
                                                <i class="fa fa-times"></i>
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
