<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Tymon\JWTAuth\Facades\JWTAuth;
use Symfony\Component\HttpFoundation\Response;

class JWTMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response
    {
        try{
            JWTAuth::parseToken() -> authenticate();
        }catch(Exception $e){
            if($e instanceof TokenInvalidException){
                return response() -> json([
                    'status'=>'Invalid Token'
                ],401);
            }

            if($e instanceof TokenExpiredException){
                return response() -> json([
                    'status'=>'Expired Token'
                ],401);
            }

            return response() -> json([
                'status' => 'Token not found'
            ],401);
        }





        return $next($request);
    }
}
