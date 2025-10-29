@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Trashed Group Facilitators</h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Group</th>
                                <th>Facilitators</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($group_facilitators as $group_facilitator)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $group_facilitator->group->Name ?? '' }}</td>
                                    <td>{{ $group_facilitator->facilitator->Firstname ?? '' }}
                                        {{ $group_facilitator->facilitator->Lastname ?? '' }}</td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('group_facilitator.restore', ['id' => $group_facilitator->id]) }}"
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
