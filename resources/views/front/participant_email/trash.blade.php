@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Trashed Participant Email</h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Email</th>
                                <th>Participant</th>
                                <th>Email Type</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($participant_emails as $participant_email)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $participant_email->Email ?? '' }}</td>
                                    <td>{{ $participant_email->participant->Firstname ?? '' }}
                                        {{ $participant_email->participant->Lastname ?? '' }}</td>
                                    <td>{{ $participant_email->email_type->Name ?? '' }}</td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('participant_email.restore', ['id' => $participant_email->id]) }}"
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
