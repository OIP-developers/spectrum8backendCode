<!DOCTYPE html>
<html>

<head>
    <title>Spectrum-8 User {{ $user_data['type'] }} Mail</title>
</head>

<body>

    <p>User {{ $user_data['type'] }} Successfully</p>
    <br>
    <p>
        Name :  {{ $user_data['name'] }} <br>
        Email : {{ $user_data['email'] }} <br>
        {{-- Password : {{ $user_data['password'] }} <br> --}}
        Created at : {{ $user_data['created_at'] }} <br>
        Updated at : {{ $user_data['updated_at'] }} <br>
        Deleted at : {{ $user_data['deleted_at'] }} <br>
    </p>
    {{-- <p>Your Facilitator Request for {{ $details['facilitator_email'] }} Approved.</p> --}}

</body>

</html>
