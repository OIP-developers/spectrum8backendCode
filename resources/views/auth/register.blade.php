<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spectrum Admin Login</title>
</head>

<body>

    <style>
        @import url('https://fonts.googleapis.com/css?family=Playfair+Display:400,900|Poppins:400,500');

        * {
            margin: 0;
            padding: 0;
            text-decoration: none;
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;
            background: #f6f6f6;
            font-family: 'Poppins', sans-serif;
            overflow-x: hidden;
            height: 100vh;
            margin: auto;
            display: flex;
        }

        img {
            max-width: 100%;
        }

        h1 {
            color: #fff;
        }

        .app {
            margin: 0;
            position: absolute;
            top: 50%;
            left: 50%;
            -ms-transform: translate(-50%, -50%);
            transform: translate(-50%, -50%);
            background-color: #fff;
            width: 700px;
            height: 500px;
            /* margin: 2em auto; */
            border-radius: 5px;
            padding: 1em;
            /* position: relative; */
            overflow: hidden;
            box-shadow: 0 6px 31px -2px rgba(0, 0, 0, .3);
        }

        a {
            text-decoration: none;
            color: #257aa6;
        }

        p {
            font-size: 13px;
            color: #333;
            line-height: 2;
        }

        .light {
            text-align: right;
            color: #fff;
        }

        .light a {
            color: #fff;
        }

        .bg {
            width: 100%;
            height: 95%;
            background: linear-gradient(207deg, rgba(1, 18, 52, 1) 0%, rgba(29, 105, 156, 1) 100%);
            position: absolute;
            top: -5em;
            left: 0;
            right: 0;
            margin: auto;
            /* background-image: url("background.jpg"); */
            background-position: center;
            background-size: cover;
            background-repeat: no-repeat;
            /* clip-path: ellipse(69% 46% at 48% 46%); */
        }

        form {
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            width: 100%;
            text-align: center;
            padding: 2em;
            height: 100%;
        }

        header {
            width: 220px;
            height: 120px;
            margin: 1em auto;
        }

        form input {
            width: 100%;
            padding: 13px 15px;
            margin: 0.7em auto;
            border-radius: 100px;
            border: none;
            background: rgb(255, 255, 255, 0.3);
            font-family: 'Poppins', sans-serif;
            outline: none;
            color: #fff;
        }

        input::placeholder {
            color: #fff;
            font-size: 13px;
        }

        .inputs {
            margin-top: -4em;
        }

        footer {
            position: absolute;
            bottom: 0;
            left: 0;
            right: 0;
            padding: 2em 2em 1em 2em;
            text-align: center;
        }

        button {
            width: 50%;
            padding: 13px 15px;
            border-radius: 100px;
            border: none;
            background: linear-gradient(207deg, rgba(1, 18, 52, 1) 0%, rgba(29, 105, 156, 1) 100%);
            font-family: 'Poppins', sans-serif;
            outline: none;
            color: #fff;
            cursor: pointer;
        }

        button:hover {
            background: linear-gradient(207deg, rgba(29, 105, 156, 1) 0%, rgba(1, 18, 52, 1) 100%);
        }

        .input_1 {
            width: 50%;
            padding: 5px;
        }

        .row {
            display: flex;
        }

        .invalid-feedback {
            font-size: 13px;
            color: red;
            font-weight: 500;
            position: absolute;
            top: -5px;
            /* width: 100%; */
            left: 20px;
        }

        @media screen and (max-width: 640px) {
            .app {
                width: 100%;
                height: 100vh;
                border-radius: 0;
            }

            .bg {
                top: -7em;
                width: 450px;
                height: 95vh;
            }

            header {
                width: 90%;
                height: 140px;
            }

            .inputs {
                margin: 0;
            }

            input,
            button {
                padding: 18px 15px;
            }
        }
    </style>
    @if ($success = Session::get('success'))
        <div class="alert alert-success alert-block">
            <strong>{{ $success }}</strong>
        </div>
    @endif
    @if ($errors->any())
        <div class="alert alert-danger alert-block">
            @foreach ($errors->all() as $error)
                <strong>{{ $error }}</strong>
            @endforeach
        </div>
    @endif
    <!-- partial:index.partial.html -->
    <div class="app">

        <div class="bg"></div>

        <form method="POST" action="{{ route('organization_register') }}">
            @csrf
            <header>
                <!-- <img src="https://assets.codepen.io/3931482/internal/avatars/users/default.png?format=auto&height=80&version=1592223909&width=80"> -->
                <h1>Register</h1>
            </header>
            <div class="row">
                <div class="inputs input_1">
                    <div class="position_relative">
                        <input type="text" id="name" placeholder="Organization Name"
                            class="@error('name') is-invalid @enderror" name="name" value="{{ old('name') }}"
                            required autocomplete="name" autofocus>
                        @error('name')
                            <span class="invalid-feedback" role="alert">
                                {{ $message }}
                            </span>
                        @enderror
                    </div>
                    <div class="position_relative">
                        <input type="text" id="abbreviation" placeholder="Organization Abbreviation"
                            class="@error('abbreviation') is-invalid @enderror" name="abbreviation"
                            value="{{ old('abbreviation') }}" required autocomplete="abbreviation" autofocus>
                        @error('abbreviation')
                            <span class="invalid-feedback" role="alert">
                                {{ $message }}
                            </span>
                        @enderror
                    </div>
                    <div class="position_relative">
                        <input type="email" id="email" class="@error('email') is-invalid @enderror" name="email"
                            required autocomplete="current-email" placeholder="Organization Email">
                        @error('email')
                            <span class="invalid-feedback" role="alert">
                                {{ $message }}
                            </span>
                        @enderror
                    </div>
                    <div class="position_relative">
                        <input type="password" id="password" class="@error('password') is-invalid @enderror"
                            name="password" required placeholder="Password">
                        @error('password')
                            <span class="invalid-feedback" role="alert">
                                {{ $message }}
                            </span>
                        @enderror
                    </div>
                </div>

                <div class="inputs input_1">
                    <div class="position_relative">
                        <input type="text" id="state" placeholder="State"
                            class="@error('state') is-invalid @enderror" name="state" value="{{ old('state') }}"
                            required autocomplete="state" autofocus>
                        @error('state')
                            <span class="invalid-feedback" role="alert">
                                {{ $message }}
                            </span>
                        @enderror
                    </div>
                    <div class="position_relative">
                        <input type="text" id="city" placeholder="City"
                            class="@error('city') is-invalid @enderror" name="city" value="{{ old('city') }}"
                            required autocomplete="city" autofocus>
                        @error('city')
                            <span class="invalid-feedback" role="alert">
                                {{ $message }}
                            </span>
                        @enderror
                    </div>
                    <div class="position_relative">
                        <input type="number" id="postal_code" class="@error('postal_code') is-invalid @enderror"
                            name="postal_code" required placeholder="Postal Code">
                        @error('postal_code')
                            <span class="invalid-feedback" role="alert">
                                {{ $message }}
                            </span>
                        @enderror
                    </div>
                    <div class="position_relative">
                        <input type="text" id="address" class="@error('address') is-invalid @enderror"
                            name="address" required placeholder="Address" />
                        @error('address')
                            <span class="invalid-feedback" role="alert">
                                {{ $message }}
                            </span>
                        @enderror
                    </div>

                </div>
            </div>
            <footer>
                <!-- <p>Don't have an account? <a href="#">Sign Up</a></p> -->
                @error('email')
                    <span class="invalid-feedback" role="alert">
                        {{ $message }}
                    </span>
                @enderror
                @error('password')
                    <span class="invalid-feedback" role="alert">
                        {{ $message }}
                    </span>
                @enderror
                <p>Already Have an Account <a href="{{ route('login') }}">Login</a></p>
                <button type="submit">Register</button>
            </footer>


        </form>




    </div>

</body>

</html>
