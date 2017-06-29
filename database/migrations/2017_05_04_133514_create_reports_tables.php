<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateReportsTables extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('comments_proposal_reports', function(Blueprint $table){
            $table->increments('id');
            $table->unsignedInteger('user_id')->references('id')->on('users');
            $table->unsignedInteger('comment_id')->references('id')->on('comments_proposals');    
            $table->string('reason');
            $table->string('description')->nullable();            
            $table->unique(['user_id', 'comment_id', 'reason']);
        });
        Schema::create('comments_question_reports', function(Blueprint $table){
            $table->increments('id');
            $table->unsignedInteger('user_id')->references('id')->on('users');
            $table->unsignedInteger('comment_id')->references('id')->on('comments_proposals');    
            $table->string('reason');
            $table->string('description')->nullable();            
            $table->unique(['user_id', 'comment_id', 'reason']);
        });
        Schema::create('proposal_reports', function(Blueprint $table){
            $table->increments('id');
            $table->unsignedInteger('user_id')->references('id')->on('users');
            $table->unsignedInteger('proposal_id')->references('id')->on('proposals');    
            $table->string('reason');
            $table->string('description')->nullable();            
            $table->unique(['user_id', 'proposal_id', 'reason']);            
        });
        Schema::create('question_reports', function(Blueprint $table){
            $table->increments('id');
            $table->unsignedInteger('user_id')->references('id')->on('users');
            $table->unsignedInteger('question_id')->references('id')->on('questions');
            $table->string('reason');
            $table->string('description')->nullable();            
            $table->unique(['user_id', 'question_id', 'reason']);            
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('comments_proposal_reports');
        Schema::dropIfExists('comments_question_reports');        
        Schema::dropIfExists('proposal_reports');
        Schema::dropIfExists('question_reports');
    }
}
