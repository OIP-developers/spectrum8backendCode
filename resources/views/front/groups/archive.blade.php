@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Archive Groups</h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Name</th>
                                <th>Abbreviation</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($groups as $group)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $group->Name ?? '' }}</td>
                                    <td>{{ $group->Abbr ?? '' }}</td>

                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('group.toggle.archive', ['id' => $group->id]) }}"
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
