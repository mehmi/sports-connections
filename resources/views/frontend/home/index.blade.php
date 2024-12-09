
@extends('layouts.frontlayout')
@section('content')

    <!-- Home Section Start-->
    @include('frontend.home.banner')
    <!-- Home Section End-->

    <!-- Sports Section Start-->
    @if(!empty($sports) && count($sports) > 0)
        @include('frontend.home.sport')
    @endif
    <!-- Sports Section End-->

    <!-- Get College Degree Section Start -->
    @include('frontend.home.getcollage')

    <!-- Faq Section -->
    @if(!empty($process) && count($process) > 0)
        @include('frontend.home.faq')
    @endif

    <!-- Our Athletes Section -->
    @if(!empty($athletes) && count($athletes) > 0)
        @include('frontend.home.athletes')
    @endif

    <!-- SUCCESS STORIES Section -->
    @if(!empty($success) && count($success) > 0)
        @include('frontend.home.success')
    @endif

    <!-- Our Team Section -->
    @if(!empty($team) && count($team) > 0)
        @include('frontend.home.team')
    @endif
    <!-- Start Your Journey Section -->
    @include('frontend.home.journey')

    <!-- Follow in the same Footsteps Section -->
    @include('frontend.home.contactus')
@endsection