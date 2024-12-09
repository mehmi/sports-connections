<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="{{ url('frontend/assets/images/favicon.png')}}">
    <title>Sports Connection</title>
    <link rel="stylesheet" href="{{ url('frontend/assets/css/splide.min.css')}}">
    <link rel="stylesheet" href="{{ url('frontend/assets/css/bootstrap.min.css')}}">
    <link rel="stylesheet" href="{{ url('frontend/assets/css/style.css')}}">
    <link rel="stylesheet" href="{{ url('frontend/assets/css/responsive.css')}}">
</head>

<body>
    <!-- Header starts -->
    @include('frontend.partials.header')
    <!-- Header ends -->

	@yield('content')

    <!-- Footer section -->
     @include('frontend.partials.footer')

    <!-- Get College Degree Section End -->
    <script src="{{ url('frontend/assets/js/splide.min.js')}}"></script>
    <script src="{{ url('frontend/assets/js/owl.carousel.min.js')}}"></script>
    <script src="{{ url('frontend/assets/js/bootstrap.bundle.min.js')}}"></script>
    <script src="{{ url('frontend/assets/js/scrips.js')}}"></script>
    <script src="{{ url('frontend/assets/js/developer.js')}}"></script>
</body>

</html>