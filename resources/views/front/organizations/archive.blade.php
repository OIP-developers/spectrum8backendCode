@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Archive Organizations</h2>
            <hr class="w-50 mx-auto">



            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Primary Contact</th>
                                <th>Organization Type</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($organizations as $org_date)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $org_date->Name ?? '' }}</td>
                                    <td>{{ $org_date->OrgEmail ?? '' }}</td>
                                    <td>{{ $org_date->PrimaryContactID ?? '' }}</td>
                                    <td>{{ $org_date->ParentOrganizationID == null ? 'Parent' : 'Sub' }}</td>
                                    <td>

                                        <div class="d-flex">
                                            <a href="{{ route('organization.toggle.archive', ['id' => $org_date->id]) }}"
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
