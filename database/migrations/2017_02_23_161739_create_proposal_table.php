<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProposalTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('proposals', function (Blueprint $table) {
            $table->increments('id');
            $table->string('content', 10000);            
            $table->timestamp('post_date')->nullable();            
            $table->timestamp('post_modified_date')->nullable();
            $table->unsignedInteger('author_id')->references('id')->on('users');
            $table->unsignedInteger('question_id')->references('id')->on('questions');            
            $table->integer('upvotes')->default(0);
            $table->integer('downvotes')->default(0);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('proposals');
    }
}
