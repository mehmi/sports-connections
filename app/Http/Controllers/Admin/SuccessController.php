<?php
namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;

use App\Libraries\FileSystem;

use App\Models\Admin\Success;
use App\Models\Admin\Admin;

class SuccessController extends AppController
{
	function __construct()
	{
		parent::__construct();
	}

    function index(Request $request)
    {
    	$where = [];
    	if($request->get('search'))
    	{
    		$search = $request->get('search');
    		$search = '%' . $search . '%';
    		$where['(
    			success.title LIKE ? 
    			or 
    			owner.first_name LIKE ? 
    			or 
    			owner.last_name LIKE ?
    		)'] = [$search, $search, $search];
    	}

    	if($request->get('created_on'))
    	{
    		$createdOn = $request->get('created_on');
    		if(isset($createdOn[0]) && !empty($createdOn[0]))
    			$where['success.created_at >= ?'] = [
    				date('Y-m-d 00:00:00', strtotime($createdOn[0]))
    			];
    		if(isset($createdOn[1]) && !empty($createdOn[1]))
    			$where['success.created_at <= ?'] = [
    				date('Y-m-d 23:59:59', strtotime($createdOn[1]))
    			];
    	}

    	if($request->get('admins'))
    	{
    		$admins = $request->get('admins');
    		$admins = $admins ? implode(',', $admins) : 0;
    		$where[] = 'success.created_by IN ('.$admins.')';
    	}

    	if($request->get('status') !== "" && $request->get('status') !== null)
    	{    		
    		$where['success.status'] = $request->get('status');
    	}

    	$listing = Success::getListing($request, $where);


    	if($request->ajax())
    	{
		    $html = view(
	    		"admin/success/listingLoop", 
	    		[
	    			'listing' => $listing
	    		]
	    	)->render();

		    return Response()->json([
		    	'status' => 'success',
	            'html' => $html,
	            'page' => $listing->currentPage(),
	            'counter' => $listing->perPage(),
	            'count' => $listing->total(),
	            'pagination_counter' => $listing->currentPage() * $listing->perPage()
	        ], 200);
		}
		else
		{
			$filters = $this->filters($request);
	    	return view(
	    		"admin/success/index", 
	    		[
	    			'listing' => $listing,
	    			'admins' => $filters['admins']
	    		]
	    	);
	    }
    }

    function filters(Request $request)
    {
		$admins = [];
		$adminIds = Success::distinct()->whereNotNull('created_by')->pluck('created_by')->toArray();
		if($adminIds)
		{
	    	$admins = Admin::getAll(
	    		[
	    			'admins.id',
	    			'admins.first_name',
	    			'admins.last_name',
	    			'admins.status',
	    		],
	    		[
	    			'admins.id in ('.implode(',', $adminIds).')'
	    		],
	    		'concat(admins.first_name, admins.last_name) desc'
	    	);
	    }
    	return [
	    	'admins' => $admins
    	];
    }

    function add(Request $request)
    {
    	if($request->isMethod('post'))
    	{
    		$data = $request->toArray();
    		unset($data['_token']);

    		$validator = Validator::make(
	            $request->toArray(),
	            [
	                'title' => 'required'
	            ]
	        );

	        if(!$validator->fails())
	        {
	        	$page = Success::create($data);
	        	if($page)
	        	{
	        		$request->session()->flash('success', 'Data created successfully.');
	        		return redirect()->route('admin.success');
	        	}
	        	else
	        	{
	        		$request->session()->flash('error', 'Data could not be created. Please try again.');
		    		return redirect()->back()->withErrors($validator)->withInput();
	        	}
		    }
		    else
		    {
		    	$request->session()->flash('error', 'Please provide valid inputs.');
		    	return redirect()->back()->withErrors($validator)->withInput();
		    }
		}

	    return view("admin/success/add", [
	    ]);
    }

    function edit(Request $request, $id)
    {
    	$success = Success::get($id);

    	if($success)
    	{
	    	if($request->isMethod('post'))
	    	{
	    		$data = $request->toArray();
	    		$validator = Validator::make(
		            $request->toArray(),
		            [
		                'title' => 'required'
		            ]
		        );

		        if(!$validator->fails())
		        {
		        	unset($data['_token']);
	        		
	        		/** IN CASE OF SINGLE UPLOAD **/
		        	if(isset($data['image']) && $data['image'])
		        	{
		        		$oldImage = $success->image;
		        	}
		        	else
		        	{
		        		unset($data['image']);
		        		
		        	}
		        	/** IN CASE OF SINGLE UPLOAD **/
		        	
	        		/** ONLY IN CASE OF MULTIPLE IMAGE USE THIS **/
	        		/*if(isset($data['image']) && $data['image'])
	        		{
	        			$data['image'] = json_decode($data['image'], true);
	        			$data->image = $page->image ? json_decode($page->image) : [];
		        		$data['image'] = array_merge($page->image, $data['image']);
		        		$data['image'] = json_encode($data['image']);
		        	}
		        	else
		        	{
		        		unset($data['image']);
		        	}*/
		        	/** ONLY IN CASE OF MULTIPLE IMAGE USE THIS **/

		        	if(Success::modify($id, $data))
		        	{
		        		/** IN CASE OF SINGLE UPLOAD **/
		        		if(isset($oldImage) && $oldImage)
		        		{
		        			FileSystem::deleteFile($oldImage);
		        		}
		        		/** IN CASE OF SINGLE UPLOAD **/

		        		$request->session()->flash('success', 'Data updated successfully.');
		        		return redirect()->route('admin.success');
		        	}
		        	else
		        	{
		        		$request->session()->flash('error', 'Data could not be updated. Please try again.');
			    		return redirect()->back()->withErrors($validator)->withInput();
		        	}
			    }
			    else
			    {
			    	$request->session()->flash('error', 'Please provide valid inputs.');
			    	return redirect()->back()->withErrors($validator)->withInput();
			    }
			}

			return view("admin/success/edit", [
    			'data' => $success
    		]);
		}
		else
		{
			abort(404);
		}
    }

    function view(Request $request, $id)
    {
    	$data = Success::get($id);
    	if($data)
    	{
	    	return view("admin/success/view", [
    			'data' => $data
    		]);
		}
		else
		{
			abort(404);
		}
    }

    function delete(Request $request, $id)
    {
    	$admin = Success::find($id);
    	if($admin->delete())
    	{
    		$request->session()->flash('success', 'Data deletion successful.');
    		return redirect()->route('admin.success');
    	}
    	else
    	{
    		$request->session()->flash('error', 'Data could not be deleted. Please try again.');
    		return redirect()->route('admin.success');
    	}
    }

    function bulkActions(Request $request, $action)
    {
    	$ids = $request->get('ids');
    	if(is_array($ids) && !empty($ids))
    	{
    		switch ($action) {
    			case 'active':
    				Success::modifyAll($ids, [
    					'status' => 1
    				]);
    				$message = count($ids) . ' records have been marked as "Active".';
    			break;
    			case 'inactive':
    				Success::modifyAll($ids, [
    					'status' => 0
    				]);
    				$message = count($ids) . ' records have been marked as "Inactive".';
    			break;
    			case 'delete':
    				Success::removeAll($ids);
    				$message = count($ids) . ' records have been deleted successfully.';
    			break;
    		}

    		$request->session()->flash('success', $message);

    		return Response()->json([
    			'status' => 'success',
	            'message' => $message,
	        ], 200);		
    	}
    	else
    	{
    		return Response()->json([
    			'status' => 'error',
	            'message' => 'Please select atleast one record.',
	        ], 200);	
    	}
    }
}
