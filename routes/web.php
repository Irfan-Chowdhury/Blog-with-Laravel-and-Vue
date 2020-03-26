<?php

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

Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');
//Route::get('/{anypath}', 'HomeController@index')->where('path','.*');  //use for match both router of Laravel & Vue 

// Route::get('/dashboard', 'HomeController@index')->name('home');

Route::get('/post', 'PostController@all_post');

//--Category--

Route::post('/add-category', 'CategoryController@add_category');
Route::get('/category', 'CategoryController@all_category');
Route::get('/category/{id}', 'CategoryController@delete_category');
Route::get('/edit-category/{id}', 'CategoryController@edit_category');
Route::post('/update-category/{id}', 'CategoryController@update_category');

//POST
Route::get('/post','PostController@all_post');
