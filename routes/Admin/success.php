<?php
Route::get('/success-stories', '\App\Http\Controllers\Admin\SuccessController@index')
    ->name('admin.success');

Route::get('/success-stories/add', '\App\Http\Controllers\Admin\SuccessController@add')
    ->name('admin.success.add');

Route::post('/success-stories/add', '\App\Http\Controllers\Admin\SuccessController@add')
    ->name('admin.success.add');

Route::get('/success-stories/{id}/view', '\App\Http\Controllers\Admin\SuccessController@view')
    ->name('admin.success.view');

Route::get('/success-stories/{id}/edit', '\App\Http\Controllers\Admin\SuccessController@edit')
    ->name('admin.success.edit');

Route::post('/success-stories/{id}/edit', '\App\Http\Controllers\Admin\SuccessController@edit')
    ->name('admin.success.edit');

Route::post('/success-stories/bulkActions/{action}', '\App\Http\Controllers\Admin\SuccessController@bulkActions')
    ->name('admin.success.bulkActions');

Route::get('/success-stories/{id}/delete', '\App\Http\Controllers\Admin\SuccessController@delete')
    ->name('admin.success.delete');