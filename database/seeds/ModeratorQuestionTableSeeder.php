<?php

use Illuminate\Database\Seeder;

class ModeratorQuestionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //DB::table('moderator_questions')->truncate();
        DB::table('moderator_questions')->insert([        	
        	'user_id' => '1',
        	'question_id' => '1' 	
        	]
        );
    }
}
