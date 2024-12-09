<?php
namespace App\Libraries;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Http;
use App\Models\Admin\Setting;
use App\Models\Admin\EmailTemplate;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Crypt;
use App\Libraries\SendGrid;
use App\Mail\MyMail;
use App\Models\Admin\EmailLog;
use Hashids\Hashids;
use Illuminate\Pagination\LengthAwarePaginator as Paginator;

class General
{
	/** 
	* To make random hash string
	*/	
	public static function hash($limit = 32)
	{
		return Str::random($limit);
	}

	public static function randomNumber($limit = 8)
	{
		$characters = '0123456789';
	    $charactersLength = strlen($characters);
	    $randomString = '';
	    for ($i = 0; $i < $limit; $i++) {
	        $randomString .= $characters[rand(0, $charactersLength - 1)];
	    }
	    return $randomString;
	}

	public static function encrypt($string)
	{
		return Crypt::encryptString($string);
	}

	public static function decrypt($string)
	{
		return Crypt::decryptString($string);
	}

	public static function encode($string)
	{
		$hashids = new Hashids(config('app.key'), 6);
		return $hashids->encode($string);
	}

	public static function decode($string)
	{
		$hashids = new Hashids(config('app.key'), 6);
		return current($hashids->decode($string));
	}

	public static function renderProfileImage($array, $key) 
	{
		return isset($array) && isset($array[$key]) && $array[$key] && file_exists(public_path($array[$key])) ? url($array[$key]) : url('admin/assets/img/noprofile.png') ;
	}

	public static function renderImage($array, $key = null) 
	{ 
		if(isset($key) && $key)
		{ 
			return isset($array) && isset($array[$key]) && $array[$key] && file_exists(public_path($array[$key])) ? url($array[$key]) : url('admin/assets/img/no_image.jpg');
		}
		else
		{
           	return isset($array) && isset($array) && $array && file_exists(public_path($array)) ? url($array) : url('admin/assets/img/no_image.jpg');
		}
	}

	public static function pagination($request,$array, $limit = 10)
	{
		$listing = [];
		if(isset($request) && $request)
		{
			$total = count($array);
			$per_page = $limit;
			$current_page = $request->input("page") ?? 1;
			$starting_point = ($current_page * $per_page) - $per_page;
			$array = array_slice($array, $starting_point, $per_page, true);
	    	$listing = new Paginator($array, $total, $per_page, $current_page, [
	            'path'  => $request->url(),
	            'query' => $request->query(),
	            'total' => $total,
	            'currentPage' => $current_page,
	            'perPage' => $per_page,
	        ]);
		}

		return $listing;
	}
}