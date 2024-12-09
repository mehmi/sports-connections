<section class="ourTeamsection" id="ourTeamSection">
        <div class="container">
            <div class="sectionHeading">
                <h1>our team</h1>
                <p class="sectionSubHd">
                    {{ $content['team']['description'] ?? ''}}
                </p>
                <a href="{{ url('/',['type' => 'ourTeamSection' ])}}" class="secondaryBtn">
                    Learn more
                </a>

                {{-- <button>
                    Learn more
                </button> --}}
            </div>
            <!-- Team Members List -->
            <div class="OurTeamWrap">
                <!-- Team Member Person Card -->
                @foreach($team as $t => $team)
                    <div class="ourTeamItem">
                        <img src="{{ General::renderImage($team->image ?? '') }}" alt="OurTeam">
                        <div class="teamMemberDtl">
                            <p class="memberName">{{ $team->title ?? ''}}</p>
                            <div class="memberLinks">
                                <a href="{{ url($team->insta ?? '')}}">
                                    <img src="{{ url('frontend/assets/images/InstagramLogo.png')}}" alt="Instagram" />
                                </a>
                                <a href="{{ url($team->linkdin ?? '')}}">
                                    <img src="{{ url('frontend/assets/images/LinkedinLogo.png')}}" alt="Linkedin" />
                                </a>
                                <a href="{{ url($team->facebook ?? '')}}">
                                    <img src="{{ url('frontend/assets/images/FacebookLogo.png')}}" alt="Facebook" />
                                </a>
                            </div>
                        </div>
                    </div>
                @endforeach
                
                <!-- Team Member Person Card -->
                {{-- <div class="ourTeamItem">
                    <img src="{{ url('frontend/assets/images/teamMemberImg.png')}}" alt="">
                    <div class="teamMemberDtl">
                        <p class="memberName">Jhon S. Roug / ceo</p>
                        <div class="memberLinks">
                            <a href="#">
                                <img src="{{ url('frontend/assets/images/InstagramLogo.png')}}" alt="Instagram" />
                            </a>
                            <a href="#">
                                <img src="{{ url('frontend/assets/images/LinkedinLogo.png')}}" alt="Linkedin" />
                            </a>
                            <a href="#">
                                <img src="{{ url('frontend/assets/images/FacebookLogo.png')}}" alt="Facebook" />
                            </a>
                        </div>
                    </div>
                </div>
                <!-- Team Member Person Card -->
                <div class="ourTeamItem">
                    <img src="{{ url('frontend/assets/images/teamMemberImg.png')}}" alt="">
                    <div class="teamMemberDtl">
                        <p class="memberName">Jhon S. Roug / ceo</p>
                        <div class="memberLinks">
                            <a href="#">
                                <img src="{{ url('frontend/assets/images/InstagramLogo.png')}}" alt="Instagram" />
                            </a>
                            <a href="#">
                                <img src="{{ url('frontend/assets/images/LinkedinLogo.png')}}" alt="Linkedin" />
                            </a>
                            <a href="#">
                                <img src="{{ url('frontend/assets/images/FacebookLogo.png')}}" alt="Facebook" />
                            </a>
                        </div>
                    </div>
                </div> --}}
            </div>
        </div>
    </section>