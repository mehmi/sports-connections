<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;

use App\Models\Admin\ContactUs;

class ContactUsController extends AppController
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
    			contact_us.subject LIKE ? 
    			or 
    			contact_us.first_name LIKE ? 
    			or 
    			contact_us.last_name LIKE ?
    			or 
    			contact_us.email LIKE ?
    			or 
    			contact_us.phonenumber LIKE ?
    			or
    			owner.first_name LIKE ? 
    			or 
    			owner.last_name LIKE ?
    		)'] = [$search, $search, $search, $search, $search, $search, $search];
    	}

    	if($request->get('created_on'))
    	{
    		$createdOn = $request->get('created_on');
    		if(isset($createdOn[0]) && !empty($createdOn[0]))
    			$where['contact_us.created_at >= ?'] = [
    				date('Y-m-d 00:00:00', strtotime($createdOn[0]))
    			];
    		if(isset($createdOn[1]) && !empty($createdOn[1]))
    			$where['contact_us.created_at <= ?'] = [
    				date('Y-m-d 23:59:59', strtotime($createdOn[1]))
    			];
    	}

    	if($request->get('admins'))
    	{
    		$admins = $request->get('admins');
    		$admins = $admins ? implode(',', $admins) : 0;
    		$where[] = 'contact_us.created_by IN ('.$admins.')';
    	}

    	if($request->get('status') !== "" && $request->get('status') !== null)
    	{    		
    		$where['contact_us.status'] = $request->get('status');
    	}

    	$listing = ContactUs::getListing($request, $where);

    	if($request->ajax())
    	{
		    $html = view(
	    		"admin/contactUs/listingLoop", 
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
	    	return view(
	    		"admin/contactUs/index", 
	    		[
	    			'listing' => $listing
	    		]
	    	);
	    }
    }


    function view(Request $request, $id)
    {
    	$contactUs = ContactUs::get($id);
    	if($contactUs)
    	{
	    	return view("admin/contactUs/view", [
    			'contactUs' => $contactUs
    		]);
		}
		else
		{
			abort(404);
		}
    }

    function delete(Request $request, $id)
    {
    	$contactUs = ContactUs::find($id);
    	if($contactUs->delete())
    	{
    		$request->session()->flash('success', 'Contact us deleted successfully.');
    		return redirect()->route('admin.contactUs');
    	}
    	else
    	{
    		$request->session()->flash('error', 'Contact us could not be delete.');
    		return redirect()->route('admin.contactUs');
    	}
    }

    function bulkActions(Request $request, $action)
    {
    	$ids = $request->get('ids');
    	if(is_array($ids) && !empty($ids))
    	{
    		switch ($action) {
    			case 'active':
    				ContactUs::modifyAll($ids, [
    					'status' => 1
    				]);
    				$message = count($ids) . ' records has been published.';
    			break;
    			case 'inactive':
    				ContactUs::modifyAll($ids, [
    					'status' => 0
    				]);
    				$message = count($ids) . ' records has been unpublished.';
    			break;
    			case 'delete':
    				ContactUs::removeAll($ids);
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
