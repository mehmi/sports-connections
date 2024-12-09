<section class="successStoriesSection" id="successStoriesSection">
    <div class="container">
        <div class="sectionHeading">
            <h1>SUCCESS STORIES</h1>
        </div>
        <div class="splide successStoriesSwiper" aria-labelledby="carousel-heading">
            <div class="splide__track">
                <ul class="splide__list">
                    @foreach($success as $s => $success)
                    <li class="splide__slide">
                        <div class="sportSliderItem">
                            <div class="successStoriesTxtWrap">
                                <h6>{{ $success->title ?? ''}}</h6>
                                <h2>{{ $success->sub_title ?? ''}}</h2>
                                <p>“{{ $success->description ?? ''}}”</p>
                            </div>
                            <img src="{{ General::renderImage($success->image ?? '')}}" alt="Sport C" class="sportImg">
                        </div>
                    </li>
                    @endforeach
                    {{-- <li class="splide__slide">
                        <div class="sportSliderItem">
                            <div class="successStoriesTxtWrap">
                                <h6>Lorem ipsum dolor sit amet, consectetur</h6>
                                <h2>Lorem ipsum dolor sit amet, consectetur</h2>
                                <p>“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
                                    nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                                    fugiat nulla pariatur.”</p>
                            </div>
                            <img src="{{ url('frontend/assets/images/sportImg2.png')}}" alt="Sport B" class="sportImg">
                        </div>
                    </li>
                    <li class="splide__slide">
                        <div class="sportSliderItem">
                            <div class="successStoriesTxtWrap">
                                <h6>Lorem ipsum dolor sit amet, consectetur</h6>
                                <h2>Lorem ipsum dolor sit amet, consectetur</h2>
                                <p>“Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor
                                    incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis
                                    nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.
                                    Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu
                                    fugiat nulla pariatur.”</p>
                            </div>
                            <img src="{{ url('frontend/assets/images/sportImg1.png')}}" alt="Sport A" class="sportImg">
                        </div>
                    </li> --}}
                </ul>
            </div>
        </div>
    </div>
</section>