<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Backend\SettingsController;
use App\Http\Controllers\Backend\AuthorController;
use App\Http\Controllers\Frontend\FrontPagesController;
use Monolog\Logger;
use Monolog\Handler\StreamHandler;
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

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

$log = new Logger('name');
$log->pushHandler(new StreamHandler(storage_path('logs/test.log'), Logger::DEBUG));

// Add records to the log
$log->info('This is a direct test log using Monolog');


// get Data from setting api
Route::get('/config', [SettingsController::class, 'getDataSettings']);

Route::get('/authors', [AuthorController::class, 'getAllAuthors']);

Route::post('/register', [FrontPagesController::class, 'register']);
