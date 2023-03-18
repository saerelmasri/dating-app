<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AccountController;


Route::post('/signup', [AccountController::class, 'signup']);
Route::post('/login', [AccountController::class, 'signup']);
Route::get('/all', [AccountController::class, 'all']);
