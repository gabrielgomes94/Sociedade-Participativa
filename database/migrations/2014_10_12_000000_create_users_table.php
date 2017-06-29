<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('name', 50);
            $table->string('lastname', 100)->nullable();
            $table->string('email', 200);
            $table->string('password');
            $table->string('photo_url', 255)->nullable();
            $table->enum('gender', ['man', 'woman']);
            $table->date('birthday');
            $table->string('street', 100)->nullable();
            $table->integer('street_number')->nullable()->unsigned();
            $table->string('district', 100)->nullable();
            $table->string('city', 100);
            $table->string('state', 50);
            $table->string('country', 50);
            $table->string('zipcode')->nullable();
            $table->integer('score')->default(0)->unsigned();
            $table->integer('level')->default(0)->unsigned();
            $table->enum('type', ['admin', 'common'])->default('common');
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
}
