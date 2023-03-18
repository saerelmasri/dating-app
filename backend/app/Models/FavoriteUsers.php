<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FavoriteUsers extends Model
{
    use HasFactory;
    protected $table = 'favorite_users';
    protected $fillable = [
        'user_id',
        'user_favorite_id'
    ];
}
