<!DOCTYPE html>
<html lang="en">

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Skydash Admin</title>
    <!-- plugins:css -->
    <link rel="stylesheet" href="{{URL::asset('admin/vendors/feather/feather.css')}}">
    <link rel="stylesheet" href="{{URL::asset('admin/vendors/ti-icons/css/themify-icons.css')}}">
    <link rel="stylesheet" href="{{URL::asset('admin/vendors/css/vendor.bundle.base.css')}}">
    <!-- endinject -->
    <!-- Plugin css for this page -->
    <link rel="stylesheet" href="{{URL::asset('admin/vendors/datatables.net-bs4/dataTables.bootstrap4.css')}}">
    <link rel="stylesheet" href="{{URL::asset('admin/vendors/ti-icons/css/themify-icons.css')}}">
    <link rel="stylesheet" type="text/css" href="{{URL::asset('admin/js/select.dataTables.min.css')}}">
    <!-- End plugin css for this page -->
    <!-- inject:css -->
    <link rel="stylesheet" href="{{URL::asset('admin/css/vertical-layout-light/style.css')}}">
    <!-- endinject -->
    <link rel="shortcut icon" href="{{URL::asset('admin/images/favicon.png')}}" />
</head>
<body>
<div class="container-scroller">
    <!-- partial:partials/_navbar.html -->
  @include('admin.layout.header')
    <!-- partial -->
    <div class="container-fluid page-body-wrapper">
        <!-- partial:partials/_sidebar.html -->
       @include('admin.layout.sidebar');
        <!-- partial -->
        <!-- main-panel ends -->
       @yield('content')
        <!-- main-panel ends -->
    </div>
    <!-- page-body-wrapper ends -->
</div>
<!-- container-scroller -->

<!-- plugins:js -->
<script src="{{URL::asset('admin/vendors/js/vendor.bundle.base.js')}}"></script>
<!-- endinject -->
<!-- Plugin js for this page -->
<script src="{{URL::asset('admin/vendors/chart.js/Chart.min.js')}}"></script>
<script src="{{URL::asset('admin/vendors/datatables.net/jquery.dataTables.js')}}"></script>
<script src="{{URL::asset('admin/vendors/datatables.net-bs4/dataTables.bootstrap4.js')}}"></script>
<script src="{{URL::asset('admin/js/dataTables.select.min.js')}}"></script>

<!-- End plugin js for this page -->
<!-- inject:js -->
<script src="{{URL::asset('admin/js/off-canvas.js')}}"></script>
<script src="{{URL::asset('admin/js/hoverable-collapse.js')}}"></script>
<script src="{{URL::asset('admin/js/template.js')}}"></script>
<script src="{{URL::asset('admin/js/settings.js')}}"></script>
<script src="{{URL::asset('admin/js/todolist.js')}}"></script>
<!-- endinject -->
<!-- Custom js for this page-->
<script src="{{URL::asset('admin/js/dashboard.js')}}"></script>
<script src="{{URL::asset('admin/js/Chart.roundedBarCharts.js')}}"></script>
<!-- End custom js for this page-->
</body>

</html>

