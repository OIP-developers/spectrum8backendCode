@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Instructions</h2>
            <hr class="w-50 mx-auto">


            <div class="d-flex justify-content-between mb-3">
                <div>
                    <a class="btn btn-danger text-white" href="{{ route('instruction.trash') }}">Trash</a>
                    <a class="btn btn-success text-white" href="{{ route('instruction.archive') }}">Archive</a>
                </div>
                <a class="btn btn-info text-white" href="{{ route('instruction.form') }}">Add Instruction</a>
            </div>
            <div class="card mb-4">
                <div class="card-body">
                    <form action="{{ route('instruction.bulk_delete') }}" method="GET">
                        <div class="text-end mb-3">
                            <input type="submit" class="btn btn-danger text-white" value="Bulk Delete">
                        </div>
                        <table id="datatablesSimple">
                            <thead>
                                <tr>
                                    <th><input type="checkbox" class="select_all" name="" id=""></th>
                                    <th>S.no</th>
                                    <th>Assessment</th>
                                    <th>Instruction</th>
                                    <th>Instruction Type</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                @php
                                    $key = 1;
                                @endphp
                                @foreach ($instruction_show as $data)
                                    <tr>
                                        <td><input type="checkbox" name="bulk_action[]" value="{{ $data->id }}"
                                                id=""></td>
                                        <td>{{ $key }}</td>
                                        <td>{{ $data->assessment->Name }}</td>
                                        <td>{{ $data->instructions }}</td>
                                        <td>{{ $data->CreatedBy == 1 ? 'Public' : 'Private' }}</td>
                                        <td>
                                            @if ($data->CreatedBy != 1 || Auth::user()->id == 1)
                                                <div class="d-flex">
                                                    <a href="{{ route('instruction.edit', ['id' => $data->id]) }}"
                                                        class="btn btn-info text-white">
                                                        <i class="fa fa-pen"></i>
                                                    </a>
                                                    <a href="{{ route('instruction.delete', ['id' => $data->id]) }}"
                                                        class="btn btn-danger me-2">
                                                        <i class="fa fa-trash"></i>
                                                    </a>
                                                    <a href="{{ route('instruction.toggle.archive', ['id' => $data->id]) }}"
                                                        class="btn btn-success text-white" title="Archive">
                                                        <i class="fa fa-box-archive"></i>
                                                    </a>
                                                </div>
                                            @endif
                                        </td>
                                    </tr>
                                    @php
                                        $key++;
                                    @endphp
                                @endforeach
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </main>
@endsection
