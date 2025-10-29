@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Organizations</h2>
            <hr class="w-50 mx-auto">



            @if (in_array('organization_create', roles_and_permissions()) ||
            in_array('organization_archive', roles_and_permissions()) ||
            in_array('organization_delete', roles_and_permissions()))
                <div class="d-flex justify-content-between mb-3">
                    <div>
                       @if (in_array('organization_delete', roles_and_permissions()))
                            <a class="btn btn-danger text-white" href="{{ route('organization.trash') }}">Trash</a>
                        @endif
                       @if (in_array('organization_archive', roles_and_permissions()))
                       <a class="btn btn-success text-white" href="{{ route('organization.archive') }}">Archive</a>
                       @endif
                    </div>
                       @if (in_array('organization_create', roles_and_permissions()))
                       <a class="btn btn-info text-white" href="{{ route('organization.form') }}">Add Organizations</a>
                       @endif
                </div>
            @endif
            <div class="card mb-4">
                <div class="card-body">
                   @if (in_array('organization_delete', roles_and_permissions()))
                        <form action="{{ route('organization.bulk_delete') }}" method="GET">
                            <div class="text-end mb-3">
                                <input type="submit" class="btn btn-danger text-white" value="Bulk Delete">
                            </div>
                    @endif
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th><input type="checkbox" class="select_all" name="" id=""></th>
                                <th>S.no</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Primary Contact</th>
                                <th>Organization Type</th>
                                @if (in_array('organization_update', roles_and_permissions()) ||
                                in_array('organization_archive', roles_and_permissions()) ||
                                in_array('organization_delete', roles_and_permissions()))
                                    <th>Action</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($org as $org_date)
                                <tr>
                                    <td><input type="checkbox" name="bulk_action[]" value="{{ $org_date->id }}"
                                            id=""></td>
                                    <td>{{ $key }}</td>
                                    <td>{{ $org_date->Name ?? '' }}</td>
                                    <td>{{ $org_date->OrgEmail ?? '' }}</td>
                                    <td>{{ $org_date->PrimaryContactID ?? '' }}</td>
                                    <td>{{ $org_date->ParentOrganizationID == null ? 'Parent' : 'Sub' }}</td>
                                    @if (in_array('organization_update', roles_and_permissions()) ||
                                    in_array('organization_archive', roles_and_permissions()) ||
                                    in_array('organization_delete', roles_and_permissions()))
                                        <td>

                                            <div class="d-flex">
                                                {{-- <a href="{{ route('organization.assessments', ['id' => $org_date->id]) }}"
                                                class="me-2 btn btn-secondary text-white">
                                                <i class="fa fa-gear"></i>
                                            </a>
                                            <a href="{{ route('organization.subOrganizaion', ['id' => $org_date->id]) }}"
                                                class="me-2 btn btn-info text-white">
                                                <i class="fa fa-eye"></i>
                                            </a> --}}
                                            @if (in_array('organization_update', roles_and_permissions()))
                                                <a href="{{ route('organization.edit', ['id' => $org_date->id]) }}"
                                                    class="btn btn-info text-white">
                                                    <i class="fa fa-pen"></i>
                                                </a>
                                                @endif
                                               @if (in_array('organization_delete', roles_and_permissions()))
                                                    <a href="{{ route('organization.delete', ['id' => $org_date->id]) }}"
                                                        class="btn btn-danger me-2">
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                @endif
                                            @if (in_array('organization_archive', roles_and_permissions()))
                                            <a href="{{ route('organization.toggle.archive', ['id' => $org_date->id]) }}"
                                                    class="btn btn-success text-white" title="Archive">
                                                    <i class="fa fa-box-archive"></i>
                                                </a>
                                                @endif
                                            </div>
                                        </td>
                                    @endif
                                </tr>
                                @php
                                    $key++;
                                @endphp
                            @endforeach
                        </tbody>
                    </table>
                   @if (in_array('organization_delete', roles_and_permissions()))
                        </form>
                    @endif
                </div>
            </div>
        </div>
    </main>
@endsection
