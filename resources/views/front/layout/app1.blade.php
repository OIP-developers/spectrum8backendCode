<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Spectrum-8 | @if (Auth::user()->role_id == 1)
            Super Admin
        @elseif(Auth::user()->role_id == 2)
            Admin
        @elseif(Auth::user()->role_id == 3)
            Sub Admin
        @elseif(Auth::user()->role_id == 4)
            Facilitator
        @elseif(Auth::user()->role_id == 5)
            Facilitator Assisstant
        @elseif(Auth::user()->role_id == 6)
            User
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

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3"
            href="@if (Auth::user()->role_id == 1) {{ route('organization.view') }}@elseif(Auth::user()->role_id == 2){{ route('suborg.view') }} @else{{ route('result.view') }} @endif">Spectrum
            8</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        {{-- <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
                <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..." aria-describedby="btnNavbarSearch" />
                    <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i class="fas fa-search"></i></button>
                </div>
            </form> --}}
        <!-- Navbar-->
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
                        {{-- <div class="sb-sidenav-menu-heading">Dashboard</div>
                        <a class="nav-link" href="{{ route('dashboard') }}">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Dashboard
                        </a> --}}
                        @if (Auth::check() && (Auth::user()->role_id != 1 && Auth::user()->role_id != 2))
                            <div class="sb-sidenav-menu-heading">Results</div>
                            <a class="nav-link collapsed" href="{{ route('result.view') }}">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Results
                            </a>
                            {{-- @if (Auth::user()->role_id == 5) --}}
                            <div class="sb-sidenav-menu-heading">Facilitators</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Facilitators
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('facilitate.view') }}">View</a>
                                    <a class="nav-link" href="{{ route('facilitate.form') }}">Add</a>
                                </nav>
                            </div>
                        @endif


                        @if (Auth::check() && Auth::user()->role_id == 1)
                            <div class="sb-sidenav-menu-heading">Organizations</div>
                            {{-- @if (checkSubOrg()[1]->email == 'superadmin@gmail.com' || checkSubOrg()[0]->IsOrgAdmin == 'true') --}}
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts11" aria-expanded="false"
                                aria-controls="collapseLayouts11">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Organizations
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts11" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('organization.view') }}">View</a>
                                    {{-- <a class="nav-link" href="{{ route('organization.form') }}">Add</a> --}}
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Facilitators</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts" aria-expanded="false"
                                aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Facilitators Requests
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('facilitate.view.admin') }}">View</a>
                                </nav>
                            </div>
                        @endif

                        @if (Auth::check() && Auth::user()->role_id == 2)
                            <div class="sb-sidenav-menu-heading">Sub Organizations</div>
                            {{-- @if (checkSubOrg()[1]->email == 'superadmin@gmail.com' || checkSubOrg()[0]->IsOrgAdmin == 'true') --}}
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts11" aria-expanded="false"
                                aria-controls="collapseLayouts11">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Sub Organizations
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts11" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('suborg.view') }}">View</a>
                                    <a class="nav-link" href="{{ route('suborg.form') }}">Add</a>
                                </nav>
                            </div>
                        @endif
                        @if (Auth::check() && (Auth::user()->role_id == 1 || Auth::user()->role_id == 3))
                            <div class="sb-sidenav-menu-heading">Assessments</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts0" aria-expanded="false"
                                aria-controls="collapseLayouts0">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Assessments
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts0" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('assessment.view') }}">View</a>
                                    <a class="nav-link" href="{{ route('assessment.form') }}">Add</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts1" aria-expanded="false"
                                aria-controls="collapseLayouts1">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Assessments Scoring
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts1" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('scoring.view') }}">View</a>
                                    <a class="nav-link" href="{{ route('scoring.form') }}">Add</a>
                                </nav>
                            </div>

                            {{-- <div class="sb-sidenav-menu-heading">Percentiles</div> --}}
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts8" aria-expanded="false"
                                aria-controls="collapseLayouts8">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Percentiles
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts8" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('percentile.view') }}">View</a>
                                    <a class="nav-link" href="{{ route('percentile.form') }}">Add</a>
                                </nav>
                            </div>

                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts2" aria-expanded="false"
                                aria-controls="collapseLayouts2">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Instruction
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts2" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('instruction.view') }}">View</a>
                                    <a class="nav-link" href="{{ route('instruction.form') }}">Add</a>
                                </nav>
                            </div>



                            {{-- <div class="sb-sidenav-menu-heading">Colors</div> --}}
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts3" aria-expanded="false"
                                aria-controls="collapseLayouts3">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Colors
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts3" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('color.view') }}">View</a>
                                    <a class="nav-link" href="{{ route('color.form') }}">Add</a>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Events</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts4" aria-expanded="false"
                                aria-controls="collapseLayouts4">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Events
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts4" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('event.view') }}">View</a>
                                    <a class="nav-link" href="{{ route('event.form') }}">Add</a>
                                </nav>
                            </div>




                            <div class="sb-sidenav-menu-heading">Grades</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts5" aria-expanded="false"
                                aria-controls="collapseLayouts5">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Grades
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts5" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('grade.view') }}">View</a>
                                    <a class="nav-link" href="{{ route('grade.form') }}">Add</a>
                                </nav>
                            </div>


                            <div class="sb-sidenav-menu-heading">Groups</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts6" aria-expanded="false"
                                aria-controls="collapseLayouts6">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Groups
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>


                            <div class="collapse" id="collapseLayouts6" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('group.view') }}">View</a>
                                    <a class="nav-link" href="{{ route('group.form') }}">Add</a>
                                </nav>
                            </div>
                            @if (Auth::check() && Auth::user()->role_id != 1)
                                <div class="sb-sidenav-menu-heading">Participants</div>
                                <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                    data-bs-target="#collapseLayouts7" aria-expanded="false"
                                    aria-controls="collapseLayouts7">
                                    <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                    Participants
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                </a>
                                <div class="collapse" id="collapseLayouts7" aria-labelledby="headingOne"
                                    data-bs-parent="#sidenavAccordion">
                                    <nav class="sb-sidenav-menu-nested nav">
                                        <a class="nav-link" href="{{ route('participant.view') }}">View</a>
                                        <a class="nav-link" href="{{ route('participant.form') }}">Add</a>
                                    </nav>
                                </div>
                            @endif
                        @endif

                        {{-- <div class="sb-sidenav-menu-heading">Archieved</div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapseLayouts11" aria-expanded="false" aria-controls="collapseLayouts11">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Archieved
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts11" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="{{ route('result.archieve') }}">Results</a>
                                <a class="nav-link" href="{{ route('facilitator.archieve') }}">Facilitator</a>
                                <a class="nav-link" href="{{ route('participant.archieve') }}">Participants</a>
                            </nav>
                        </div> --}}


                        @if (Auth::check() && Auth::user()->role_id == 1)
                            <div class="sb-sidenav-menu-heading">Settings</div>

                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts9" aria-expanded="false"
                                aria-controls="collapseLayouts9">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Faq's
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts9" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('faq.view') }}">View</a>
                                    <a class="nav-link" href="{{ route('faq.form') }}">Add</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                                data-bs-target="#collapseLayouts10" aria-expanded="false"
                                aria-controls="collapseLayouts10">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                Logo
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts10" aria-labelledby="headingOne"
                                data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="{{ route('logo.view') }}">View</a>
                                    {{-- <a class="nav-link" href="{{ route('logo.form') }}">Add</a> --}}
                                </nav>
                            </div>

                            {{-- @endif --}}
                        @endif

                        {{-- @if (Auth::check() && Auth::user()->role_id != 1)
                        <div class="sb-sidenav-menu-heading">Settings</div>
                        @endif
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapseLayouts12" aria-expanded="false" aria-controls="collapseLayouts12">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            Archive
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts12" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="{{ route('faq.view') }}">View</a>
                                <a class="nav-link" href="{{ route('faq.form') }}">Add</a>
                            </nav>
                        </div> --}}

                    </div>
                </div>
                <div class="sb-sidenav-footer text-white">
                    <div class="small">Logged in as:</div>
                    {{ Auth::user()->name }}
                </div>
            </nav>
        </div>
        <div id="layoutSidenav_content">
            <div class="alert alert-success alert-block status">
                <strong></strong>
            </div>
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
                        console.log(data);
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
                        // console.log(group_val)
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
                        // console.log(group_val)
                        $('.toggle_area_filter select option[value="' + group_val + '"]').attr(
                            'selected', true);
                    }
                });
            });
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
        setTimeout(() => {
            $('.alert').hide();
        }, 2000);
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
                ordering: false,
            });
            $('#datatablesSimple').DataTable({
                ordering: false,
            });
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
    @if (isset($participant_edit))
        <script>
            $(document).ready(function() {
                $('.grade_dd').change();
                setTimeout(() => {
                    ($('#groups_filter').change());
                }, 500);
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

        $('.facilitator_area').hide();
        $('.facilitator').click(function() {
            if (this.value == "assisstant") {
                $('.facilitator_area').show();
            }
            if (this.value == "facilitator") {
                $('.facilitator_area').hide();
            }
        });
    </script>
</body>

</html>
