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

    public function editPhotos(Request $request, $id){
        $validator = Validator::make($request->all(), [
            'profile_pic'=>'sometimes|max:255',
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

        $user_photos = UserPhotos::where('user_id',$id)->first();
        if(!$user_photos){
            return response()->json([
                'status'=> 404,
                'message'=> 'User photo not found'
            ], 404);
        }

        $user_photos->profile_pic = $request->input('profile_pic', $user_photos->profile_pic);
        $user_photos->profile_add1 = $request->input('profile_add1', $user_photos->profile_add1);
        $user_photos->profile_add2 = $request->input('profile_add2', $user_photos->profile_add2);
        $user_photos->profile_add3 = $request->input('profile_add3', $user_photos->profile_add3);
        $user_photos->save();

        return response()->json([
            'status'=>200,
            'message'=>'User photo updated successfully'
        ], 200);
    }

    public function removePhoto(Request $request, $id)
    {
        $photos = UserPhotos::where('user_id', $id)->first();
        if (!$photos) {
            return response()->json([
                'status' => 404,
                'message' => 'User photos not found'
            ], 404);
        }
        if ($request->delete_all) {
            $photos->delete();
        } else {
            if ($request->profile_pic) {
                $photos->update(['profile_pic' => null]);
            }
            if ($request->profile_add1) {
                $photos->update(['profile_add1' => null]);
            }
            if ($request->profile_add2) {
                $photos->update(['profile_add2' => null]);
            }
            if ($request->profile_add3) {
                $photos->update(['profile_add3' => null]);
            }
        }
        return response()->json([
            'status' => 200,
            'message' => 'User photos deleted successfully'
        ]);
    }
}
