<?php

namespace App\Http\Controllers;

use App\Models\ExtraInfo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ExtraInfoController extends Controller
{
    public function addInfo(Request $request){
        $validator = Validator::make($request->all(),[
            'user_id'=>'required|exists:users,id',
            'bio'=>'required|string|max:255',
            'hobbie1'=>'required|string|max:255',
            'hobbie2'=>'required|string|max:255',
            'hobbie3'=>'required|string|max:255'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 401,
                'message' => $validator->errors()
            ], 401);
        }

        $extra = ExtraInfo::create([
            'user_id'=>$request->user_id,
            'bio'=>$request->bio,
            'hobbie1'=>$request->hobbie1,
            'hobbie2'=>$request->hobbie2,
            'hobbie3'=>$request->hobbie3
        ]);
    
        return response() -> json([
            'status'=>201,
            'message'=> 'Extra Info added successfully'
        ],201);
    }
}
