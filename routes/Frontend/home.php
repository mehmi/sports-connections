<?php
Route::get('/', '\App\Http\Controllers\Frontend\HomeController@index')
    ->name('homepage.index');

Route::post('/contact-us', '\App\Http\Controllers\Frontend\HomeController@index')
    ->name('contactus.index');