@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Sub Organizations</h2>
            <hr class="w-50 mx-auto">



            {{-- <div class="text-end mb-3">
                <a class="btn btn-info text-white" href="{{ route('suborg.form') }}">Add Sub Organizations</a>
            </div> --}}
            <div class="card mb-4">
                <div class="card-body">
                    {{-- <form action="{{route('suborg.bulk_delete')}}" method="GET">
                        <div class="text-end mb-3">
                            <input type="submit" class="btn btn-danger text-white" value="Bulk Delete">
                        </div> --}}
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                {{-- <th><input type="checkbox" class="select_all" name="" id=""></th> --}}
                                <th>S.no</th>
                                <th>Name</th>
                                <th>Abbreviation</th>
                                <th>Email</th>
                                <th>Address</th>
                                <th>City</th>
                                <th>State</th>
                                <th>Postal Code</th>
                                {{-- <th>Action</th> --}}
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($sub_org_admin as $sub_org_item)
                                <tr>
                                    {{-- <td><input type="checkbox" name="bulk_action[]" value="{{$sub_org_item->id}}" id=""></td> --}}
                                    <td>{{ $key }}</td>
                                    <td>{{ $sub_org_item->Name }}</td>
                                    <td>{{ $sub_org_item->Abbr }}</td>
                                    <td>{{ $sub_org_item->OrgEmail }}</td>
                                    <td>{{ $sub_org_item->Address }}</td>
                                    <td>{{ $sub_org_item->City }}</td>
                                    <td>{{ $sub_org_item->StateProvince }}</td>
                                    <td>{{ $sub_org_item->PostalCode }}</td>
                                    {{-- <td>
                                        <div class="d-flex">
                                            <a href="{{ route('suborg.edit', ['id' => $sub_org_item->id]) }}"
                                                class="me-2 btn btn-info text-white">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-pencil" viewBox="0 0 16 16">
                                                    <path
                                                        d="M12.146.146a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-10 10a.5.5 0 0 1-.168.11l-5 2a.5.5 0 0 1-.65-.65l2-5a.5.5 0 0 1 .11-.168l10-10zM11.207 2.5 13.5 4.793 14.793 3.5 12.5 1.207 11.207 2.5zm1.586 3L10.5 3.207 4 9.707V10h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.293l6.5-6.5zm-9.761 5.175-.106.106-1.528 3.821 3.821-1.528.106-.106A.5.5 0 0 1 5 12.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.468-.325z" />
                                                </svg>
                                            </a>
                                        </div>
                                    </td> --}}
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
