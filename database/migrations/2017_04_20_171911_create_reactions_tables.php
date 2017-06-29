<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateReactionsTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comments_proposal_reactions', function(Blueprint $table){
            $table->increments('id');
            $table->unsignedInteger('user_id')->references('id')->on('users');
            $table->unsignedInteger('comment_id')->references('id')->on('comments_proposals');    
            $table->enum('reaction', ['dislike', 'like']);
            $table->unique(['user_id', 'comment_id', 'reaction']);
        });
        Schema::create('comments_question_reactions', function(Blueprint $table){
            $table->increments('id');
            $table->unsignedInteger('user_id')->references('id')->on('users');
            $table->unsignedInteger('comment_id')->references('id')->on('comments_questions');    
            $table->enum('reaction', ['dislike', 'like']);
            $table->unique(['user_id', 'comment_id', 'reaction']);
        });
        Schema::create('proposal_reactions', function(Blueprint $table){
            $table->increments('id');
            $table->unsignedInteger('user_id')->references('id')->on('users');
            $table->unsignedInteger('proposal_id')->references('id')->on('proposals');    
            $table->enum('reaction', ['dislike', 'like']);
            $table->unique(['user_id', 'proposal_id', 'reaction']);
        });
        Schema::create('question_reactions', function(Blueprint $table){
            $table->increments('id');
            $table->unsignedInteger('user_id')->references('id')->on('users')->unique();
            $table->unsignedInteger('question_id')->references('id')->on('questions');    
            $table->enum('reaction', ['dislike', 'like']);
            $table->unique(['user_id', 'question_id', 'reaction']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('comments_proposal_reactions');
        Schema::dropIfExists('comments_question_reactions');        
        Schema::dropIfExists('proposal_reactions');
        Schema::dropIfExists('question_reactions');
    }
}
