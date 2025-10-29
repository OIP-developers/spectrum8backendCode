<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Spectrum-8 | @if (Auth::user()->role_id == 0)
            Main Admin
        @endif
        @if (Auth::user()->role_id == 1)
            System Manager
        @endif
        @if (Auth::user()->role_id == 2)
            Manage Roles
        @endif
        @if (Auth::user()->role_id == 3)
            Manage Profiles
        @endif
        @if (Auth::user()->role_id == 4)
            Manage Guests
        @endif
        @if (Auth::user()->role_id == 5)
            Application Manager
        @endif
        @if (Auth::user()->role_id == 6)
            Manage Organizations
        @endif
        @if (Auth::user()->role_id == 7)
            Manage Facilitators
        @endif
        @if (Auth::user()->role_id == 8)
            Manage Participants
        @endif
        @if (Auth::user()->role_id == 9)
            Manage Classes
        @endif
        @if (Auth::user()->role_id == 10)
            Manage Groups
        @endif
        @if (Auth::user()->role_id == 11)
            Manage Events
        @endif
    </title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
    {{-- <link rel="stylesheet" href="https://cdn.datatables.net/1.12.1/css/jquery.dataTables.min.css"> --}}
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" />
    <link rel="stylesheet" type="text/css"
        href="https://cdn.datatables.net/buttons/1.4.0/css/buttons.dataTables.min.css" />

    <link href="{{ asset('front/css/styles.css') }}" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    {{-- <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.css" crossorigin="anonymous"></script> --}}
    <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

</head>
<style>
    .d-flex a.btn.btn-info.text-white {
        margin-right: 0.5rem !important;
    }
</style>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <div class="alert alert-success alert-block status">
            <strong></strong>
        </div>
        @if (Session::has('message'))
            <div class="alert alert-danger alert-block">
                <strong>{{ session('message') }}</strong>
            </div>
        @endif
        @if ($success = Session::get('success'))
            <div class="alert alert-success alert-block">
                <strong>{{ $success }}</strong>
            </div>
        @endif
        @if ($info = Session::get('info'))
            <div class="alert alert-info alert-block">
                <strong>{{ $info }}</strong>
            </div>
        @endif
        @if ($error = Session::get('error'))
            <div class="alert alert-danger alert-block">
                <strong>{{ $error }}</strong>
            </div>
        @endif
        <div class="errors_main_div">
            @if ($errors->any())
                @foreach ($errors->all() as $error)
                    <div class="alert alert-danger alert-block">
                        <strong>{{ $error }}</strong>
                    </div>
                @endforeach
            @endif
        </div>
        <!-- Navbar Brand-->
        {{-- <a class="navbar-brand ps-3" href="{{ route('dashboard') }}">Spectrum
            8</a> --}}
        <a class="navbar-brand ps-3"
            href="@if (Auth::user()->role_id == 1) {{ route('result.view') }} @elseif(Auth::user()->role_id == 2){{ route('users.view') }}@elseif(Auth::user()->role_id == 3){{ route('users.view') }}@elseif(Auth::user()->role_id == 4){{ route('users.view') }}@elseif(Auth::user()->role_id == 5){{ route('result.view') }}@elseif(Auth::user()->role_id == 6){{ route('result.view') }}@elseif(Auth::user()->role_id == 7){{ route('result.view') }}@elseif(Auth::user()->role_id == 8){{ route('result.view') }}@elseif(Auth::user()->role_id == 9){{ route('class.view') }}@elseif(Auth::user()->role_id == 10){{ route('group.view') }}@elseif(Auth::user()->role_id == 11){{ route('result.view') }} @endif">Spectrum
            8</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                class="fas fa-bars"></i></button>
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4 justify-content-end w-100">
            <span style="color: white;margin: auto 10px;">{{ Auth::user()->name }}</span>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                    data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="{{ route('updateadmin') }} ">Settings</a></li>
                    {{-- <li><a class="dropdown-item" href="#!">Activity Log</a></li> --}}
                    <li>
                        <hr class="dropdown-divider" />
                    </li>
                    <li><a class="dropdown-item" href="{{ route('logout') }}">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">Menu</div>
                        @if (Auth::user()->role_id != 9 && Auth::user()->role_id != 10)
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts0" aria-expanded="false"
                                aria-controls="collapseLayouts0">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Settings
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts0" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    @if (Auth::user()->role_id == 0)
                                        <a class="nav-link" href="{{ route('role.view') }}">Roles</a>
                                    @endif
                                    @if (Auth::user()->role_id == 0 ||
                                            Auth::user()->role_id == 1 ||
                                            Auth::user()->role_id == 5 ||
                                            Auth::user()->role_id == 6 ||
                                            Auth::user()->role_id == 7 ||
                                            Auth::user()->role_id == 8 ||
                                            Auth::user()->role_id == 11)
                                        <a class="nav-link" href="{{ route('result.view') }}">Result</a>
                                    @endif
                                    @if (Auth::user()->role_id == 0 ||
                                            Auth::user()->role_id == 1 ||
                                            Auth::user()->role_id == 2 ||
                                            Auth::user()->role_id == 3 ||
                                            Auth::user()->role_id == 4)
                                        <a class="nav-link" href="{{ route('users.view') }}">Users</a>
                                    @endif
                                </nav>
                            </div>
                        @endif
                        @if (Auth::user()->role_id != 2 && Auth::user()->role_id != 3 && Auth::user()->role_id != 4)
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts1" aria-expanded="false"
                                aria-controls="collapseLayouts0">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Lookup
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts1" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('grade.view') }}">Grades</a>
                                    <a class="nav-link" href="{{ route('email_type.view') }}">Email Type</a>
                                    <a class="nav-link" href="{{ route('color.view') }}">Colors</a>
                                    <a class="nav-link" href="{{ route('class.view') }}">Class</a>
                                    <a class="nav-link" href="{{ route('assessment_type.view') }}">Assessment
                                        Type</a>
                                    <a class="nav-link" href="{{ route('ninty_five.view') }}">Ninty Five</a>
                                    <a class="nav-link" href="{{ route('organization_type.view') }}">Organization
                                        Type</a>
                                    <a class="nav-link" href="{{ route('assessment.view') }}">Assessments</a>
                                    <a class="nav-link" href="{{ route('assessment_evaluate.view') }}">Assessments
                                        Evaluates</a>
                                    {{-- <a class="nav-link" href="{{ route('gender.view') }}">Gender</a> --}}
                                    <a class="nav-link" href="{{ route('event_catagory.view') }}">Event Category</a>
                                    <a class="nav-link" href="{{ route('event_type.view') }}">Event Type</a>
                                    <a class="nav-link" href="{{ route('contact.view') }}">Contact</a>
                                    <a class="nav-link" href="{{ route('contact_type.view') }}">Contact Type</a>
                                </nav>
                            </div>

                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts2" aria-expanded="false"
                                aria-controls="collapseLayouts0">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Organizations
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts2" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('organization.view') }}">Organizations</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts3" aria-expanded="false"
                                aria-controls="collapseLayouts0">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Facilitators
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts3" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('facilitator.view') }}">Facilitators</a>
                                    <a class="nav-link" href="{{ route('facilitator_class.view') }}">Facilitator
                                        Class</a>
                                </nav>
                            </div>
                            @if (Auth::user()->role_id != 10)
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                    data-bs-target="#collapseLayouts4" aria-expanded="false"
                                    aria-controls="collapseLayouts0">
                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                    Participants
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapseLayouts4" aria-labelledby="headingOne"
                                    data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="{{ route('participant_type.view') }}">Participant
                                            Type</a>
                                        <a class="nav-link" href="{{ route('participant.view') }}">Participants</a>
                                        <a class="nav-link" href="{{ route('participant_email.view') }}">Participants
                                            Email</a>
                                    </nav>
                                </div>
                            @endif

                            @if (Auth::user()->role_id != 7 && Auth::user()->role_id != 8 && Auth::user()->role_id != 9)
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                    data-bs-target="#collapseLayouts5" aria-expanded="false"
                                    aria-controls="collapseLayouts0">
                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                    Groups
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapseLayouts5" aria-labelledby="headingOne"
                                    data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="{{ route('group.view') }}">Groups</a>
                                        {{-- <a class="nav-link" href="{{ route('group_organization.view') }}">GroupsOrganization</a>
                                        <a class="nav-link" href="{{ route('group_facilitator.view') }}">GroupsFacilitator</a>
                                        <a class="nav-link" href="{{ route('group_gender.view') }}">Groups Gender</a>
                                        <a class="nav-link" href="{{ route('group_grade.view') }}">Groups Grade</a>
                                        <a class="nav-link" href="{{ route('group_class.view') }}">Groups Class</a> --}}
                                    </nav>
                                </div>
                            @endif
                            @if (Auth::user()->role_id != 7 &&
                                    Auth::user()->role_id != 8 &&
                                    Auth::user()->role_id != 9 &&
                                    Auth::user()->role_id != 10)
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                    data-bs-target="#collapseLayouts6" aria-expanded="false"
                                    aria-controls="collapseLayouts0">
                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                    Events
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapseLayouts6" aria-labelledby="headingOne"
                                    data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="{{ route('event.view') }}">Events</a>
                                        <a class="nav-link" href="{{ route('event_assessment.view') }}">Events
                                            Assessment</a>
                                    </nav>
                                </div>
                            @endif

                            @if (Auth::user()->role_id == 0)
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                    data-bs-target="#collapseLayouts7" aria-expanded="false"
                                    aria-controls="collapseLayouts0">
                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                    Settings
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapseLayouts7" aria-labelledby="headingOne"
                                    data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="{{ route('faq.view') }}">Faq's</a>
                                        <a class="nav-link" href="{{ route('logo.view') }}">Logo</a>

                                    </nav>
                                </div>
                            @endif

                        @endif
                    </div>
                </div>
                <div class="sb-sidenav-footer text-white">
                    <div class="small">Logged in as:</div>
                    @if (Auth::user()->role_id == 0)
                        Main Admin
                    @endif
                    @if (Auth::user()->role_id == 1)
                        System Manager
                    @endif
                    @if (Auth::user()->role_id == 2)
                        Manage Roles
                    @endif
                    @if (Auth::user()->role_id == 3)
                        Manage Profiles
                    @endif
                    @if (Auth::user()->role_id == 4)
                        Manage Guests
                    @endif
                    @if (Auth::user()->role_id == 5)
                        Application Manager
                    @endif
                    @if (Auth::user()->role_id == 6)
                        Manage Organizations
                    @endif
                    @if (Auth::user()->role_id == 7)
                        Manage Facilitators
                    @endif
                    @if (Auth::user()->role_id == 8)
                        Manage Participants
                    @endif
                    @if (Auth::user()->role_id == 9)
                        Manage Classes
                    @endif
                    @if (Auth::user()->role_id == 10)
                        Manage Groups
                    @endif
                    @if (Auth::user()->role_id == 11)
                        Manage Events
                    @endif
                    {{-- {{ Auth::user()->role_id == 1 ? 'System Manager'}} --}}
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            @yield('content')
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-center small">
                        <div class="text-muted">Copyright &copy; <strong>Spectrum-8</strong> 2022</div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous">
    </script>
    <script src="{{ asset('front/js/scripts.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="{{ asset('front/assets/demo/chart-area-demo.js') }}"></script>
    <script src="{{ asset('front/assets/demo/chart-bar-demo.js') }}"></script>

    {{-- <script src="https://cdn.datatables.net/1.12.1/js/jquery.dataTables.min.js"></script> --}}
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
    <script src="{{ asset('front/js/datatables-simple-demo.js') }}"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>

    <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
    {{-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> --}}
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
    <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
    <script src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
    <script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.4.0/js/dataTables.buttons.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.4.0/js/buttons.flash.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.4.0/js/buttons.html5.min.js"></script>
    <script src="https://cdn.datatables.net/buttons/1.4.0/js/buttons.print.min.js"></script>


    <script>
        $(function() {


            $('input[name="daterange"]').daterangepicker({
                autoUpdateInput: false,
                locale: {
                    cancelLabel: 'Clear'
                }
            });

            $('input[name="daterange"]').on('apply.daterangepicker', function(ev, picker) {
                $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format(
                    'MM/DD/YYYY'));
            });

            $('input[name="daterange"]').on('cancel.daterangepicker', function(ev, picker) {
                $(this).val('');
            });

        });
        $(document).ready(function() {
            $('.alert.status').hide();
            $('.status_change').change(function() {
                var data_val = $(this).val();
                var id = $(this).data(id);
                var route = $(this).data(route);
                $.ajax({
                    type: "GET",
                    url: route.route,
                    data: {
                        'id': id,
                        'data_val': data_val
                    },
                    success: function(data) {
                        $('.alert.status').show();
                        $('.alert.status strong').text(data.success);
                        setTimeout(() => {
                            $('.alert.status').hide();
                        }, 2000);
                    }
                });
            });
            $('.toggle_area').hide();
            $('.gender_area').hide();
            $('.grade_dd').change(function() {
                var data_val = $(this).val();
                $.ajax({
                    type: "GET",
                    url: '{{ route('getGroups') }}',
                    data: {
                        'data_val': data_val
                    },
                    success: function(response) {
                        $('.toggle_area').show();
                        var options;
                        $.each(response.data, function(key, value) {
                            options = options + '<option value="' + value.id + '">' +
                                value.Name + " - " + value.Abbr + '</option>';
                        });
                        var skillhtml =
                            '<label class="mb-2" for="groups_filter">Group</label><select id="groups_filter" name="group"><option disabled selected>Select Group</option>' +
                            options + '</select>';
                        $(".toggle_area").html(skillhtml);
                        var group_val = $('.get_grade_val').val();
                        $('.toggle_area select option[value="' + group_val + '"]').attr(
                            'selected', true);

                        $('#groups_filter').change(function() {
                            var data_val = $(this).val();
                            $.ajax({
                                type: "GET",
                                url: '{{ route('getGender') }}',
                                data: {
                                    'data_val': data_val
                                },
                                success: function(response) {
                                    $('.gender_area').show();
                                    var responce = response.data;
                                    var gender_val = $('.get_gender_val')
                                        .val();
                                    if (gender_val == 'Male') {
                                        $('.gender_area .male').prop(
                                            'checked', true);
                                    } else if (gender_val == 'Female') {
                                        $('.gender_area .female').prop(
                                            'checked', true);
                                    }

                                    if (responce.group_type == 'Male') {
                                        $('.gender_area .male').prop(
                                            'checked', true);
                                        $('.gender_area .female').prop(
                                            'disabled', true);
                                        $('.gender_area .male').prop(
                                            'disabled', false);
                                        $('.gender_area .female').prop(
                                            'checked', false);
                                    } else if (responce.group_type ==
                                        'Female') {
                                        $('.gender_area .female').prop(
                                            'checked', true);
                                        $('.gender_area .male').prop(
                                            'disabled', true);
                                        $('.gender_area .female').prop(
                                            'disabled', false);
                                        $('.gender_area .male').prop(
                                            'checked', false);
                                    } else {
                                        $('.gender_area .male').prop(
                                            'checked', false);
                                        $('.gender_area .female').prop(
                                            'checked', false);
                                        $('.gender_area .male').prop(
                                            'disabled', false);
                                        $('.gender_area .female').prop(
                                            'disabled', false);
                                    }
                                }
                            });
                        });

                    }
                });
            });




            // $('.toggle_area_filter').hide();
            $('.grade_dd_filter').change(function() {
                var data_val = $(this).val();
                $.ajax({
                    type: "GET",
                    url: '{{ route('getGroups') }}',
                    data: {
                        'data_val': data_val
                    },
                    success: function(response) {
                        var options;
                        $.each(response.data, function(key, value) {
                            options = options + '<option value="' + value.id + '">' +
                                value.Name + " - " + value.Abbr + '</option>';
                        });
                        var skillhtml =
                            '<select id="inputState" name="group"><option disabled selected>Select All Group</option>' +
                            options + '</select>';
                        $(".toggle_area_filter").html(skillhtml);
                        var group_val = $('.get_group_val').val();
                        $('.toggle_area_filter select option[value="' + group_val + '"]').attr(
                            'selected', true);
                    }
                });
            });

            // this jquery run on 2 places one is participant and 2nd is assign.blade.php

            $('.facilitator_assign_area_main').hide();
            $('.organization_assign').change(function() {
                var data_val = $(this).val();
                $.ajax({
                    type: "GET",
                    url: '{{ route('participant.find_facilitator') }}',
                    data: {
                        'data_val': data_val
                    },
                    success: function(response) {
                        $('.facilitator_assign_area_main').show();
                        var options;
                        $.each(response.data, function(key, value) {
                            options = options + '<option value="' + value.id + '">' +
                                value.Firstname + " - " + value.Lastname + '</option>';
                        });
                        var skillhtml =
                            ' <select id="inputState" name="facilitator" required><option disabled selected value="">Select Facilitator</option>' +
                            options + '</select>';
                        $(".facilitator_assign_area").html(skillhtml);
                        $(".facilitator_area_participant").html(skillhtml);
                        var facilitator_val = $('.get_facilitator_val').val();
                        $('.facilitator_assign_area select option[value="' + facilitator_val +
                            '"]').attr(
                            'selected', true);
                        $('.facilitator_area_participant option[value="' + facilitator_val +
                            '"]').attr(
                            'selected', true);
                    }
                });
            });

            $('.organization_for_events').change(function() {
                var data_val = $(this).val();
                $.ajax({
                    type: "GET",
                    url: '{{ route('facilitator.find_event') }}',
                    data: {
                        'data_val': data_val
                    },
                    success: function(response) {
                        var options;
                        $.each(response.data, function(key, value) {
                            options = options + '<option value="' + value.id + '">' +
                                value.Name + '</option>';
                        });
                        var skillhtml =
                            '  <select class="js-example-basic-multiple" id="inputState" name="events[]" multiple="multiple">' +
                            options + '</select>';
                        $(".events_assign_area").html(skillhtml);
                        var facilitator_val = $('.get_facilitator_val').val();
                        $('.facilitator_assign_area select option[value="' + facilitator_val +
                            '"]').attr(
                            'selected', true);
                        $('.js-example-basic-multiple').select2();
                    }
                });
            });
            // this jquery run on 2 places one is participant and 2nd is assign.blade.php

            $('.hide_for_duration').hide();
            $('#assessment_score_type').change(function() {
                var data_val = $(this).val();
                $.ajax({
                    type: "GET",
                    url: '{{ route('getAssessmentType') }}',
                    data: {
                        'data_val': data_val
                    },
                    success: function(response) {
                        if (response.data[0].Type == "Duration") {
                            $('.hide_for_duration').show();
                            $('.hide_for_duration input').attr('required', true);
                        } else {
                            $('.hide_for_duration').hide();
                            $('.hide_for_duration input').attr('required', false);
                        }
                    }
                });
            });

        });
        // setTimeout(() => {
        //     $('.alert').hide();
        // }, 2000);
        // $("#duration").val("00:00:00:AM");
    </script>

    <script>
        $(document).ready(function() {
            $('.js-example-basic-multiple').select2();
        });
        // $(document).ready( function () {
        //     $('#datatablesSimple').DataTable();
        // } );
        // $('#datatablesSimple').DataTable();

        $(document).ready(function() {
            $('#resultTable.set_result').DataTable({
                dom: 'Bfrtip',
                buttons: [{
                    extend: 'excel',
                    text: 'Export Result'
                }],
                ordering: true,
            });
            $('#datatablesSimple').DataTable({
                ordering: true,
            });
            $('#datatablesSimple').wrapAll('<div class="set_table"></div>')
            $('#resultTable.set_result').wrapAll('<div class="set_table"></div>')
        });

        $(".select_all").click(function() {
            $('input[name="bulk_action[]"]').prop('checked', this.checked);
        });
    </script>

    @if (isset($scoring_edit))
        <script>
            $(document).ready(function() {
                $('#assessment_score_type').change();
            });
        </script>
    @endif
    @if (isset($participant_edit) || isset($contact_edit))
        <script>
            $(document).ready(function() {
                $('.grade_dd').change();
                setTimeout(() => {
                    ($('#groups_filter').change());
                }, 500);

                $('.organization_assign').change();
                setTimeout(() => {
                    ($('.facilitator_area_participant option').attr('selected', false));
                    var facilitator_val = $('.get_facilitator_val').val();
                    var abc = $('.facilitator_area_participant option[value="' + parseInt(facilitator_val) +
                        '"]').prop('selected', true);
                }, 1000);
            });
        </script>
    @endif
    @if (isset($group_id) || isset($grade_id))
        <script>
            $(document).ready(function() {
                $('.grade_dd_filter').change();
            });
        </script>
    @endif
    @if (isset($facilitate_edit) && $facilitate_edit->facilitator_id != null)
        <script>
            $(document).ready(function() {
                $('.facilitator').click();
            });
        </script>
    @endif
    @if (isset($groups_edit->group_facilitator_web))
        <script>
            $(document).ready(function() {
                $('.organization_assign').click();
            });
        </script>
    @endif
    @if (isset($groups_edit) || isset($groups_edit->group_facilitator_web))
        <script>
            $(document).ready(function() {
                $('.organization_assign').change();
                setTimeout(() => {
                    ($('.facilitator_area_participant option').attr('selected', false));
                    var facilitator_val = $('.get_facilitator_val').val();
                    var abc = $('.facilitator_area_participant option[value="' + parseInt(facilitator_val) +
                        '"]').prop('selected', true);
                }, 500);
            });
        </script>
    @endif
    <script type="text/javascript">
        $(document).ready(function(e) {


            $('#image').change(function() {

                let reader = new FileReader();

                reader.onload = (e) => {

                    $('#preview-image-before-upload').attr('src', e.target.result);
                }

                reader.readAsDataURL(this.files[0]);

            });

        });

        $('.organization_area').hide();
        $('.organization').click(function() {
            if (this.value == "sub") {
                $('.organization_area select').attr('required', true);
                $('.organization_area').show();
            }
            if (this.value == "parent") {
                $('.organization_area select').attr('required', false);
                $('.organization_area').hide();
            }
        });

        @if (isset($organization_edit) && $organization_edit->ParentOrganizationID != null)
            $('.organization_area').show();
        @endif
        @if (isset($facilitator_edit))
            $(document).ready(function() {
                // setTimeout(() => {
                $('.organization_for_events').change();
                // }, 1000);
                var inputs = $(".event_id_edit");
                var arr = [];
                setTimeout(() => {
                    ($('.events_assign_area select option').attr('selected', false));
                    for (var i = 0; i < inputs.length; i++) {
                        var arr_push = $(inputs[i]).val();
                        var abc = $('.events_assign_area select option[value="' + parseInt(arr_push) + '"]')
                            .prop('selected', true).trigger("change");
                    }
                }, 500);
            });
        @endif
    </script>
    {{-- for groups --}}
    <script>
        $('.select_all_check').click(function() {
            var get_val = $(this).val();
            var parent = $(this).parent();
            var child = parent.find('option')
            if (get_val == "not") {
                var this_attr1 = $(this).parent().find('option[value="not"]');
                $(this_attr1).prop('value', "");
            }
            if (get_val == "all") {
                child.prop('selected', true);
                var this_attr = $(this).parent().find('option[value="all"]');
                $(this_attr).prop('selected', false);
            }
            // .find('option')
        })
        $('.organization_assign_group').change(function() {
            var data_val = $(this).val();
            $.ajax({
                type: "GET",
                url: '{{ route('group.find_facilitator') }}',
                data: {
                    'data_val': data_val
                },
                success: function(response) {
                    if (response.select_all == "no") {

                        var a = response?.data?.map((i, e) => {
                            return i;
                        })
                        var b = response.data[0].concat(response.data[1])
                        var arr = [];

                        for (let j = 0; j < response.data.length; j++) {
                            if (response.data.length === 1) {
                                arr = response.data[j]
                            } else {

                                arr = arr.concat(response.data[j])
                            }
                        }
                        arr = arr.filter((v, i, a) => a.findIndex(v2 => (v2.id === v.id)) === i)
                    } else {
                        arr = response.data;
                    }
                    var options;
                    $.each(arr, function(key, value) {
                        options = options + '<option value="' + value.id + '">' +
                            value.Firstname + " - " + value.Lastname + '</option>';
                    });
                    var skillhtml =
                        ' <select id="inputState" name="facilitator" required><option value="all">Select All</option>' +
                        options + '</select>';
                    $(".facilitator_area_group").html(skillhtml);
                    var facilitator_val = $('.get_facilitator_val_group').val();
                    $('.facilitator_area_group option[value="' + facilitator_val +
                        '"]').attr(
                        'selected', true);
                }
            });
        });
    </script>
    @if (isset($groups_edit))
        <script>
            $(document).ready(function() {
                $('.organization_assign_group').change();
                var inputs = $(".facilitator_id_edit_for_group");
                var arr = [];
                setTimeout(() => {
                    ($('.facilitator_area_group option').attr('selected', false));
                    for (var i = 0; i < inputs.length; i++) {
                        var arr_push = $(inputs[i]).val();
                        console.log(arr_push);
                        var abc = $('.facilitator_area_group option[value="' + parseInt(arr_push) + '"]')
                            .prop('selected', true);
                    }
                }, 500);
            });
        </script>
    @endif
    {{-- for groups --}}
</body>

</html>
