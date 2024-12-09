<?php

namespace App\Http\Controllers\Admin;

use Illuminate\Http\Request;

use App\Libraries\FileSystem;

use App\Models\Admin\PageContent;


class HomeController extends AppController
{
    function __construct()
    {
        parent::__construct();
    }

    function index(Request $request)
    {
        return view('admin.home.index');
    } 

}
