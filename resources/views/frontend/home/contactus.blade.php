<section class="enterMailSection" id="enterMailSection">
    <div class="container">
        <div class="enterMailHdng">
            <h1>{{ $content['contact_us']['title'] ?? ''}}</h1>
            <p>{{ $content['contact_us']['sub_title'] ?? ''}}</p>
        </div>
        <form action="{{ route('contactus.index')}}" id="contactUsForm">
        <div class="enterMailWrap">
                <span class="enterMailTxt">Your email address</span>
                <input type="text" placeholder="aliciliniavopir@gmail.com" type="email">
                <button class="signInBtn">Sign in </button>
            </div>
        </form>
    </div>
</section>

