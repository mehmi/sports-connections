@extends('layouts.adminlayout')
@section('content')

<div class="header-body">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6 col-7">
				<div class="left_area">
					<h6>Manage Team</h6>
				</div>
			</div>
			<div class="col-lg-6 col-5">
				<div class="right_area text-right">
					<a href="{{ route('admin.ourteam') }}" class="btn btn-default">
						<i class="fas fa-angle-left"></i> Back
					</a>
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
    		<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    			<div class="card">
    				<h5 class="card-header">Create New Sports Here.</h5>
    				<hr class="my-0" />
    				<div class="card-body">
    					<form action="{{ route('admin.ourteam.add') }}" method="post" class="form-validation">
    						<!--!! CSRF FIELD !!-->
    						{{ csrf_field() }}
    						<div class="row">
    							<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    								<div class="form-group">
    									<label class="form-label">Title</label>
    									<input type="text" class="form-control" name="title" value="{{ old('title') }}" placeholder="Enter title" required />
    									<label id="title-error" class="error" for="title">@error('title') {{ $message }} @enderror</label>
    								</div>
    							</div>
    							<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    								<div class="form-group">
    									<label class="form-label">Instagram Link</label>
    									<input type="text" class="form-control" name="insta" value="{{ old('insta') }}" placeholder="Enter insta" required />
    									<label id="insta-error" class="error" for="insta">@error('insta') {{ $message }} @enderror</label>
    								</div>
    							</div>
    							<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    								<div class="form-group">
    									<label class="form-label">Linkdin Link</label>
    									<input type="text" class="form-control" name="linkdin" value="{{ old('linkdin') }}" placeholder="Enter linkdin" required />
    									<label id="linkdin-error" class="error" for="linkdin">@error('linkdin') {{ $message }} @enderror</label>
    								</div>
    							</div>
    							<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
    								<div class="form-group">
    									<label class="form-label">Facebook Link</label>
    									<input type="text" class="form-control" name="facebook" value="{{ old('facebook') }}" placeholder="Enter facebook" required />
    									<label id="facebook-error" class="error" for="facebook">@error('facebook') {{ $message }} @enderror</label>
    								</div>
    							</div>
    							<div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
    								<div class="form-group">
    									<label class="form-label">Image</label>
    									<div 
    										class="upload-image-section"
    										data-type="image"
    										data-multiple="false"
    										data-path="ourteam"
    										data-resize-large="1000*1000"
    										data-resize-medium="900*900"
    										data-resize-small="800*800"
    									>
    										<div class="upload-section">
    											<div class="button-ref mb-3">
    												<button class="btn btn-primary" type="button">
    									                <span class="btn-inner--icon"><i class="fas fa-upload"></i></span>
    									                <span class="btn-inner--text">Upload Image</span>
    								              	</button>
    								            </div>
    								            <!-- PROGRESS BAR -->
    											<div class="progress d-none">
    							                  <div class="progress-bar bg-default" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
    							                </div>
    							            </div>
    						                <!-- INPUT WITH FILE URL -->
							                <textarea class="d-none" name="image">{{ old('image') }}</textarea>
							                <div class="show-section {{ !old('image') ? 'd-none' : "" }}">
							                	@include('admin.partials.previewFileRender', ['file' => old('image') ])
							                </div>
    									</div>
    								</div>
    							</div>
    							<div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
    								<div class="form-group">
    									<label class="form-label">Publish or Unpublish sports</label>
    									<div class="form-check form-switch mt-2">
    										<input type="hidden" name="status" value="0">
    			                    		<input type="checkbox" name="status" class="form-check-input" id="status" value="1" {{ old('status') != '0' ? 'checked' : '' }}/>
    										<label class="form-check-label" for="status">Do you want to publish this sports ?</label>
    			                      	</div>
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