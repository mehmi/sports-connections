<?php
Route::get('/our-team', '\App\Http\Controllers\Admin\OurTeamController@index')
    ->name('admin.ourteam');

Route::get('/our-team/add', '\App\Http\Controllers\Admin\OurTeamController@add')
    ->name('admin.ourteam.add');

Route::post('/our-team/add', '\App\Http\Controllers\Admin\OurTeamController@add')
    ->name('admin.ourteam.add');

Route::get('/our-team/{id}/view', '\App\Http\Controllers\Admin\OurTeamController@view')
    ->name('admin.ourteam.view');

Route::get('/our-team/{id}/edit', '\App\Http\Controllers\Admin\OurTeamController@edit')
    ->name('admin.ourteam.edit');

Route::post('/our-team/{id}/edit', '\App\Http\Controllers\Admin\OurTeamController@edit')
    ->name('admin.ourteam.edit');

Route::post('/our-team/bulkActions/{action}', '\App\Http\Controllers\Admin\OurTeamController@bulkActions')
    ->name('admin.ourteam.bulkActions');

Route::get('/our-team/{id}/delete', '\App\Http\Controllers\Admin\OurTeamController@delete')
    ->name('admin.ourteam.delete');