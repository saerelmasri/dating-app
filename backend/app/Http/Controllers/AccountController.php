<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;

class AccountController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login','signup']]);
    }

    public function signup(Request $request){
        $validator = Validator::make($request-> all(),[
            'first_name'=>'required|max:255',
            'last_name'=>'required|max:255',
            'age'=>'required|integer',
            'location'=>'required|max:255',
            'bio'=>'required|max:255',
            'email'=>'required|email|max:255|unique:users,email',
            'password'=>'required|min:8|max:255|regex:/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/',
            'gender_id'=>'required|exists:gender,id',
        ]);
        if($validator->fails()){
            return response() -> json([
                'status'=>'401',
                'message'=>$validator->errors()
            ],400);
        }
        $user = User::create([
            'first_name'=>$request->first_name,
            'last_name'=>$request->last_name,
            'age'=>$request->age,
            'location'=>$request->location,
            'bio'=>$request->bio,
            'email'=>$request->email,
            'password'=>bcrypt($request->password),
            'gender_id'=>$request->gender_id,
        ]);

        return response() -> json([
            'status'=>'201',
            'message'=> 'User created successfully'
        ],201);
    }

    public function login(Request $request){
        $validator = Validator::make($request-> all(),[
            'email'=>'required|email',
            'password'=>'required|string',
        ]);
        if($validator->fails()){
            return response() -> json([
                'status'=>'400',
                'message'=>$validator->errors()
            ],422);
        }
        if (! $token = auth()->attempt($validator->validated())) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }
        return $this->createNewToken($token);
    }

    public function userProfile() {
        return response()->json(auth()->user());
    }

    public function logout() {
        auth()->logout();
        return response()->json(['message' => 'User successfully signed out']);
    }

    protected function createNewToken($token){
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 60,
            'user' => auth()->user()
        ]);
    }
}
