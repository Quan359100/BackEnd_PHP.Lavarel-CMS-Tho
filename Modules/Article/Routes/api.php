<?php

use Illuminate\Http\Request;
use Modules\Article\Http\Controllers\PagesController;
use Modules\Article\Http\Controllers\CategoriesController;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// get random article
Route::get('pages/random', [PagesController::class, 'getRandomPages']);

// get  categories
Route::get('/categories', [CategoriesController::class, 'getCategories']);

// get list article on categories
Route::get('/category', [PagesController::class, 'getPageCategory']);

// get description article
Route::get('/article', [PagesController::class, 'getDesPages']);

// get chat infor
Route::get('/chat', [PagesController::class, 'getChat']);

// get article , poetry , and author infor
Route::get('/search', [PagesController::class, 'search']);