<?php
Route::get('/sports', '\App\Http\Controllers\Admin\SportController@index')
    ->name('admin.sports');

Route::get('/sports/add', '\App\Http\Controllers\Admin\SportController@add')
    ->name('admin.sports.add');

Route::post('/sports/add', '\App\Http\Controllers\Admin\SportController@add')
    ->name('admin.sports.add');

Route::get('/sports/{id}/view', '\App\Http\Controllers\Admin\SportController@view')
    ->name('admin.sports.view');

Route::get('/sports/{id}/edit', '\App\Http\Controllers\Admin\SportController@edit')
    ->name('admin.sports.edit');

Route::post('/sports/{id}/edit', '\App\Http\Controllers\Admin\SportController@edit')
    ->name('admin.sports.edit');

Route::post('/sports/bulkActions/{action}', '\App\Http\Controllers\Admin\SportController@bulkActions')
    ->name('admin.sports.bulkActions');

Route::get('/sports/{id}/delete', '\App\Http\Controllers\Admin\SportController@delete')
    ->name('admin.sports.delete');