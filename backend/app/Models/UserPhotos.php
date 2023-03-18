<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserPhotos extends Model
{
    use HasFactory;
    protected $table = 'user_photos';
    protected $fillable = [
        'user_id',
        'profile_pic',
        'profile_add1',
        'profile_add2',
        'profile_add3',
    ];
}
