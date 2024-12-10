<section class="pickYourSportSection" id="sportsSection">
        <div class="container">
            <div class="sectionHeading">
                <h1>{{ $content['sports']['title'] ?? ''}}</h1>
                <p class="sectionSubHd">
                    {{ $content['sports']['description'] ?? ''}}
                </p>
            </div>
            <div class="sportsWrap">
                <div class="row">
                    @foreach($sports as $s => $sport)
                    @php
                        if ($s == 0) {
                            $slider = 'sportSplideA';
                        } elseif ($s == 1) {
                            $slider = 'sportSplideB';
                        } else {
                            $slider = 'sportSplideC';
                        }
                    @endphp

                    <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                        <div class="sportsSliderWrap">
                            <div class="splide {{ $slider}} sportSlider" aria-labelledby="carousel-heading">
                                <div class="splide__track">
                                    <ul class="splide__list">
                                        @foreach($sport->image as $si => $img)
                                            <li class="splide__slide">
                                                <div class="sportSliderItem">
                                                    <img src="{{ General::renderImage($img ?? '')}}" alt="Sport A" class="sportImg">
                                                </div>
                                            </li>
                                        @endforeach
                                       {{--  <li class="splide__slide">
                                            <div class="sportSliderItem">
                                                <img src="{{ url('frontend/assets/images/sportImg2.png')}}" alt="Sport B" class="sportImg">
                                            </div>
                                        </li>
                                        <li class="splide__slide">
                                            <div class="sportSliderItem">
                                                <img src="{{ url('frontend/assets/images/sportImg3.png')}}" alt="Sport C" class="sportImg">
                                            </div>
                                        </li> --}}
                                    </ul>
                                </div>
                            </div>
                            <div class="sportsSliderTxt">
                                <h6>{{ $sport->title ?? ''}}</h6>
                                <p>{{ $sport->description ?? ''}}</p>
                            </div>
                            <button class="outlineBtn">Start here</button>
                        </div>
                    </div>
                    @endforeach
                    {{-- <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                        <div class="sportsSliderWrap">
                            <div class="splide sportSplideB sportSlider" aria-labelledby="carousel-heading">
                                <div class="splide__track">
                                    <ul class="splide__list">
                                        <li class="splide__slide">
                                            <div class="sportSliderItem">
                                                <img src="{{ url('frontend/assets/images/sportImg2.png')}}" alt="Sport B" class="sportImg">
                                            </div>
                                        </li>
                                        <li class="splide__slide">
                                            <div class="sportSliderItem">
                                                <img src="{{ url('frontend/assets/images/sportImg1.png')}}" alt="Sport A" class="sportImg">
                                            </div>
                                        </li>
                                        <li class="splide__slide">
                                            <div class="sportSliderItem">
                                                <img src="{{ url('frontend/assets/images/sportImg3.png')}}" alt="Sport C" class="sportImg">
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sportsSliderTxt">
                                <h6>FIELD HOCKEY</h6>
                                <p>Seamlessly work with your partners, vendors.</p>
                            </div>
                            <button class="outlineBtn">Start here</button>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6 col-sm-6 col-12">
                        <div class="sportsSliderWrap">
                            <div class="splide sportSplideC sportSlider" aria-labelledby="carousel-heading">
                                <div class="splide__track">
                                    <ul class="splide__list">
                                        <li class="splide__slide">
                                            <div class="sportSliderItem">
                                                <img src="{{ url('frontend/assets/images/sportImg3.png')}}" alt="Sport C" class="sportImg">
                                            </div>
                                        </li>
                                        <li class="splide__slide">
                                            <div class="sportSliderItem">
                                                <img src="{{ url('frontend/assets/images/sportImg2.png')}}" alt="Sport B" class="sportImg">
                                            </div>
                                        </li>
                                        <li class="splide__slide">
                                            <div class="sportSliderItem">
                                                <img src="{{ url('frontend/assets/images/sportImg1.png')}}" alt="Sport A" class="sportImg">
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div class="sportsSliderTxt">
                                <h6>WOMEN’S SOCCER</h6>
                                <p>Seamlessly work with your partners, vendors.</p>
                            </div>
                            <button class="outlineBtn">Start here</button>
                        </div>
                    </div> --}}
                </div>
            </div>
            <div class="sportsBtnWrap">
                <button class="secondaryBtn">See if you qualify for a scholarship</button>
            </div>
        </div>
    </section>