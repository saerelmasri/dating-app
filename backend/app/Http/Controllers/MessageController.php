<?php

namespace App\Http\Controllers;

use App\Models\MessageModel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class MessageController extends Controller
{
    public function message(Request $request){
        $validator = Validator::make($request->all(),[
            'user_id'=>'required|exists:users,id',
            'conversation_id'=>'required|exists:conversation,id',
            'message_content'=>'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status' => 401,
                'message' => $validator->errors()
            ], 401);
        }

        $message = MessageModel::create([
            'user_id'=>$request->user_id,
            'conversation_id'=>$request->conversation_id,
            'message_content'=>$request->message_content,
        ]);
    
        return response() -> json([
            'status'=>201,
            'message'=> 'Message sent successfully'
        ],201);
    }

    public function conversation_message($id){
        $conversations = MessageModel::where('conversation_id', $id)->get();
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
