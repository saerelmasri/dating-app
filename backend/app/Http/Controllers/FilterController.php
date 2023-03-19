<?php

namespace App\Http\Controllers;

use App\Models\User;
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

        return response()->json([
            'data' => $users,
        ]);

    }
}