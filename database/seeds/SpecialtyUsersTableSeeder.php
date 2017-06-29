<?php

use Illuminate\Database\Seeder;

class SpecialtyUsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //DB::table('specialty_user')->truncate();
        DB::table('specialty_user')->insert([[        	
        	'user_id' => '1',
        	'specialty_id' => '1'        	
        	], 
        	[
        	'user_id' => '1',
        	'specialty_id' => '3'        	
        	],
        	[
        	'user_id' => '1',
        	'specialty_id' => '2'        	
        	],
            [
            'user_id' => '1',
            'specialty_id' => '4']
        ]);
    }
}
