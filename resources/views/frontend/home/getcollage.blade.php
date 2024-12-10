<section class="GetCollegeDegreeSection" id="GetCollegeDegreeSection">
    <div class="container">
        <div class="getDegreeTxtWrap">
            <h1>{{ $content['degree']['title'] ?? ''}}</h1>
            <p>{{ $content['degree']['description'] ?? ''}}</p>
        </div>
        <div class="getDegreeBtns">
            <button class="themeBtn">
                Find out which schools are good fit for you
                <svg width="10" height="17" viewBox="0 0 10 17" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M1.75 16.625C1.43359 16.625 1.15234 16.5195 0.941406 16.3086C0.484375 15.8867 0.484375 15.1484 0.941406 14.7266L6.88281 8.75L0.941406 2.80859C0.484375 2.38672 0.484375 1.64844 0.941406 1.22656C1.36328 0.769531 2.10156 0.769531 2.52344 1.22656L9.27344 7.97656C9.73047 8.39844 9.73047 9.13672 9.27344 9.55859L2.52344 16.3086C2.3125 16.5195 2.03125 16.625 1.75 16.625Z"
                        fill="#FCFCFD" />
                </svg>
            </button>
            <button class="secondaryBtn">
                Learn more
            </button>
        </div>
    </div>
</section>