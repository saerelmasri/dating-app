<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\FavoriteUsers;
use Illuminate\Support\Facades\Validator;

class FavoriteUsersController extends Controller
{
    public function addFavorite(Request $request){
        $validator = Validator::make($request->all(),[
            'user_id'=>'required|exists:users,id',
            'user_favorite_id'=>'required|exists:users,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 401,
                'message' => $validator->errors()
            ], 401);
        }

        $favorite = FavoriteUsers::create($validator->validated());

        return response()->json([
            'status' => 200,
            'message' => 'User added to favorites successfully'
        ]);
    }

    public function removeFavorite(Request $request)
        {
    $validator = Validator::make($request->all(), [
        'user_id' => 'required|exists:users,id',
        'user_favorite_id' => 'required|exists:users,id',
    ]);
    if ($validator->fails()) {
        return response()->json([
            'status' => 401,
            'message' => $validator->errors()
        ], 401);
    }
    $favorite = FavoriteUsers::where('user_id', $request->user_id)
        ->where('user_favorite_id', $request->user_favorite_id)
        ->first();

    if (!$favorite) {
        return response()->json([
            'status' => 404,
            'message' => 'Favorite user not found'
        ], 404);
    }
    $favorite->delete();
    return response()->json([
        'status' => 200,
        'message' => 'Favorite user removed successfully'
    ], 200);
    }
}
