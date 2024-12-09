<section class="ourAthletesSection" id="ourAthletesSection">
    <div class="container">
        <div class="sectionHeading">
            <h1>Our Athletes</h1>
        </div>
        <div class="athletesList">
            @foreach($athletes as $a => $athlete)
                <div class="athletesCard">
                    <img src="{{ General::renderImage($athlete->image ?? '')}}" alt="Image-Athlete">
                    <div class="athleteContent">
                        <p>{{ $athlete->title ?? ''}}</p>
                        <a href="{{ url('/')}}#enterMailSection" class="outlineBtn">See More</a>
                        {{-- <button class="outlineBtn">See More</button> --}}
                    </div>
                </div>
            @endforeach
            {{-- <div class="athletesCard">
                <img src="{{ url('frontend/assets/images/sportImg2.png')}}" alt="">
                <div class="athleteContent">
                    <p>FIELD HOCKEY</p>
                    <button class="outlineBtn">See More</button>
                </div>
            </div>
            <div class="athletesCard">
                <img src="{{ url('frontend/assets/images/sportImg3.png')}}" alt="">
                <div class="athleteContent">
                    <p>WOMEN’S SOCCER</p>
                    <button class="outlineBtn">See More</button>
                </div>
            </div> --}}
        </div>
    </div>
</section>