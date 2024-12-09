@php 
	$method = Setting::get('email_method');
	$secondAuth = Setting::get('admin_second_auth_factor');
	$encryption =  Setting::get('smtp_encryption');
	$favicon = Setting::get('favicon');
	$logo = Setting::get('logo');
@endphp

@extends('layouts.adminlayout')
@section('content')

<div class="header-body">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6 col-7">
				<div class="left_area">
					<h6>Manage Settings</h6>
				</div>
			</div>
			<div class="col-lg-6 col-5">
				<div class="right_area text-right">
					{{-- <a href="javascript:;" class="btn btn-default">
						<i class="fas fa-angle-left"></i> Back
					</a> --}}
				</div>
			</div>
		</div>
	</div>
</div>

<div class="content_area">
    <div class="container-xxl flex-grow-1 container-p-y">
    	@include('admin.partials.flash_messages')
		<div class="row">
			<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="card">
					<h5 class="card-header">General Settings</h5>
					<hr class="my-0" />
					<div class="card-body">
						<form action="{{ route('admin.settings') }}" method="post" class="form-validation">
							<!--!! CSRF FIELD !!-->
							{{ csrf_field() }}
							<div class="row">
								<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
									<div class="form-group">
										<label class="form-label">Project Name</label>
										<input type="text" class="form-control" name="company_name" value="{{ Setting::get('company_name') }}" placeholder="Company name" required />
										<label id="company_name-error" class="error" for="company_name">@error('company_name') {{ $message }} @enderror</label>
									</div>
								</div>
								<div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
									<div class="form-group">
										<label class="form-label">Logo</label>
										<div 
											class="upload-image-section"
											data-type="image"
											data-multiple="false"
											data-path="logos"
											data-resize-large="1366*250"
											data-resize-medium="400*75"
											data-resize-small="150*27"
										>
											<div class="upload-section {{ isset($logo) && $logo ? 'd-none' : '' }}">
												<div class="button-ref mb-3">
													<button class="btn btn-primary" type="button">
										                <span class="btn-inner--icon"><i class="fas fa-upload"></i></span>
										                <span class="btn-inner--text">Upload Logo</span>
									              	</button>
									            </div>
									            <!-- PROGRESS BAR -->
												<div class="progress d-none">
								                  <div class="progress-bar bg-default" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
								                </div>
								            </div>
							                <!-- INPUT WITH FILE URL -->
							                <textarea class="d-none" name="logo"></textarea>
							                <div class="show-section {{ !old('logo') ? 'd-none' : "" }}">
							                	@include('admin.partials.previewFileRender', ['file' => old('logo') ])
							                </div>
							                 <div class="fixed-edit-section">
							                	@include('admin.partials.previewFileRender', ['file' => $logo, 'relationType' => 'settings.logo', 'relationId' => "" ])
							                </div>
										</div>
									</div>
								</div>
								<div class="col-xxl-6 col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
									<div class="form-group">
										<label class="form-label">favicon</label>
										<div 
											class="upload-image-section"
											data-type="image"
											data-multiple="false"
											data-path="logos"
											data-resize-large="1366*250"
											data-resize-medium="400*75"
											data-resize-small="150*27"
										>
											<div class="upload-section {{ isset($favicon) && $favicon ? 'd-none' : '' }}">
												<div class="button-ref mb-3">
													<button class="btn btn-primary" type="button">
										                <span class="btn-inner--icon"><i class="fas fa-upload"></i></span>
										                <span class="btn-inner--text">Upload Favicon</span>
									              	</button>
									            </div>
									            <!-- PROGRESS BAR -->
												<div class="progress d-none">
								                  <div class="progress-bar bg-default" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100" style="width: 0%;"></div>
								                </div>
								            </div>
							                <!-- INPUT WITH FILE URL -->
							                <textarea class="d-none" name="favicon"></textarea>
							                <div class="show-section {{ !old('favicon') ? 'd-none' : "" }}">
							                	@include('admin.partials.previewFileRender', ['file' => old('favicon') ])
							                </div>
							                 <div class="fixed-edit-section">
							                	@include('admin.partials.previewFileRender', ['file' => $favicon, 'relationType' => 'settings.favicon', 'relationId' => "" ])
							                </div>
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