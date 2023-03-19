<?php

namespace App\Http\Controllers;

use App\Models\User;
use App\Models\ExtraInfo;
use Illuminate\Http\Request;

class FilterController extends Controller
{
    public function filter(Request $request){
        
        $query = User::query();

        if ($request->has('first')) {
            $query->where('first_name', 'LIKE', '%'.$request->input('first').'%');
        }

        if ($request->has('last')) {
            $query->where('last_name', 'LIKE', '%'.$request->input('last').'%');
        }

        if ($request->has('location')) {
            $query->where('location', $request->input('location'));
        }

        if ($request->has('age')) {
            $query->where('age', $request->input('age'));
        }

        $users = $query->get();

        if ($users->isEmpty()) {
            return response()->json([
                'status' => 404,
                'message' => 'No users found'
            ], 404);
        }

        return response()->json([
            'data' => $users,
        ]);

    }

     public function index(Request $request){
        try {
            $excludeUserId = $request->input('exclude_user_id');
            $users = User::where('id', '!=', $excludeUserId)->get();
            return response()->json([
                'data' => $users,
            ])->header('Access-Control-Allow-Origin', '*');
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    public function getById(Request $request){
        try {
            $user_id = $request->input('user_id');
            $user = User::find($user_id);
            if (!$user) {
                return response()->json([
                    'status' => 404,
                    'message' => 'User not found'
                ], 404);
            }
            return response()->json([
                'data' => $user,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage(),
            ], 500);
        }
    }

    public function getBio(Request $request){
        try {
            $user_id = $request->input('user_id');
            $user = ExtraInfo::where('user_id', $user_id)->first();
            if (!$user) {
                return response()->json([
                    'status' => 404,
                    'message' => 'User not found'
                ], 404);
            }
            return response()->json([
                'data' => $user,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'error' => $e->getMessage(),
            ], 500);
        }
    }
}
