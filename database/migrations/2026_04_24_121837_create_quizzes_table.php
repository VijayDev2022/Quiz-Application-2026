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
        Schema::create('quizzes', function (Blueprint $table) {
            $table->id();
             $table->string('name');

            // time in minutes
            $table->integer('time_limit')->default(10);

            // category relation
            $table->unsignedBigInteger('category_id')->nullable();

            // difficulty type
            $table->enum('type', ['easy', 'medium', 'difficult'])->default('easy');

            // status
            $table->boolean('status')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('quizzes');
    }
};
