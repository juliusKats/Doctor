<?php

use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::view('/', 'welcome');

Route::view('dashboard', 'dashboard')
    ->middleware(['auth', 'verified'])
    ->name('dashboard');

Route::view('profile', 'profile')
    ->middleware(['auth'])
    ->name('profile');

require __DIR__.'/auth.php';

//Routes without group function
//Route::get('admin/login','App\Http\Controllers\Admin\AdminController@login');
//Route::get('admin/dashboard','App\Http\Controllers\Admin\AdminController@dashboard');

//Routes with group function
Route::prefix('/admin')->namespace('App\Http\Controllers\Admin')->group(function (){
    //admin login
    Route::match(['post','get'],'login','AdminController@login')->name('login');
    Route::group(['middleware'=>['admin']],function(){
        //    admin dashboard
        Route::get('admindashboard','AdminController@dashboard')->name('admindashboard');
        Route::get('adminlogout','AdminController@logout')->name('adminlogout');
    });
    Route::post('authenticate','AdminController@authenticate')->name('authenticate');

});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});
