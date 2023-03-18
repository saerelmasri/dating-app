<?php

namespace App\Http\Controllers;

use App\Models\Account;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class AccountController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login','signup']]);
    }

    public function all(){
        $account = Account::all();
        return response()->json([
            'status'=>200,
            'message'=>$account
        ],200);
    }

    public function signup(Request $request){
        $validator = Validator::make($request-> all(),[
            'first_name'=>'required|max:255',
            'last_name'=>'required|max:255',
            'age'=>'required|integer',
            'location'=>'required|max:255',
            'bio'=>'required|max:255',
            'email'=>'required|email|max:255|unique:account,email',
            'password'=>'required|min:8|max:255|regex:/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).+$/',
            'gender_id'=>'required|exists:gender,id',
        ]);
        if($validator->fails()){
            return response() -> json([
                'status'=>'401',
                'message'=>$validator->errors()
            ],422);
        }
        $account = Account::create([
            'first_name'=>$request->first_name,
            'last_name'=>$request->last_name,
            'age'=>$request->age,
            'location'=>$request->location,
            'bio'=>$request->bio,
            'email'=>$request->email,
            'password'=>Hash::make($request->passoword),
            'gender_id'=>$request->gender_id,
        ]);
        $token = Auth::login($account);
        
        return response() -> json([
            'status'=>'201',
            'message'=> 'User created successfully',
            'authorization'=> [
                'token' => $token
            ]
        ]);
    }

    public function login(Request $request){
        $validator = Validator::make($request-> all(),[
            'email'=>'required|email',
            'password'=>'required',
        ]);
        if($validator->fails()){
            return response() -> json([
                'status'=>'400',
                'message'=>$validator->errors()
            ],400);
        }
        $credentials = $request->only('email', 'password');
        $token =  Auth::attempt($credentials);
     
        return $this -> respondWithToken($token);
    }

    protected function respondWithToken($token){
        return response()->json([
            'access_token'=>$token,
            'token_type'=>'bearer'
        ]);
    }
}
