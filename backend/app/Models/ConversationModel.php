<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ConversationModel extends Model
{
    use HasFactory;
    protected $table = 'conversation';
    protected $fillable = [
        'user1_id',
        'user2_id'
    ];
}
