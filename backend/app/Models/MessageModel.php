<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MessageModel extends Model
{
    use HasFactory;
    protected $table = 'message';
    protected $fillable = [
        'conversation_id',
        'user_id',
        'message_content'
    ];
}
