<?php

namespace App\Http\Controllers;

use App\Models\BlockedUsers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class BlockedUsersController extends Controller
{
    public function addBlock(Request $request){
        $validator = Validator::make($request->all(),[
            'user_id'=>'required|exists:users,id',
            'user_blocked_id'=>'required|exists:users,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 401,
                'message' => $validator->errors()
            ], 401);
        }

        $favorite = BlockedUsers::create($validator->validated());

        return response()->json([
            'status' => 200,
            'message' => 'User added to blocked successfully'
        ]);
    }

    public function removeBlocked(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'user_id' => 'required|exists:users,id',
            'user_blocked_id' => 'required|exists:users,id',
        ]);
        if ($validator->fails()) {
            return response()->json([
                'status' => 401,
                'message' => $validator->errors()
            ], 401);
        }
        $blocked = BlockedUsers::where('user_id', $request->user_id)
            ->where('user_blocked_id', $request->user_blocked_id)
            ->first();

        if (!$blocked) {
            return response()->json([
                'status' => 404,
                'message' => 'Blocked user not found'
            ], 404);
        }
        $blocked->delete();
        return response()->json([
            'status' => 200,
            'message' => 'Blocked user removed successfully'
        ], 200);
    }

    public function allBlock($id){
        $blockUsers = BlockedUsers::where('user_id', $id)->get();
        
        return response()->json([
            'status' => 200,
            'data' => $blockUsers,
        ]);
    }
}
