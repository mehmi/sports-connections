<section class="bannerSection" id="homeSection">
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <div class="bannerContent">
                    <h1>{{ $content['banner']['title'] ?? ''}}</h1>
                    <p>
                        {{ $content['banner']['description']}}
                    </p>
                    <div class="bannerBtnsWrap">
                        <a href="{{ url('/')}}#enterMailSection" class="themeBtn">Change your life now!</a>
                        <button class="secondaryBtn">Qualify for a scholarship</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>