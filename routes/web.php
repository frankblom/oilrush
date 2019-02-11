<?php
use Illuminate\Support\Facades\Cache;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::group(['middleware' => ['guest']], function () {
	Route::get('/', 'HomeController@show')->name('show-login');  
	Route::post('/', 'HomeController@login')->name('post-login');  
});

Route::get('AD', 'AdminController@admin')->name('admin');
Route::post('AD', 'AdminController@action')->name('update-country');


Route::group(['middleware' => ['auth']], function () {
	Route::get('sources/{id}', 'SourceController@show')->name('show-source');
	Route::post('sources/{id}', 'SourceController@update')->name('update-country');

	Route::get('countries/{id}', 'CountryController@show')->name('show-country');

	Route::get('score', 'AdminController@score');

	Route::get('logout', function(){
		session(['login'=>null]);
		return redirect('/');
	})->name('show-country');
});