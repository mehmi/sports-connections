<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;

use App\Libraries\FileSystem;

use App\Models\Admin\Faq;
use App\Models\Admin\Admin;

class FaqsController extends AppController
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
    			faqs.title LIKE ? 
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
    			$where['faqs.created_at >= ?'] = [
    				date('Y-m-d 00:00:00', strtotime($createdOn[0]))
    			];
    		if(isset($createdOn[1]) && !empty($createdOn[1]))
    			$where['faqs.created_at <= ?'] = [
    				date('Y-m-d 23:59:59', strtotime($createdOn[1]))
    			];
    	}

    	if($request->get('admins'))
    	{
    		$admins = $request->get('admins');
    		$admins = $admins ? implode(',', $admins) : 0;
    		$where[] = 'faqs.created_by IN ('.$admins.')';
    	}

    	if($request->get('status') !== "" && $request->get('status') !== null)
    	{    		
    		$where['faqs.status'] = $request->get('status');
    	}

    	$listing = Faq::getListing($request, $where);

    	if($request->ajax())
    	{
		    $html = view(
	    		"admin/faqs/listingLoop", 
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
	    		"admin/faqs/index", 
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
		$adminIds = Faq::distinct()->whereNotNull('created_by')->pluck('created_by')->toArray();
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
	        	$faq = Faq::create($data);
	        	if($faq)
	        	{
	        		$request->session()->flash('success', 'Process created successfully.');
	        		return redirect()->route('admin.faqs');
	        	}
	        	else
	        	{
	        		$request->session()->flash('error', 'Process could not be save. Please try again.');
		    		return redirect()->back()->withErrors($validator)->withInput();
	        	}
		    }
		    else
		    {
		    	$request->session()->flash('error', 'Please provide valid inputs.');
		    	return redirect()->back()->withErrors($validator)->withInput();
		    }
		}

	    return view("admin/faqs/add", [
	    ]);
    }

    function edit(Request $request, $id)
    {
    	$faq = Faq::get($id);

    	if($faq)
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
		        	if(isset($data['image']) && $data['image'])
		        	{
		        		$oldImage = $faq->image;
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
	        			$faq->image = $faq->image ? json_decode($faq->image) : [];
		        		$data['image'] = array_merge($faq->image, $data['image']);
		        		$data['image'] = json_encode($data['image']);
		        	}
		        	else
		        	{
		        		unset($data['image']);
		        	}*/
		        	/** ONLY IN CASE OF MULTIPLE IMAGE USE THIS **/

		        	if(Faq::modify($id, $data))
		        	{
		        		/** IN CASE OF SINGLE UPLOAD **/
		        		if(isset($oldImage) && $oldImage)
		        		{
		        			FileSystem::deleteFile($oldImage);
		        		}
		        		/** IN CASE OF SINGLE UPLOAD **/

		        		$request->session()->flash('success', 'Process updated successfully.');
		        		return redirect()->route('admin.faqs');
		        	}
		        	else
		        	{
		        		$request->session()->flash('error', 'Process could not be save. Please try again.');
			    		return redirect()->back()->withErrors($validator)->withInput();
		        	}
			    }
			    else
			    {
			    	$request->session()->flash('error', 'Please provide valid inputs.');
			    	return redirect()->back()->withErrors($validator)->withInput();
			    }
			}

			return view("admin/faqs/edit", [
    			'faq' => $faq
    		]);
		}
		else
		{
			abort(404);
		}
    }

    function view(Request $request, $id)
    {
    	$faq = Faq::get($id);
    	if($faq)
    	{
	    	return view("admin/faqs/view", [
    			'faq' => $faq
    		]);
		}
		else
		{
			abort(404);
		}
    }

    function delete(Request $request, $id)
    {
    	$faq = Faq::find($id);
    	if($faq->delete())
    	{
    		$request->session()->flash('success', 'Process deleted successfully.');
    		return redirect()->route('admin.faqs');
    	}
    	else
    	{
    		$request->session()->flash('error', 'Process could not be delete.');
    		return redirect()->route('admin.faqs');
    	}
    }

    function bulkActions(Request $request, $action)
    {
    	$ids = $request->get('ids');
    	if(is_array($ids) && !empty($ids))
    	{
    		switch ($action) {
    			case 'active':
    				Faq::modifyAll($ids, [
    					'status' => 1
    				]);
    				$message = count($ids) . ' records has been published.';
    			break;
    			case 'inactive':
    				Faq::modifyAll($ids, [
    					'status' => 0
    				]);
    				$message = count($ids) . ' records has been unpublished.';
    			break;
    			case 'delete':
    				Faq::removeAll($ids);
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
