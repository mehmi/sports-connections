@extends('layouts.adminlayout')
@section('content')
@php
    use App\Models\Admin\PageContent;
@endphp

<style>
  .border-dotted {
    border-style: dotted;
    border-width: thin;
  }
</style>

<div class="header-body">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6 col-7">
				<div class="left_area">
					<h6>MANAGE HOME CONTENT</h6>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="content_area">
    <div class="container-xxl flex-grow-1 container-p-y">
    	<!--!! FLAST MESSAGES !!-->
    	@include('admin.partials.flash_messages')
    	<div class="row">
    		<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 py-3">
    			<div class="card">
    				<h5 class="card-header">Banner</h5>
    				<hr class="my-0" />
    				<div class="card-body">
    					@php
    					    $banner = PageContent::getData('home', 'banner', 'data');
    					    $bannerImg = PageContent::getData('home', 'banner_img', 'image');
    					@endphp
    					<form action="{{ route('admin.pageContent',['type' => 'home']) }}#banner" method="post" class="validation1">
    						<!--!! CSRF FIELD !!-->
    						{{ csrf_field() }}
    						<div class="row">
    							<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    								<div class="form-group">
    									<label class="form-label">Title</label>
    									<input type="text" class="form-control" name="data[banner][title]" value="{{ old('data[banner][title]' , $banner->title ?? '') }}" placeholder="Enter Title" maxlength="40" required />
    									<small>Maximun character : 40</small>
    									<label id="data[banner][title]-error" class="error" for="data[banner][title]">
	    									@error('data[banner][title]')
	    								        {{ $message }} 
	    								    @enderror
    								    </label>
    								</div>
    							</div>
    							<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    								<div class="form-group">
    									<label class="form-label">Description</label>
    									<textarea class="form-control" name="data[banner][description]" placeholder="Enter Description" maxlength="200" required>{{ old('data[banner][description]', $banner->description ?? '') }}</textarea>
    									<small>Maximum character : 200</small>
    									<label id="data[banner][description]-error" class="error" for="data[banner][description]">
    									    @error('data[banner][description]') 
    									        {{ $message }} 
    									    @enderror
    									</label>
    								</div>
    							</div>
    							{{-- <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12 d-none">
    								<div class="form-group">
    									<label class="form-label">Image</label>
    									<div 
    										class="upload-image-section"
    										data-type="image"
    										data-multiple="false"
    										data-path="home"
    										data-resize-large="1152*680"
    										data-resize-medium="768*453"
    										data-resize-small="384*226"
    									>
    										<div class="upload-section {{ isset($bannerImg->data) && $bannerImg->data  ? 'd-none' : "" }} ">
    											<div class="button-ref mb-3">
    												<button class="btn btn-primary" type="button">
    									                <span class="btn-inner--icon"><i class="fas fa-upload"></i></span>
    									                <span class="btn-inner--text">Upload Image</span>
    								              	</button>
    								              	@include('admin.partials.recommendedSize', ['width' => '1152', 'height' => "680"])
    								            </div>
    								            <!-- PROGRESS BAR -->
    											<div class="progress d-none">
    							                  <div class="progress-bar bg-default" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
    							                </div>
    							            </div>
    						                <!-- INPUT WITH FILE URL -->
							                <textarea class="d-none" name="image[degree_img]"></textarea>
							                <div class="show-section {{ !old('image.degree_img') ? 'd-none' : "" }}">
							                	@include('admin.partials.previewFileRender', ['file' => old('image.degree_img') ])
							                </div>
							                <div class="fixed-edit-section media_sort" data-url="{{ route('admin.actions.mediaSort') }}">
							                	@include('admin.partials.previewFileRender', ['file' => $bannerImg->data ?? '', 'relationType' => 'pages_content.data', 'relationId' => $bannerImg->id ?? '' ])
							                </div>
    									</div>
    								</div>
    							</div> --}}
    						</div>
    						<div class="form-group mt-2 clearfix">
    							<button type="submit" class="btn btn-primary float-end">Submit</button>
    						</div>
    					</form>
    				</div>
    			</div>
    		</div>
    		<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 py-3">
    			<div class="card">
    				<h5 class="card-header">Pick-Up Sports</h5>
    				<hr class="my-0" />
    				<div class="card-body">
    					@php
    					    $sports = PageContent::getData('home', 'sports', 'data');
    					@endphp
    					<form action="{{ route('admin.pageContent',['type' => 'home']) }}#sports" method="post" class="validation2">
    						<!--!! CSRF FIELD !!-->
    						{{ csrf_field() }}
    						<div class="row">
    							<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    								<div class="form-group">
    									<label class="form-label">Title</label>
    									<input type="text" class="form-control" name="data[sports][title]" value="{{ old('data[sports][title]' , $sports->title ?? '') }}" placeholder="Enter Title" maxlength="40" required />
    									<small>Maximun character : 40</small>
    									<label id="data[sports][title]-error" class="error" for="data[sports][title]">
	    									@error('data[sports][title]')
	    								        {{ $message }} 
	    								    @enderror
    								    </label>
    								</div>
    							</div>
    							<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    								<div class="form-group">
    									<label class="form-label">Description</label>
    									<textarea class="form-control" name="data[sports][description]" placeholder="Enter Description" maxlength="200" required>{{ old('data[sports][description]', $sports->description ?? '') }}</textarea>
    									<small>Maximum character : 200</small>
    									<label id="data[sports][description]-error" class="error" for="data[sports][description]">
    									    @error('data[sports][description]') 
    									        {{ $message }} 
    									    @enderror
    									</label>
    								</div>
    							</div>
    						</div>
    						<div class="form-group mt-2 clearfix">
    							<button type="submit" class="btn btn-primary float-end">Submit</button>
    						</div>
    					</form>
    				</div>
    			</div>
    		</div>
    		<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 py-3" id="degree">
    			<div class="card">
    				<h5 class="card-header">Collage Degree</h5>
    				<hr class="my-0" />
    				<div class="card-body">
    					@php
    					    $degree = PageContent::getData('home', 'degree', 'data');
    					    $degreeImg = PageContent::getData('home', 'degree_img', 'image');
    					@endphp
    					<form action="{{ route('admin.pageContent',['type' => 'home']) }}#degree" method="post" class="validation3">
    						<!--!! CSRF FIELD !!-->
    						{{ csrf_field() }}
    						<div class="row">
    							<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    								<div class="form-group">
    									<label class="form-label">Title</label>
    									<input type="text" class="form-control" name="data[degree][title]" value="{{ old('data[degree][title]' , $degree->title ?? '') }}" placeholder="Enter Title" maxlength="40" required />
    									<small>Maximun character : 40</small>
    									<label id="data[degree][title]-error" class="error" for="data[degree][title]">
	    									@error('data[degree][title]')
	    								        {{ $message }} 
	    								    @enderror
    								    </label>
    								</div>
    							</div>
    							<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    								<div class="form-group">
    									<label class="form-label">Description</label>
    									<textarea class="form-control" name="data[degree][description]" placeholder="Enter Description" maxlength="200" required>{{ old('data[degree][description]', $degree->description ?? '') }}</textarea>
    									<small>Maximum character : 200</small>
    									<label id="data[degree][description]-error" class="error" for="data[degree][description]">
    									    @error('data[degree][description]') 
    									        {{ $message }} 
    									    @enderror
    									</label>
    								</div>
    							</div>
    							{{-- <div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
    								<div class="form-group">
    									<label class="form-label">Image</label>
    									<div 
    										class="upload-image-section"
    										data-type="image"
    										data-multiple="false"
    										data-path="home"
    										data-resize-large="1152*680"
    										data-resize-medium="768*453"
    										data-resize-small="384*226"
    									>
    										<div class="upload-section {{ isset($degreeImg->data) && $degreeImg->data  ? 'd-none' : "" }} ">
    											<div class="button-ref mb-3">
    												<button class="btn btn-primary" type="button">
    									                <span class="btn-inner--icon"><i class="fas fa-upload"></i></span>
    									                <span class="btn-inner--text">Upload Image</span>
    								              	</button>
    								              	@include('admin.partials.recommendedSize', ['width' => '1152', 'height' => "680"])
    								            </div>
    								            <!-- PROGRESS BAR -->
    											<div class="progress d-none">
    							                  <div class="progress-bar bg-default" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
    							                </div>
    							            </div>
    						                <!-- INPUT WITH FILE URL -->
							                <textarea class="d-none" name="image[degree_img]"></textarea>
							                <div class="show-section {{ !old('image.degree_img') ? 'd-none' : "" }}">
							                	@include('admin.partials.previewFileRender', ['file' => old('image.degree_img') ])
							                </div>
							                <div class="fixed-edit-section media_sort" data-url="{{ route('admin.actions.mediaSort') }}">
							                	@include('admin.partials.previewFileRender', ['file' => $degreeImg->data ?? '', 'relationType' => 'pages_content.data', 'relationId' => $degreeImg->id ?? '' ])
							                </div>
    									</div>
    								</div>
    							</div> --}}
    						</div>
    						<div class="form-group mt-2 clearfix">
    							<button type="submit" class="btn btn-primary float-end">Submit</button>
    						</div>
    					</form>
    				</div>
    			</div>
    		</div>
    		<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 py-3" id="ourTeam">
    			<div class="card">
    				<h5 class="card-header">Our Team</h5>
    				<hr class="my-0" />
    				<div class="card-body">
    					@php
    					    $team = PageContent::getData('home', 'team', 'data');
    					    $teamImg = PageContent::getData('home', 'team_img', 'image');
    					@endphp
    					<form action="{{ route('admin.pageContent',['type' => 'home']) }}#ourTeam" method="post" class="validation4">
    						<!--!! CSRF FIELD !!-->
    						{{ csrf_field() }}
    						<div class="row">
    							<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    								<div class="form-group">
    									<label class="form-label">Title</label>
    									<input type="text" class="form-control" name="data[team][description]" value="{{ old('data[team][description]' , $team->description ?? '') }}" placeholder="Enter description" maxlength="200" required />
    									<small>Maximun character : 200</small>
    									<label id="data[team][description]-error" class="error" for="data[team][description]">
	    									@error('data[team][description]')
	    								        {{ $message }} 
	    								    @enderror
    								    </label>
    								</div>
    							</div>
    						</div>
    						<div class="form-group mt-2 clearfix">
    							<button type="submit" class="btn btn-primary float-end">Submit</button>
    						</div>
    					</form>
    				</div>
    			</div>
    		</div>
    		<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 py-3" id="journey">
    			<div class="card">
    				<h5 class="card-header">Journey</h5>
    				<hr class="my-0" />
    				<div class="card-body">
    					@php
    					    $journey = PageContent::getData('home', 'journey', 'data');
    					    $journeyImg = PageContent::getData('home', 'journey_img', 'image');
    					@endphp
    					<form action="{{ route('admin.pageContent',['type' => 'home']) }}#journey" method="post" class="validation5">
    						<!--!! CSRF FIELD !!-->
    						{{ csrf_field() }}
    						<div class="row">
    							<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    								<div class="form-group">
    									<label class="form-label">Title</label>
    									<input type="text" class="form-control" name="data[journey][title]" value="{{ old('data[journey][title]' , $journey->title ?? '') }}" placeholder="Enter Title" maxlength="40" required />
    									<small>Maximun character : 40</small>
    									<label id="data[journey][title]-error" class="error" for="data[journey][title]">
	    									@error('data[journey][title]')
	    								        {{ $message }} 
	    								    @enderror
    								    </label>
    								</div>
    							</div>
    						</div>
    						<div class="form-group mt-2 clearfix">
    							<button type="submit" class="btn btn-primary float-end">Submit</button>
    						</div>
    					</form>
    				</div>
    			</div>
    		</div>
    		<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 py-3" id="contactus">
    			<div class="card">
    				<h5 class="card-header">Contact Us</h5>
    				<hr class="my-0" />
    				<div class="card-body">
    					@php
    					    $contactUs = PageContent::getData('home', 'contact_us', 'data');
    					@endphp
    					<form action="{{ route('admin.pageContent',['type' => 'home']) }}#contactus" method="post" class="validation5">
    						<!--!! CSRF FIELD !!-->
    						{{ csrf_field() }}
    						<div class="row">
    							<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    								<div class="form-group">
    									<label class="form-label">Title</label>
    									<input type="text" class="form-control" name="data[contact_us][title]" value="{{ old('data[contact_us][title]' , $contactUs->title ?? '') }}" placeholder="Enter Title" maxlength="40" required />
    									<small>Maximun character : 40</small>
    									<label id="data[contact_us][title]-error" class="error" for="data[contact_us][title]">
	    									@error('data[contact_us][title]')
	    								        {{ $message }} 
	    								    @enderror
    								    </label>
    								</div>
    							</div>
    							<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    								<div class="form-group">
    									<label class="form-label">Title</label>
    									<input type="text" class="form-control" name="data[contact_us][sub_title]" value="{{ old('data[contact_us][sub_title]' , $contactUs->sub_title ?? '') }}" placeholder="Enter Sub Title" maxlength="200" required />
    									<small>Maximun character : 200</small>
    									<label id="data[contact_us][sub_title]-error" class="error" for="data[contact_us][sub_title]">
	    									@error('data[contact_us][sub_title]')
	    								        {{ $message }} 
	    								    @enderror
    								    </label>
    								</div>
    							</div>
    						</div>
    						<div class="form-group mt-2 clearfix">
    							<button type="submit" class="btn btn-primary float-end">Submit</button>
    						</div>
    					</form>
    				</div>
    			</div>
    		</div>
    		<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12 py-3" id="meta">
    			<div class="card">
    				<h5 class="card-header">Meta Information</h5>
    				<hr class="my-0" />
    				<div class="card-body">
    					@php
    					    $meta = PageContent::getData('home', 'meta', 'data');
    					@endphp
    					<form action="{{ route('admin.pageContent',['type' => 'home']) }}#meta" method="post" class="validation6">
    						<!--!! CSRF FIELD !!-->
    						{{ csrf_field() }}
    						<div class="row">
    							<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    								<div class="form-group">
    									<label class="form-label">Title</label>
    									<input type="text" class="form-control" name="data[meta][title]" value="{{ old('data[meta][title]' , $meta->title ?? '') }}" placeholder="Enter Title" maxlength="100" required />
    									<small>Maximun character : 100</small>
    									<label id="data[meta][title]-error" class="error" for="data[meta][title]">
	    									@error('data[meta][title]')
	    								        {{ $message }} 
	    								    @enderror
    								    </label>
    								</div>
    							</div>
    							<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    								<div class="form-group">
    									<label class="form-label">KeyWords</label>
    									<input type="text" class="form-control" name="data[meta][keywords]" value="{{ old('data[meta][keywords]' , $meta->keywords ?? '') }}" placeholder="Enter keywords" maxlength="100" required />
    									<small>Maximun character : 100</small>
    									<label id="data[meta][keywords]-error" class="error" for="data[meta][keywords]">
	    									@error('data[meta][keywords]')
	    								        {{ $message }} 
	    								    @enderror
    								    </label>
    								</div>
    							</div>
    							<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    								<div class="form-group">
    									<label class="form-label">Description</label>
    									<textarea class="form-control" name="data[meta][description]" placeholder="Enter description" maxlength="200" required>{{ old('data[meta][description]', $meta->description ?? '') }}</textarea>
    									<small>Maximum character : 200</small>
    									<label id="data[meta][description]-error" class="error" for="data[meta][description]">
    									    @error('data[meta][description]') 
    									        {{ $message }} 
    									    @enderror
    									</label>
    								</div>
    							</div>
    						</div>
    						<div class="form-group mt-2 clearfix">
    							<button type="submit" class="btn btn-primary float-end">Submit</button>
    						</div>
    					</form>
    				</div>
    			</div>
    		</div>
    	</div>
    </div>
</div>



@endsection