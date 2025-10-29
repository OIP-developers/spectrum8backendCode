@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Groups</h2>
            <hr class="w-50 mx-auto">


            
            @if (in_array('group_create', roles_and_permissions()) ||
            in_array('group_archive', roles_and_permissions()) ||
            in_array('group_delete', roles_and_permissions()))
                <div class="d-flex justify-content-between mb-3">
                    <div>
                       @if (in_array('group_delete', roles_and_permissions()))
                       <a class="btn btn-danger text-white" href="{{ route('group.trash') }}">Trash</a>
            @endif
            @if (in_array('group_archive', roles_and_permissions()))
                    <a class="btn btn-success text-white" href="{{ route('group.archive') }}">Archive</a>
            @endif
        </div>
                    @if (in_array('group_create', roles_and_permissions()))
                    <a class="btn btn-info text-white" href="{{ route('group.form') }}">Add Group</a>
            @endif
        </div>
            @endif
            <div class="card mb-4">
                <div class="card-body">
                    @if (in_array('group_delete', roles_and_permissions()))
                        <form action="{{ route('group.bulk_delete') }}" method="GET">
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
                                <th>Abbreviation</th>
                                {{-- <th>Organization</th>
                                <th>Facilitator</th> --}}
                                <th>Gender</th>
                                <th>Grade</th>
                                <th>Class</th>
                                {{-- <th>Group Consist on</th> --}}
                                @if (in_array('group_update', roles_and_permissions()) ||
                                in_array('group_archive', roles_and_permissions()) ||
                                in_array('group_delete', roles_and_permissions()))
                                    <th>Action</th>
                                @endif
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            {{-- @php
                                $participants_male = [];
                                $participants_female = [];
                                $participants_others = [];
                            @endphp --}}
                            @foreach ($groups as $group)
                                {{-- @php
                                    $participants_male = [];
                                    $participants_female = [];
                                    $participants_others = [];
                                    foreach ($group->group_organization as $facilitator_items) {
                                        $participants_male[] = App\Models\Participant::where(['is_archive' => 'false', 'Status' => 1, 'OrganizationID' => $facilitator_items->OrganizationID, 'GenderID' => 1])->count();
                                        $participants_female[] = App\Models\Participant::where(['is_archive' => 'false', 'Status' => 1, 'OrganizationID' => $facilitator_items->OrganizationID, 'GenderID' => 2])->count();
                                        $participants_others[] = App\Models\Participant::where(['is_archive' => 'false', 'Status' => 1, 'OrganizationID' => $facilitator_items->OrganizationID, 'GenderID' => 3])->count();
                                    }
                                    
                                @endphp --}}
                                <tr>
                                    {{-- @dd($group) --}}
                                    <td><input type="checkbox" name="bulk_action[]" value="{{ $group->id }}"
                                            id=""></td>
                                    <td>{{ $key }}</td>
                                    <td>{{ $group->Name ?? '' }}</td>
                                    <td>{{ $group->Abbr ?? '' }}</td>
                                    {{-- <td>
                                        @foreach ($group->group_organization as $org)
                                            <span class="badge badge-primary">{{ $org->organization->Name ?? '' }} </span>
                                        @endforeach
                                    </td>
                                    <td>
                                        @foreach ($group->group_facilitator_web as $fac)
                                            <span class="badge badge-primary">{{ $fac->facilitator->Firstname ?? '' }} -
                                                {{ $fac->facilitator->Lastname ?? '' }} </span>
                                        @endforeach
                                    </td> --}}
                                    <td>
                                        @foreach ($group->group_gender as $gen)
                                            <span class="badge badge-primary">{{ $gen->gender->Gender ?? '' }}</span>
                                        @endforeach
                                    </td>
                                    <td>
                                        @foreach ($group->group_grade as $gra)
                                            <span class="badge badge-primary">{{ $gra->grade->Name ?? '' }}</span>
                                        @endforeach
                                    </td>
                                    <td>
                                        @foreach ($group->group_class as $cla)
                                            <span class="badge badge-primary">{{ $cla->class->Name ?? '' }}</span>
                                        @endforeach
                                    </td>
                                    {{-- <td>
                                        <span class="badge badge-primary">{{ array_sum($participants_male) ?? '0' }} Boys
                                        </span>
                                        <span class="badge badge-primary">{{ array_sum($participants_female) ?? '0' }} Girls
                                        </span>
                                        <span class="badge badge-primary">{{ array_sum($participants_others) ?? '0' }} Others
                                        </span>
                                    </td> --}}
                                    @if (in_array('group_update', roles_and_permissions()) ||
                                    in_array('group_archive', roles_and_permissions()) ||
                                    in_array('group_delete', roles_and_permissions()))
                                        <td>
                                            <div class="d-flex">
                                                @if (in_array('group_update', roles_and_permissions()))
                                                <a href="{{ route('group.edit', ['id' => $group->id]) }}"
                                                    class="btn btn-info text-white">
                                                    <i class="fa fa-pen"></i>
                                                </a>
                                    @endif
                                    @if (in_array('group_delete', roles_and_permissions()))
                                                <a href="{{ route('group.delete', ['id' => $group->id]) }}"
                                                    class="btn btn-danger me-2">
                                                    <i class="fa fa-trash"></i>
                                                </a>
                                    @endif
                                    @if (in_array('group_archive', roles_and_permissions()))
                                                <a href="{{ route('group.toggle.archive', ['id' => $group->id]) }}"
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
                    @if (in_array('group_delete', roles_and_permissions()))

                        </form>
                    @endif
                </div>
            </div>
        </div>
    </main>
@endsection
