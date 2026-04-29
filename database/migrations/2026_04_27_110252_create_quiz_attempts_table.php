<?php
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('quiz_attempts', function (Blueprint $table) {
            $table->id();

            // user who is taking quiz
            $table->unsignedBigInteger('user_id');

            // quiz reference
            $table->unsignedBigInteger('quiz_id');

            // progress tracking
            $table->integer('current_question')->default(0);
            $table->integer('time_left')->default(0); // in seconds
            $table->integer('score')->default(0); // in seconds

            // store answers as JSON
            $table->longText('answers')->nullable();

            // status: running / paused / completed
            $table->enum('status', ['running', 'paused', 'completed'])
                  ->default('running');

            $table->timestamps();

            // optional foreign keys (recommended)
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('quiz_id')->references('id')->on('quizzes')->onDelete('cascade');
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('quiz_attempts');
    }
};