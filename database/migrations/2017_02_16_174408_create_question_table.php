<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateQuestionTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('questions', function (Blueprint $table) {
            $table->increments('id');
            $table->string('title', 150);
            $table->string('content', 10000);
            $table->timestamp('post_date')->nullable();            
            $table->timestamp('post_modified_date')->nullable();            
            $table->unsignedInteger('author_id')->references('id')->on('users');
            $table->string('district', 100)->nullable();
            $table->string('city', 100)->nullable();
            $table->string('state', 50)->nullable();
            $table->string('country', 50)->nullable();      
            $table->integer('upvotes')->default(0);
            $table->integer('downvotes')->default(0);      
            $table->enum('status', ['Aberto', 'Fechado']);                        
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('questions');
    }
}
