<?php

use Illuminate\Http\Request;
use Modules\Poetry\Http\Controllers\PoetryController;
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
Route::get('poetry/random', [PoetryController::class, 'getRandomPoetry']);