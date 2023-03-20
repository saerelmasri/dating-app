<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ConversationModel;
use Illuminate\Support\Facades\Validator;

class ConversationController extends Controller
{
    public function createConversation(Request $request){
        $validator = Validator::make($request->all(),[
            'user1_id'=>'required|exists:users,id',
            'user2_id'=>'required|exists:users,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 401,
                'message' => $validator->errors()
            ], 401);
        }

        $conversation = ConversationModel::create([
            'user1_id'=>$request->user1_id,
            'user2_id'=>$request->user2_id,
        ]);
    
        return response() -> json([
            'status'=>201,
            'message'=> 'Conversation Created Successfully'
        ],201);
    }

    public function allConversations($id){
        $conversations = ConversationModel::where('user1_id', $id)->get();
        if ($conversations -> isEmpty()) {
            return response()->json([
                'status' => 404,
                'message' => 'No Conversations'
            ], 404);
        }
        return response()->json([
            'status' => 200,
            'data' => $conversations,
        ]);
    }
    
}
