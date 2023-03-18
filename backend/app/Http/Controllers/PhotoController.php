<?php

namespace App\Http\Controllers;

use App\Models\UserPhotos;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class PhotoController extends Controller
{
    public function addPhotos(Request $request){
        $validator = Validator::make($request->all(), [
            'user_id'=>'required|exists:users,id',
            'profile_pic'=>'required|max:255',
            'profile_add1'=>'max:255|nullable',
            'profile_add2'=>'max:255|nullable',
            'profile_add3'=>'max:255|nullable',
        ]);

        if($validator->fails()){
            return response()->json([
                'status'=>401,
                'message'=>$validator->errors()
            ],401);
        }

        $user_photos = UserPhotos::create($validator->validated());
        
        return response()->json([
            'status'=>201,
            'message'=>'Profile pics created successfully'
        ], 201);
    }
}
