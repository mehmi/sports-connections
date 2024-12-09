@extends('layouts.adminlayout')
@section('content')

<div class="header-body">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6 col-7">
				<div class="left_area">
					<h6>Manage Sports</h6>
				</div>
			</div>
			<div class="col-lg-6 col-5">
				<div class="right_area text-right">
					<a href="{{ route('admin.sports.edit', ['id' => $data->id]) }}" class="btn btn-default">
						<i class="far fa-edit"></i> Edit
					</a>
					<a href="{{ route('admin.sports') }}" class="btn btn-default ms-1">
						<i class="far fa-angle-left"></i> Back
					</a>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="content_area">
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="row">
			<div class="col-xxl-8 col-xl-8 col-lg-7 col-md-6 col-sm-12 col-12">
				<!-- ==== Slider Information -->
				<div class="card">
					<div class="card-header view_header">
			        	<div class="heading">
							<h5 class="mb-0">Slider Information</h5>
						</div>
					</div>
					<div class="card-body p-0">
						<div class="table-responsive text-nowrap">
							<table class="table">
								<tbody>
									<tr>
										<th>Id</th>
										<td>{{ $data->id }}</td>
									</tr>
									<tr>
										<th>Title</th>
										<td>{{ $data->title }}</td>
									</tr>
									<tr>
										<td colspan="2">
											<h5>Description</h5>
											{!! $data->description !!}
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<div class="col-xxl-4 col-xl-4 col-lg-5 col-md-6 col-sm-12 col-12">
				@if(isset($data->image) && $data->image)
					<div class="card mb-4">
						<div class="card-header">
							<div class="row align-items-center">
								<div class="col">
									<h3 class="mb-0">Image</h3>
								</div>
							</div>
						</div>
						<div class="card-body">
							@include('admin.partials.viewImage', ['files' => $data->image])
						</div>
					</div>
				@endif
				<!-- ==== Other Information -->
				<div class="card">
					<div class="card-header view_header">
			        	<div class="heading">
							<h5 class="mb-0">Other Information</h5>
						</div>
					</div>
					<div class="card-body p-0">
						<div class="table-responsive text-nowrap">
							<table class="table">
								<tbody>
									<tr>
										<th>Created On</th>
										<td>
											{{ _dt($data->created_at) }}
										</td>
									</tr>
									<tr>
										<th>Updated On</th>
										<td>
											{{ _dt($data->updated_at) }}
										</td>
									</tr>
									<tr>
										<th>Created By</th>
										<td>
											{{ isset($data->owner) ? $data->owner->first_name . ' ' . $data->owner->last_name : "" }}
										</td>
									</tr>
									<tr>
										<th>Status</th>
										<th>
											{!! $data->status ? '<span class="badge bg-success">Publish</span>' : '<span class="badge bg-danger">Unpublish</span>' !!}
										</th>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
@endsection