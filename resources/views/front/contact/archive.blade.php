@extends('front.layout.app')
@section('content')
    <main>
        <div class="container-fluid px-4">
            <h2 class="mt-4 main_heading">Archive Contacts</h2>
            <hr class="w-50 mx-auto">


            <div class="card mb-4">
                <div class="card-body">
                    <table id="datatablesSimple">
                        <thead>
                            <tr>
                                <th>S.no</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Phone Work</th>
                                <th>Phone Mobile</th>
                                <th>Contact Type</th>
                                <th>Organization</th>
                                <th>Facilitator</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            @php
                                $key = 1;
                            @endphp
                            @foreach ($contacts as $contact)
                                <tr>
                                    <td>{{ $key }}</td>
                                    <td>{{ $contact->Firstname ?? '' }} {{ $contact->Lastname ?? '' }}</td>
                                    <td>{{ $contact->Email ?? '' }}</td>
                                    <td>{{ $contact->PhoneWork ?? '' }}</td>
                                    <td>{{ $contact->PhoneMobil ?? '' }}</td>
                                    <td>{{ $contact->contact_type->Classification ?? '' }}</td>
                                    <td>{{ $contact->organization->Name ?? '' }}</td>
                                    <td>{{ $contact->facilitator->Firstname ?? '' }}
                                        {{ $contact->facilitator->Lastname ?? '' }}</td>
                                    <td>
                                        <div class="d-flex">
                                            <a href="{{ route('contact.toggle.archive', ['id' => $contact->id]) }}"
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
