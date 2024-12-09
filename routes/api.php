<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

// Route::get('/user', function (Request $request) {
//     return $request->user();
// })->middleware('auth:sanctum');


Route::middleware(['guest:api','xss'])->group(function () {
});

Route::middleware(['apiAuth','xss'])->group(function () {
    
});