<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;

use App\Libraries\FileSystem;

use App\Models\Admin\Sports;
use App\Models\Admin\Admin;

class SportController extends AppController
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
    			sports.title LIKE ? 
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
    			$where['sports.created_at >= ?'] = [
    				date('Y-m-d 00:00:00', strtotime($createdOn[0]))
    			];
    		if(isset($createdOn[1]) && !empty($createdOn[1]))
    			$where['sports.created_at <= ?'] = [
    				date('Y-m-d 23:59:59', strtotime($createdOn[1]))
    			];
    	}

    	if($request->get('admins'))
    	{
    		$admins = $request->get('admins');
    		$admins = $admins ? implode(',', $admins) : 0;
    		$where[] = 'sports.created_by IN ('.$admins.')';
    	}

    	if($request->get('status') !== "" && $request->get('status') !== null)
    	{    		
    		$where['sports.status'] = $request->get('status');
    	}

    	$listing = Sports::getListing($request, $where);

    	// pr($listing->toArray());die;

    	if($request->ajax())
    	{
		    $html = view(
	    		"admin/sports/listingLoop", 
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
	    		"admin/sports/index", 
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
		$adminIds = Sports::distinct()->whereNotNull('created_by')->pluck('created_by')->toArray();
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
	                'title' => 'required',
	                'description' => 'required'
	            ]
	        );

	        if(!$validator->fails())
	        {
	        	$slider = Sports::create($data);
	        	if($slider)
	        	{
	        		$request->session()->flash('success', 'Data created successfully.');
	        		return redirect()->route('admin.sports');
	        	}
	        	else
	        	{
	        		$request->session()->flash('error', 'Data could not be save. Please try again.');
		    		return redirect()->back()->withErrors($validator)->withInput();
	        	}
		    }
		    else
		    {
		    	$request->session()->flash('error', 'Please provide valid inputs.');
		    	return redirect()->back()->withErrors($validator)->withInput();
		    }
		}

	    return view("admin/sports/add", [
	    ]);
    }

    function edit(Request $request, $id)
    {
    	$sport = Sports::get($id);

    	if($sport)
    	{
	    	if($request->isMethod('post'))
	    	{
	    		$data = $request->toArray();
	    		$validator = Validator::make(
		            $request->toArray(),
		            [
		            	'title' => 'required',
	                	'description' => 'required'
		            ]
		        );

		        if(!$validator->fails())
		        {
		        	unset($data['_token']);
	        		
	        		/** IN CASE OF SINGLE UPLOAD **/
		        	// if(isset($data['image']) && $data['image'])
		        	// {
		        	// 	$oldImage = $sport->image;
		        	// }
		        	// else
		        	// {
		        	// 	unset($data['image']);
		        		
		        	// }
		        	/** IN CASE OF SINGLE UPLOAD **/
		        	
	        		/** ONLY IN CASE OF MULTIPLE IMAGE USE THIS **/
	        		if(isset($data['image']) && $data['image'])
	        		{
	        			$data['image'] = json_decode($data['image'], true);
		        		$data['image'] = array_merge($sport->image, $data['image']);
		        		$data['image'] = json_encode($data['image']);
		        	}
		        	else
		        	{
		        		unset($data['image']);
		        	}
		        	/** ONLY IN CASE OF MULTIPLE IMAGE USE THIS **/

		        	if(Sports::modify($id, $data))
		        	{
		        		/** IN CASE OF SINGLE UPLOAD **/
		        		if(isset($oldImage) && $oldImage)
		        		{
		        			FileSystem::deleteFile($oldImage);
		        		}
		        		/** IN CASE OF SINGLE UPLOAD **/

		        		$request->session()->flash('success', 'Data updated successfully.');
		        		return redirect()->route('admin.sports');
		        	}
		        	else
		        	{
		        		$request->session()->flash('error', 'Data could not be save. Please try again.');
			    		return redirect()->back()->withErrors($validator)->withInput();
		        	}
			    }
			    else
			    {
			    	$request->session()->flash('error', 'Please provide valid inputs.');
			    	return redirect()->back()->withErrors($validator)->withInput();
			    }
			}

			return view("admin/sports/edit", [
    			'sport' => $sport
    		]);
		}
		else
		{
			abort(404);
		}
    }

    function view(Request $request, $id)
    {
    	$data = Sports::get($id);

    	if($data)
    	{
	    	return view("admin/sports/view", [
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
    	$slider = Sports::find($id);
    	if($slider->delete())
    	{
    		$request->session()->flash('success', 'Data deleted successfully.');
    		return redirect()->route('admin.sports');
    	}
    	else
    	{
    		$request->session()->flash('error', 'Data could not be delete.');
    		return redirect()->route('admin.sports');
    	}
    }

    function bulkActions(Request $request, $action)
    {
    	$ids = $request->get('ids');
    	if(is_array($ids) && !empty($ids))
    	{
    		switch ($action) {
    			case 'active':
    				Sports::modifyAll($ids, [
    					'status' => 1
    				]);
    				$message = count($ids) . ' records has been published.';
    			break;
    			case 'inactive':
    				Sports::modifyAll($ids, [
    					'status' => 0
    				]);
    				$message = count($ids) . ' records has been unpublished.';
    			break;
    			case 'delete':
    				Sports::removeAll($ids);
    				$message = count($ids) . ' records has been deleted.';
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
