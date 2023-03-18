<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PhotoController;
use App\Http\Controllers\FilterController;
use App\Http\Controllers\AccountController;


Route::group([
    'middleware'=>'api',
    'prefix'=>'auth'
], function($router){
    Route::post('/signup', [AccountController::class, 'signup']);
    Route::post('/login', [AccountController::class, 'login']);
    Route::get('/user-profile', [AccountController::class, 'userProfile']); 
    Route::post('/logout', [AccountController::class, 'logout']);
    
});

Route::group([
    'prefix'=>'filter'
], function($router){
    Route::get('/users', [FilterController::class, 'filter']);
});

Route::group([
    'prefix'=>'photos'
],function($router){
    Route::post('/add', [PhotoController::class, 'addPhotos']);
    Route::put('/update/{id}', [PhotoController::class, 'editPhotos']);
    Route::delete('/remove/{id}', [PhotoController::class, 'removePhoto']);

});