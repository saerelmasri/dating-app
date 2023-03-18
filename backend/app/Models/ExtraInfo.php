<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExtraInfo extends Model
{
    use HasFactory;
    protected $table = 'extra_info';
    protected $fillable = [
        'user_id',
        'bio',
        'hobbie1',
        'hobbie2',
        'hobbie3'
    ];
}
