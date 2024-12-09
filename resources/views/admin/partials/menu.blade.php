<!-- ==== Menu Start === -->
<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
    <div class="app-brand demo">
        <a href="{{ url('/') }}" target="_blank" class="app-brand-link">
            <span class="app-brand-logo demo"></span>
            <span class="app-brand-text demo menu-text fw-bolder ms-2" style="text-transform: inherit;">
                {{ $companyName ?? 'Sports'}}
            </span>
        </a>
        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
            <i class="bx bx-chevron-left bx-sm align-middle"></i>
        </a>
    </div>
    <div class="menu-inner-shadow"></div>

    <ul class="menu-inner py-1">
        <!-- ==== Dashboard ==== -->
        @php 
            $active = strpos(request()->route()->getAction()['as'], 'admin.dashboard') > -1
        @endphp
        <li class="menu-item {{ $active ? ' active' : '' }}">
            <a href="{{ route('admin.dashboard') }}" class="menu-link">
                <i class="bx bx-home-circle me-2"></i>
                <div data-i18n="Dashboard">Dashboard</div>
            </a>
        </li>

        <!-- ==== Page Content ==== -->
        @php 
            $active = strpos(request()->route()->getAction()['as'], 'admin.home') > -1
        @endphp
        <li class="menu-item {{ $active ? ' active' : '' }}">
            <a href="{{ route('admin.home') }}" class="menu-link">
                <i class="fas fa-file-alt me-2"></i>
                <div data-i18n="page-content">Page Content</div>
            </a>
        </li>

        <!-- ==== Success Stories ==== -->
        @php 
            $active = strpos(request()->route()->getAction()['as'], 'admin.success') > -1
        @endphp
        <li class="menu-item {{ $active ? ' active' : '' }}">
            <a href="{{ route('admin.success') }}" class="menu-link">
                <i class="fas fa-trophy-alt me-2"></i>
                <div data-i18n="success-stories">Success Stories</div>
            </a>
        </li>

        <!-- ==== Sports ==== -->
        @php 
            $active = strpos(request()->route()->getAction()['as'], 'admin.sports') > -1
        @endphp
        <li class="menu-item {{ $active ? ' active' : '' }}">
            <a href="{{ route('admin.sports') }}" class="menu-link">
                <i class="fas fa-table-tennis me-2"></i>
                <div data-i18n="Sports">Sports</div>
            </a>
        </li>

        <!-- ==== Our Athletes ==== -->
        @php 
            $active = strpos(request()->route()->getAction()['as'], 'admin.testimonials') > -1
        @endphp
        <li class="menu-item {{ $active ? ' active' : '' }} ">
            <a href="{{ route('admin.testimonials') }}" class="menu-link">
                <i class="fas fa-user-tie me-2"></i>
                <div data-i18n="Testimonials">Our Athletes</div>
            </a>
        </li>

        <!-- ==== The Process ==== -->
        @php 
            $active = strpos(request()->route()->getAction()['as'], 'admin.faqs') > -1
        @endphp
        <li class="menu-item {{ $active ? ' active' : '' }}">
            <a href="{{ route('admin.faqs') }}" class="menu-link">
                 <i class="fas fa-question-circle me-2"></i>
                <div data-i18n="process">Process</div>
            </a>
        </li>

        <!-- ==== Our Team ==== -->
        @php 
            $active = strpos(request()->route()->getAction()['as'], 'admin.ourteam') > -1
        @endphp
        <li class="menu-item {{ $active ? ' active' : '' }}">
            <a href="{{ route('admin.ourteam') }}" class="menu-link">
                <i class="far fa-question-circle me-2"></i>
                <div data-i18n="process">Our Team</div>
            </a>
        </li>

        <!-- ==== Contact Us ==== -->
        @php 
            $active = strpos(request()->route()->getAction()['as'], 'admin.contactUs') > -1
        @endphp
        <li class="menu-item {{ $active ? ' active' : '' }}">
            <a href="{{ route('admin.contactUs') }}" class="menu-link">
                <i class="fas fa-users me-2"></i>
                <div data-i18n="Contact Us">Contact Us</div>
            </a>
        </li>
    </ul>
</aside>
<!-- ==== Menu End ==== -->