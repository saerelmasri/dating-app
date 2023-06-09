<?php
header('Access-Control-Allow-Origin:  *');
header('Access-Control-Allow-Methods:  POST, GET, OPTIONS, PUT, DELETE');
header('Access-Control-Allow-Headers:  Content-Type, X-Auth-Token, Origin, Authorization');
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\PhotoController;
use App\Http\Controllers\FilterController;
use App\Http\Controllers\AccountController;
use App\Http\Controllers\MessageController;
use App\Http\Controllers\ExtraInfoController;
use App\Http\Controllers\BlockedUsersController;
use App\Http\Controllers\ConversationController;
use App\Http\Controllers\FavoriteUsersController;


Route::group([
    'middleware'=>'api',
    'prefix'=>'auth'
], function($router){
    Route::post('/signup', [AccountController::class, 'signup']);
    Route::post('/login', [AccountController::class, 'login']);
    Route::post('/login-extra', [ExtraInfoController::class, 'addInfo']);
    Route::post('/login-relation', [ExtraInfoController::class, 'addRelation']);
    Route::get('/user-profile', [AccountController::class, 'userProfile']); 
    Route::post('/logout', [AccountController::class, 'logout']);
    
});


Route::middleware('jwt.verify')-> group(function(){
    Route::group([
        'prefix'=>'filter'
    ], function($router){
        Route::get('/users', [FilterController::class, 'filter']);
        Route::post('/list', [FilterController::class, 'index']);
        Route::post('/userById', [FilterController::class, 'getById']);
        Route::post('/userBio', [FilterController::class, 'getBio']);
        
    });
    Route::group([
        'prefix'=>'user'
    ], function($router){
        Route::post('/addFavorite', [FavoriteUsersController::class, 'addFavorite']);
        Route::post('/removeFavorite', [FavoriteUsersController::class, 'removeFavorite']);
        Route::post('/allFavorite', [FavoriteUsersController::class, 'allFavorite']);
        Route::post('/addBlocked', [BlockedUsersController::class, 'addBlock']);
        Route::post('/removeBlocked', [BlockedUsersController::class, 'removeBlocked']);
        Route::get('/allBlocked/{id}', [BlockedUsersController::class, 'allBlock']);
    });
    Route::group([
        'prefix'=>'chat'
    ], function($router){
        Route::post('/createConversation', [ConversationController::class, 'createConversation']);
        Route::get('/allConversation/{id}', [ConversationController::class, 'allConversations']);
        Route::get('/conversation/{id}', [MessageController::class, 'conversation_message']);
        Route::post('/message', [MessageController::class, 'message']);
    });
});


Route::group([
    'prefix'=>'photos'
],function($router){
    Route::post('/add', [PhotoController::class, 'addPhotos']);
    Route::put('/update/{id}', [PhotoController::class, 'editPhotos']);
    Route::delete('/remove/{id}', [PhotoController::class, 'removePhoto']);
});

