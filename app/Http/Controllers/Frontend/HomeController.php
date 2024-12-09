<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\View;
use Symfony\Component\HttpFoundation\Response;
use Illuminate\Support\Facades\Validator;

use App\Models\Admin\PageContent;
use App\Models\Admin\Testimonial;
use App\Models\Admin\Faq;
use App\Models\Admin\Sports;
use App\Models\Admin\Success;
use App\Models\Admin\OurTeam;


class HomeController extends Controller
{
    function index(Request $request)
    {  
        $pageContent = PageContent::getAllData('home');

        $process = Faq::getAll([
                'faqs.id',
                'faqs.title',
                'faqs.description',
                'faqs.logo',
            ],[
                'faqs.status' => 1
            ],
            'faqs.id desc'
        );

        $athletes = Testimonial::getAll([
                'testimonials.id',
                'testimonials.title',
                'testimonials.image',
            ],[
                'testimonials.status' => 1
            ]);

        $sports = Sports::getAll([
                'sports.id',
                'sports.image',
                'sports.title',
                'sports.description',
            ],[
                'sports.status' => 1
            ],'sports.id asc');

        $success = Success::getAll([
                'success.id',
                'success.image',
                'success.title',
                'success.sub_title',
                'success.description',
            ],[
                'success.status' => 1
            ]);

        $team = OurTeam::getAll([
                'our_team.id',
                'our_team.image',
                'our_team.title',
                'our_team.insta',
                'our_team.linkdin',
                'our_team.facebook',
            ],[
                'our_team.status' => 1
            ]);
             
        $meta = [
            'meta_title' => $pageContent['meta']['title'] ?? 'Homepage',
            'meta_keywords' => $pageContent['meta']['keywords'] ?? 'Homepage',
            'meta_description' => $pageContent['meta']['description'] ??'Homepage',
        ];

        return view(
            "frontend.home.index",
            [
                'meta' => $meta ,
                'content' => $pageContent,
                'process' => $process,
                'athletes' => $athletes,
                'sports' => $sports,
                'success' => $success,
                'team' => $team
            ]
        );
    }

    function contactUs(Request $request)
    {
        if ($request->isMethod('post')) 
        {
            $data = $request->except('_token');
            
            $validator = Validator::make($request->all(), [
                'email' => 'required|email|max:255',               
            ]);

            if (!$validator->fails()) 
            {
                $contactUs = ContactUs::create($data);

                if ($contactUs)
                {
                    return Response()->json([
                        'status' => 'success',
                        'message' => 'Thank you for submitting your queries.',
                    ]);
                }
                else
                {
                    return Response()->json([
                        'status' => 'error',
                        'message' => 'Contact-Us could not be saved. Please try again.',
                    ]);
                }
            }    
            else
            {
                return Response()->json([
                    'status' => 'error',
                    'message' => current( current( $validator->errors()->getMessages() ) ),
                ]);
            }    
        }
    }
}