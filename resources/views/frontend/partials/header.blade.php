<div class="headerWrap">
    <div class="container">
        <header class="d-flex flex-wrap justify-content-center py-3 mb-3">
            <a href="/"
                class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-body-emphasis text-decoration-none">
                <!-- <img src="/frontend/assets/images/Logo.png" class="headerLogo" /> -->
                <img src="{{ url('frontend/assets/images/Logo.png')}}" class="headerLogo" />
            </a>
            <div class="d-flex align-items-center rtLinksWrap">
                <div class="dropdown">
                    <button class="hdrLangbtn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        ENG
                        <svg width="18" height="14" viewBox="0 0 18 10" fill="none"
                            xmlns="http://www.w3.org/2000/svg">
                            <path d="M2 2L9.00062 8L16 2" stroke="#FCFCFD" stroke-width="2.71473"
                                stroke-linecap="round" />
                        </svg>
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">ENGLISH</a></li>
                        <li><a class="dropdown-item" href="#">HINDI</a></li>
                    </ul>
                </div>
                <span class="hdrLinksDivider"></span>
                <ul class="nav nav-pills headerRtLinks align-items-center gap-3">
                    <li class="nav-item"><a href="#" class="nav-link">FOR COACHES</a></li>
                    <li class="nav-item"><a href="#" class="themeBtn">START NOW</a></li>
                </ul>
            </div>
            <button class="respMobileMenu" data-bs-toggle="offcanvas" data-bs-target="#offcanvasWithBothOptions" aria-controls="offcanvasWithBothOptions">
                <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="white" class="size-6">
                    <path stroke-linecap="round" stroke-linejoin="round" d="M3.75 6.75h16.5M3.75 12h16.5m-16.5 5.25h16.5" />
                </svg>
            </button>
        </header>
        <div class="subHeader">
            <ul>
                <li><a href="#homeSection"><span>Home</span></a></li>
                <li><a href="#sportsSection"><span>sports</span></a></li>
                <li><a href="#GetCollegeDegreeSection"><span>journey</span></a></li>
                <li><a href=""><span>our atheletes</span></a></li>
                <li><a href=""><span>study in the usa</span></a></li>
                <li><a href="#ourTeamSection"><span>our team</span></a></li>
                <li><a href=""><span>contact us</span></a></li>
            </ul>
        </div>
    </div>
</div>

<div class="offcanvas offcanvas-start" data-bs-scroll="true" tabindex="-1" id="offcanvasWithBothOptions" aria-labelledby="offcanvasWithBothOptionsLabel">
  <div class="offcanvas-header">
    <!-- <h5 class="offcanvas-title" id="offcanvasWithBothOptionsLabel">Menu</h5> -->
    <a href="#homeSection"
            class="d-flex align-items-center mb-0 mb-md-0 me-md-auto link-body-emphasis text-decoration-none" data-bs-dismiss="offcanvas" aria-label="Close">
            <!-- <img src="/frontend/assets/images/Logo.png" class="headerLogo" /> -->
            <img src="{{ url('frontend/assets/images/LogoBlack.png')}}" class="headerLogo img-fluid" />
        </a>
    <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
  </div>
  <div class="offcanvas-body">
      <div class="sidebarOptionsWrap">
        
        <div class="dropdown">
            <button class="hdrLangbtn" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                ENG
                <svg width="18" height="14" viewBox="0 0 18 10" fill="none"
                    xmlns="http://www.w3.org/2000/svg">
                    <path d="M2 2L9.00062 8L16 2" stroke="#FCFCFD" stroke-width="2.71473"
                        stroke-linecap="round" />
                </svg>
            </button>
            <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="#">ENGLISH</a></li>
                <li><a class="dropdown-item" href="#">HINDI</a></li>
            </ul>
        </div>
        <a href="#">For Coaches</a>
        <a href="#">Start Now</a>
        <a href="#homeSection">Home</a>
        <a href="#sportsSection">Sports</a>
        <a href="#GetCollegeDegreeSection">Journey</a>
        <a href="">our atheletes</a>
        <a href="">study in the usa</a>
        <a href="#ourTeamSection">our team</a>
        <a href="">contact us</a>
    </div>
  </div>
</div>