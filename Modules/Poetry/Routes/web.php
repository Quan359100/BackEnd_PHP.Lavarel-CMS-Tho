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

use Modules\Poetry\Http\Controllers\PoetryController;

Route::group(['prefix' => 'admin', 'as' => 'admin.'], function () {

    /**
     * Poetry CRUD
     */
    Route::group(['prefix' => ''], function () {
        Route::resource('poetry', PoetryController::class);
        Route::get('poetry/trashed/view', [PoetryController::class, 'trashed'])->name('poetry.trashed');
        Route::delete('poetry/trashed/destroy/{id}', [PoetryController::class, 'destroyTrash'])->name('poetry.trashed.destroy');
        Route::put('poetry/trashed/revert/{id}', [PoetryController::class, 'revertFromTrash'])->name('poetry.trashed.revert');
        //Route::post('poetry/import', [PoetryController::class, 'import'])->name('poetry.import');
    });
});
