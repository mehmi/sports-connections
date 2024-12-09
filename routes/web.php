<?php

use Illuminate\Support\Facades\Route;

Route::middleware(['guest'])->group(function()
{
    include "Frontend/actions.php";
    include "Frontend/home.php";
    include "Admin/auth.php";
});


Route::prefix('admin')->middleware(['adminAuth'])->group(function () {
    include "Admin/dashboard.php";
    include "Admin/profile.php";
    include "Admin/settings.php";
    include "Admin/actions.php";
    include "Admin/activities.php";
    include "Admin/admins.php";
    include "Admin/faq.php";
    include "Admin/testimonial.php";
    include "Admin/contactUs.php";
    include "Admin/home.php";
    include "Admin/pages.php";
    include "Admin/pageContent.php";
    include "Admin/sports.php";
    include "Admin/success.php";
    include "Admin/team.php";
});

if(isset($_SERVER['HTTP_HOST']) && $_SERVER['HTTP_HOST'] != 'localhost')
{
    Route::fallback(function () {
        abort(404);
    });

    Route::any('{url}', function(){
        return redirect('/');
    })->where('url', '.*');
}