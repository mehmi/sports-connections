<?php

/**
 * Admin Dashboard Class
 *
 * @package    DashboardController
 * @copyright  2023
 * @author     Irfan Ahmad <irfan.ahmad@globiztechnology.com>
 * @version    Release: 1.0.0
 * @since      Class available since Release 1.0.0
 */

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Models\Admin\Faq;
use App\Models\Admin\Sports;
use App\Models\Admin\Testimonial;
use App\Models\Admin\Success;
use App\Models\Admin\ContactUs;


class DashboardController extends AppController
{
	function __construct()
	{
		parent::__construct();
	}

    function index(Request $request)
    {
        $faq['active'] = Faq::getCount(['faqs.status' => 1]);
        $faq['inactive'] = Faq::getCount(['faqs.status' => 0]);
        $faq['total'] = Faq::count();

        $sports['active'] = Sports::getCount(['sports.status' => 1]);
        $sports['inactive'] = Sports::getCount(['sports.status' => 0]);
        $sports['total'] = Sports::count();

        $test['active'] = Testimonial::getCount(['testimonials.status' => 1]);
        $test['inactive'] = Testimonial::getCount(['testimonials.status' => 0]);
        $test['total'] = Testimonial::count();

        $success['active'] = Success::getCount(['success.status' => 1]);
        $success['inactive'] = Success::getCount(['success.status' => 0]);
        $success['total'] = Success::count();

        $contactUs['total'] = ContactUs::count();

        return view("admin/dashboard/dashboard",[
        	'faq' => $faq,
        	'sports' => $sports,
        	'test' => $test,
        	'success' => $success,
        	'contact' => $contactUs
        ]);
    }
}
