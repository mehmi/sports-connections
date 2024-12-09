@extends('layouts.adminlayout')
@section('content')

<div class="header-body">
	<div class="container-fluid">
		<div class="row">
			<div class="col-lg-6 col-7">
				<div class="left_area">
					<h6>Manage Our Team</h6>
				</div>
			</div>
			<div class="col-lg-6 col-5">
				<div class="right_area text-right filter-dropdown">
					<a href="{{ route('admin.ourteam.add') }}" class="btn btn-default me-1">New</a>
					@include('admin.ourteam.filters')
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
				<!--!!!!! DO NOT REMOVE listing-block CLASS. INCLUDE THIS IN PARENT DIV OF TABLE ON LISTING SLIDERS !!!!!-->
				<div class="card listing-block">
			        <div class="card-header">
			        	<div class="heading">
							<h5 class="mb-0">Here Is Your ourteam Listing!</h5>
						</div>
						<div class="actions">
							<div class="input-group input-group-merge">
		                    	<span class="input-group-text"><i class="bx bx-search"></i></span>
		                    	<input type="text" class="form-control listing-search" placeholder="Search..." value="{{ (isset($_GET['search']) && $_GET['search'] ? $_GET['search'] : '') }}">
		                    </div>
		                    <div class="action_dropdown btn-group">
		                    	<a href="javascript:;" class="btn dropdown-toggle" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		                    		<i class="fas fa-ellipsis-v"></i>
		                    	</a>
		                    	<ul class="dropdown-menu dropdown-menu-end">
		                    		<li>
		                    			<a class="dropdown-item" href="javascript:;" 
		                            	onclick="bulk_actions('{{ route('admin.ourteam.bulkActions', ['action' => 'active']) }}', 'active');">
		                    				<i class="fas fa-circle text-success"></i>
		                    				<span class="status">Publish</span>
		                    			</a>
		                    		</li>
		                    		<li>
		                    			<a class="dropdown-item" href="javascript:;" 
		                            	onclick="bulk_actions('{{ route('admin.ourteam.bulkActions', ['action' => 'inactive']) }}', 'inactive');">
		                    				<i class="fas fa-circle text-danger"></i>
		                    				<span class="status">Unpublish</span>
		                    			</a>
		                    		</li>
		                    		<div class="dropdown-divider"></div>
		                    		<li>
		                    			<a class="dropdown-item" href="javascript:;" 
		                            	onclick="bulk_actions('{{ route('admin.ourteam.bulkActions', ['action' => 'delete']) }}', 'delete');">
		                    				<i class="fas fa-times text-danger"></i>
		                    				<span class="status">Delete</span>
		                    			</a>
		                    		</li>
		                    	</ul>
		                    </div>
						</div>
					</div>
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
											@if(isset($_GET['sort']) && $_GET['sort'] == 'ourteam.id' && isset($_GET['direction']) && $_GET['direction'] == 'asc')
											<i class="fas fa-sort-down active" data-field="ourteam.id" data-sort="asc"></i>
											@elseif(isset($_GET['sort']) && $_GET['sort'] == 'ourteam.id' && isset($_GET['direction']) && $_GET['direction'] == 'desc')
											<i class="fas fa-sort-up active" data-field="ourteam.id" data-sort="desc"></i>
											@else
											<i class="fas fa-sort" data-field="ourteam.id" data-sort="asc"></i>
											@endif
										</th>
										<th class="sort">
											Title
											@if(isset($_GET['sort']) && $_GET['sort'] == 'ourteam.title' && isset($_GET['direction']) && $_GET['direction'] == 'asc')
											<i class="fas fa-sort-down active" data-field="ourteam.title" data-sort="asc"></i>
											@elseif(isset($_GET['sort']) && $_GET['sort'] == 'ourteam.title' && isset($_GET['direction']) && $_GET['direction'] == 'desc')
											<i class="fas fa-sort-up active" data-field="ourteam.title" data-sort="desc"></i>
											@else
											<i class="fas fa-sort" data-field="ourteam.title"></i>
											@endif
										</th>
										<th class="sort">
											Created By
											@if(isset($_GET['sort']) && $_GET['sort'] == 'owner.first_name' && isset($_GET['direction']) && $_GET['direction'] == 'asc')
											<i class="fas fa-sort-down active" data-field="owner.first_name" data-sort="asc"></i>
											@elseif(isset($_GET['sort']) && $_GET['sort'] == 'owner.first_name' && isset($_GET['direction']) && $_GET['direction'] == 'desc')
											<i class="fas fa-sort-up active" data-field="owner.first_name" data-sort="desc"></i>
											@else
											<i class="fas fa-sort" data-field="owner.first_name"></i>
											@endif
										</th>
										<th class="sort">
											Status
											@if(isset($_GET['sort']) && $_GET['sort'] == 'ourteam.status' && isset($_GET['direction']) && $_GET['direction'] == 'asc')
											<i class="fas fa-sort-down active" data-field="ourteam.status" data-sort="asc"></i>
											@elseif(isset($_GET['sort']) && $_GET['sort'] == 'ourteam.status' && isset($_GET['direction']) && $_GET['direction'] == 'desc')
											<i class="fas fa-sort-up active" data-field="ourteam.status" data-sort="desc"></i>
											@else
											<i class="fas fa-sort" data-field="ourteam.status"></i>
											@endif
										</th>
										<th class="sort">
											Created ON
											@if(isset($_GET['sort']) && $_GET['sort'] == 'ourteam.created_at' && isset($_GET['direction']) && $_GET['direction'] == 'asc')
											<i class="fas fa-sort-down active" data-field="ourteam.created_at" data-sort="asc"></i>
											@elseif(isset($_GET['sort']) && $_GET['sort'] == 'ourteam.created_at' && isset($_GET['direction']) && $_GET['direction'] == 'desc')
											<i class="fas fa-sort-up active" data-field="ourteam.created_at" data-sort="desc"></i>
											@else
											<i class="fas fa-sort" data-field="ourteam.created_at"></i>
											@endif
										</th>
										<th>
											Actions
										</th>
					              	</tr>
				            	</thead>
				            	<tbody class="list">
				              		@if(!empty($listing->items()))
										@include('admin.ourteam.listingLoop')
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