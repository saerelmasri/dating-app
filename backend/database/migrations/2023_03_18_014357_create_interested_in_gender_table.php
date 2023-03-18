<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('interested_in_gender', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('gender_id');
            $table->unsignedBigInteger('user_id');
            $table->foreign('gender_id') -> references('id') -> on('gender')->onUpdate('cascade')->onDelete('cascade');
            $table->foreign('user_id') -> references('id') -> on('account')->onUpdate('cascade')->onDelete('cascade');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('interested_in');
    }
};
