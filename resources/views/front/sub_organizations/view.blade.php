@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Sub Organizations</h2>
            <hr class="w-50 mx-auto">



            <div class="text-end mb-3">
                <a class="btn btn-info text-white" href="{{ route('suborg.form') }}">Add Sub Organizations</a>
            </div>
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
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($sub_org as $sub_org_item)
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
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('suborg.edit', ['id' => $sub_org_item->id]) }}"
                                                class="me-2 btn btn-info text-white">
                                                <i class="fa fa-pen"></i>
                                            </a>
                                            {{-- <a href="{{ route('suborg.delete', ['id' => $sub_org_item->id]) }}"
                                                class="btn btn-danger">
                                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                    fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16">
                                                    <path
                                                        d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z" />
                                                    <path fill-rule="evenodd"
                                                        d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z" />
                                                </svg>
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
                    {{-- </form> --}}
                </div>
            </div>
        </div>
    </main>
@endsection
