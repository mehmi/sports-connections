<a href="javascript:;" class="btn btn-default" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	@if(isset($_GET) && !empty($_GET))
	<span class="filter-dot text-info"><i class="fas fa-circle"></i></span>
	@endif
	<i class="fas fa-filter"></i> Filters
</a>
<div class="dropdown-menu dropdown-menu-end">
	<form action="{{url()->current()}}" id="filters-form">
		<a href="javascript:;" class="float-end px-2 closeit">
			<i class="fa fa-times-circle"></i>
		</a>
		<div class="dropdown-item">
			<div class="row">
				<div class="col-md-6">
					<label class="form-label">Created On</label>
					<input class="form-control" type="date" name="created_on[0]" value="{{ (isset($_GET['created_on'][0]) && !empty($_GET['created_on'][0]) ? $_GET['created_on'][0] : '' ) }}" placeholder="DD-MM-YYYY" >
				</div>
				<div class="col-md-6">
					<label class="form-label">&nbsp;</label>
					<input class="form-control" type="date" name="created_on[1]" value="{{ (isset($_GET['created_on'][1]) && !empty($_GET['created_on'][1]) ? $_GET['created_on'][1] : '' ) }}" placeholder="DD-MM-YYYY">
				</div>
			</div>
		</div>
		<div class="dropdown-divider"></div>
		<div class="dropdown-item">
			<div class="form-group mt-2 mb-0">
				<label class="form-label d-none">Login Status</label>
				<div class="form-check form-check-inline">
					<input class="form-check-input" type="radio" name="action" id="allEmail" value="" {{ (!isset($_GET['action']) || $_GET['action'] === '' || $_GET['action'] === null ? 'checked' : '') }}/>
					<label class="form-check-label" for="allEmail">All</label>
				</div>
				<div class="form-check form-check-inline">
					<input type="radio" class="form-check-input" name="action" id="login" value="login" {{ (isset($_GET['action']) && $_GET['action'] == 'login' ? 'checked' : '') }}/>
					<label class="form-check-label" for="login">Login</label>
				</div>
				<div class="form-check form-check-inline">
					<input type="radio" class="form-check-input" name="action" id="logout" value="logout" {{ (isset($_GET['action']) && $_GET['action'] == 'logout' ? 'checked' : '') }}/>
					<label class="form-check-label" for="logout">Not Sent</label>
				</div>
			</div>
		</div>
		<div class="dropdown-divider"></div>
		<div class="dropdown-bottom clearfix">
			<a href="{{url()->current()}}" class="btn btn-sm btn-danger px-3 float-start">Reset All</a>
			<button type="submit" class="btn btn-sm px-3 btn-primary float-end">Submit</button>
		</div>
	</form>
</div>