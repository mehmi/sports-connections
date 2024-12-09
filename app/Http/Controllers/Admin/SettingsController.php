<?php
namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

use App\Libraries\General;

use App\Models\Admin\Setting;
use App\Models\Admin\AdminAuth;

class SettingsController extends AppController
{
	function __construct()
	{
		parent::__construct();
	}

    function index(Request $request)
    {
    	if($request->isMethod('post'))
    	{
    		$data = $request->toArray();
    		
    		$validator = Validator::make(
	            $request->toArray(),
	            [
	                'company_name' => 'required',
	                'company_address' => 'required',
	                'admin_second_auth_factor' => 'required',
	                'currency_code' => 'required',
	                'currency_symbol' => 'required',
	                'admin_notification_email' => [
	                	'required',
	                	'email'
	                ]
	            ]
	        );

	        if(!$validator->fails())
	        {
	        	$logo = null;
	        	if(isset($data['logo']) && $data['logo']) 
	        	{
	        		$logo = $data['logo'];
	        	}
	        	
	        	$favicon = null;
	        	if(isset($data['favicon']) && $data['favicon']) 
	        	{
	        		$favicon = $data['favicon'];
	        	}

	        	unset($data['logo']);
	        	unset($data['favicon']);
	        	unset($data['_token']);

	        	foreach ($data as $key => $value)
	        	{
	        		Setting::put($key, $value);
	        	}

	        	if($logo)
	        	{
	        		Setting::put('logo', $logo);
	        	}

	        	if($favicon)
	        	{
	        		Setting::put('favicon', $favicon);
	        	}
	        	
        		$request->session()->flash('success', 'Settings updated successfully.');
        		return redirect()->route('admin.settings');
			}
			else
			{
				$request->session()->flash('error', 'Please provide valid inputs.');
			    return redirect()->back()->withErrors($validator)->withInput();
			}
		}

		return view("admin/settings/index", []);
	}
}
