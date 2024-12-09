@extends('layouts.adminlayout')
@section('content')

<div class="header-body">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6 col-7">
				<div class="left_area">
					<h6>Manage Contact Us</h6>
				</div>
			</div>
			<div class="col-lg-6 col-5">
				<div class="right_area text-right filter-dropdown">
					{{-- <a href="{{ route('admin.contactUs.add') }}" class="btn btn-default me-1">New</a> --}}
					@include('admin.contactUs.filters')
				</div>
			</div>
		</div>
	</div>
</div>

<div class="content_area">
	<div class="container-xxl flex-grow-1 container-p-y">
		<div class="row">
			<div class="col-xxl-12 col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				@include('admin.partials.flash_messages')
				<!--!!!!! DO NOT REMOVE listing-block CLASS. INCLUDE THIS IN PARENT DIV OF TABLE ON LISTING CONTACT US !!!!!-->
				<div class="card listing-block">
			        <div class="card-header">
			        	<div class="heading">
							<h5 class="mb-0">Here Is Your Contact Us Listing!</h5>
						</div>
						<div class="actions">
							<div class="input-group input-group-merge">
		                    	<span class="input-group-text"><i class="bx bx-search"></i></span>
		                    	<input type="text" class="form-control listing-search" placeholder="Search..." value="{{ (isset($_GET['search']) && $_GET['search'] ? $_GET['search'] : '') }}">
		                    </div>
		                    @if(Permission::hasPermission('contact_us', 'update') || Permission::hasPermission('contact_us', 'delete'))
		                    <div class="action_dropdown btn-group">
		                    	<a href="javascript:;" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                    		<i class="fas fa-ellipsis-v"></i>
		                    	</a>
		                    	<ul class="dropdown-menu dropdown-menu-end">
		                    		{{-- @if(Permission::hasPermission('contact_us', 'update'))
		                    		<li>
		                    			<a class="dropdown-item" href="javascript:;" 
		                            	onclick="bulk_actions('{{ route('admin.contactUs.bulkActions', ['action' => 'active']) }}', 'active');">
		                    				<i class="fas fa-circle text-success"></i>
		                    				<span class="status">Publish</span>
		                    			</a>
		                    		</li>
		                    		<li>
		                    			<a class="dropdown-item" href="javascript:;" 
		                            	onclick="bulk_actions('{{ route('admin.contactUs.bulkActions', ['action' => 'inactive']) }}', 'inactive');">
		                    				<i class="fas fa-circle text-danger"></i>
		                    				<span class="status">Unpublish</span>
		                    			</a>
		                    		</li>
		                    		@endif --}}

		                    		@if(Permission::hasPermission('contact_us', 'delete'))
		                    		{{-- <div class="dropdown-divider"></div> --}}
		                    		<li>
		                    			<a class="dropdown-item" href="javascript:;" 
		                            	onclick="bulk_actions('{{ route('admin.contactUs.bulkActions', ['action' => 'delete']) }}', 'delete');">
		                    				<i class="fas fa-times text-danger"></i>
		                    				<span class="status">Delete</span>
		                    			</a>
		                    		</li>
		                    		@endif
		                    	</ul>
		                    </div>
		                    @endif
						</div>
					</div>
			        <!--!!!!! DO NOT REMOVE listing-table, mark_all  CLASSES. INCLUDE THIS IN ALL TABLES LISTING CONTACT US !!!!!-->
			        <div class="card-body p-0">
				        <div class="table-responsive text-nowrap">
				          	<table class="table listing-table">
				            	<thead class="thead-light">
					              	<tr>
					              		<th width="5%">
			              					<div class="form-check">
			              			        	<input type="checkbox" class="form-check-input mark_all" id="mark_all">
			              			        	<label class="form-check-label" for="mark_all"></label>
			              			      	</div>
					              		</th>
						                <th class="sort">
											<!--- MAKE SURE TO USE PROPOER FIELD IN data-field AND PROPOER DIRECTION IN data-sort -->
											Id
											@if(isset($_GET['sort']) && $_GET['sort'] == 'contact_us.id' && isset($_GET['direction']) && $_GET['direction'] == 'asc')
											<i class="fas fa-sort-down active" data-field="contact_us.id" data-sort="asc"></i>
											@elseif(isset($_GET['sort']) && $_GET['sort'] == 'contact_us.id' && isset($_GET['direction']) && $_GET['direction'] == 'desc')
											<i class="fas fa-sort-up active" data-field="contact_us.id" data-sort="desc"></i>
											@else
											<i class="fas fa-sort" data-field="contact_us.id" data-sort="asc"></i>
											@endif
										</th>
										<th class="sort">
											Email
											@if(isset($_GET['sort']) && $_GET['sort'] == 'contact_us.email' && isset($_GET['direction']) && $_GET['direction'] == 'asc')
											<i class="fas fa-sort-down active" data-field="contact_us.email" data-sort="asc"></i>
											@elseif(isset($_GET['sort']) && $_GET['sort'] == 'contact_us.email' && isset($_GET['direction']) && $_GET['direction'] == 'desc')
											<i class="fas fa-sort-up active" data-field="contact_us.email" data-sort="desc"></i>
											@else
											<i class="fas fa-sort" data-field="contact_us.email"></i>
											@endif
										</th>
										<th class="sort">
											Created ON
											@if(isset($_GET['sort']) && $_GET['sort'] == 'contact_us.created_at' && isset($_GET['direction']) && $_GET['direction'] == 'asc')
											<i class="fas fa-sort-down active" data-field="contact_us.created_at" data-sort="asc"></i>
											@elseif(isset($_GET['sort']) && $_GET['sort'] == 'contact_us.created_at' && isset($_GET['direction']) && $_GET['direction'] == 'desc')
											<i class="fas fa-sort-up active" data-field="contact_us.created_at" data-sort="desc"></i>
											@else
											<i class="fas fa-sort" data-field="contact_us.created_at"></i>
											@endif
										</th>
										<th>
											Actions
										</th>
					              	</tr>
				            	</thead>
				            	<tbody class="list">
				              		@if(!empty($listing->items()))
										@include('admin.contactUs.listingLoop')
									@else
									<td align="left" colspan="7">
			                        	No records found!
			                        </td>
									@endif
				            	</tbody>
				            	
								<tfoot>
			                        <tr>
			                            <th align="left" colspan="20">
			                            	@include('admin.partials.pagination', ["pagination" => $listing])
			                            </th>
			                        </tr>
			                    </tfoot>
			                    
							</table>
						</div>
					</div>
		    	</div>
			</div>
		</div>
	</div>
</div>

@endsection