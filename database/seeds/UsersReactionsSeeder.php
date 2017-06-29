<?php

use Illuminate\Database\Seeder;

class UsersReactionsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //DB::table('question_reactions')->truncate();
        DB::table('question_reactions')->insert([
        	[
        	'user_id' => '1',
        	'question_id' => '1',
        	'reaction' => 'like',	
        	],[
        	'user_id' => '2',
        	'question_id' => '1',
        	'reaction' => 'like',       	
        	],[
        	'user_id' => '3',
        	'question_id' => '1',
        	'reaction' => 'dislike',
        	], 
        	[
        	'user_id' => '4',
        	'question_id' => '1',
        	'reaction' => 'like',
        	], 
        	[
        	'user_id' => '5',
        	'question_id' => '1',
        	'reaction' => 'like',
        	]
        ]);

        //DB::table('proposal_reactions')->truncate();
        DB::table('proposal_reactions')->insert([
        	[
        	'user_id' => '1',
        	'proposal_id' => '1',
        	'reaction' => '4',	
        	], 
        	[
        	'user_id' => '2',
        	'proposal_id' => '1',
        	'reaction' => '5'
        	], 
        	[
        	'user_id' => '3',
        	'proposal_id' => '1',
        	'reaction' => '1'
        	],
        	[
        	'user_id' => '2',
        	'proposal_id' => '2',
        	'reaction' => '2'
        	],
        	[
        	'user_id' => '1',
        	'proposal_id' => '2',
        	'reaction' => '3'
        	],
        	[
        	'user_id' => '1',
        	'proposal_id' => '3',
        	'reaction' => '3'
        	]
        ]);

        //DB::table('comments_proposal_reactions')->truncate();
        DB::table('comments_proposal_reactions')->insert([
        	[
        	'user_id' => '1',
        	'comment_id' => '1',
        	'reaction' => 'like',
        	],
        	[
        	'user_id' => '1',
        	'comment_id' => '2',
        	'reaction' => 'dislike',
        	],
        	[
        	'user_id' => '1',
        	'comment_id' => '3',
        	'reaction' => 'dislike',
        	],
        	[
        	'user_id' => '2',
        	'comment_id' => '2',
        	'reaction' => 'dislike',
        	],
        	[
        	'user_id' => '3',
        	'comment_id' => '2',
        	'reaction' => 'like',
        	],
        	[
        	'user_id' => '5',
        	'comment_id' => '1',
        	'reaction' => 'dislike',
        	],
        	[
        	'user_id' => '4',
        	'comment_id' => '1',
        	'reaction' => 'dislike',
        	],
        	[
        	'user_id' => '4',
        	'comment_id' => '2',
        	'reaction' => 'dislike',
        	],
        ]);

        //DB::table('comments_question_reactions')->truncate();
        DB::table('comments_question_reactions')->insert([
        	[
        	'user_id' => '1',
        	'comment_id' => '1',
        	'reaction' => 'dislike',
        	],
        	[
        	'user_id' => '1',
        	'comment_id' => '2',
        	'reaction' => 'like',
        	],
        	[
        	'user_id' => '1',
        	'comment_id' => '3',
        	'reaction' => 'dislike',
        	],
        	[
        	'user_id' => '2',
        	'comment_id' => '2',
        	'reaction' => 'dislike',
        	],
        	[
        	'user_id' => '3',
        	'comment_id' => '2',
        	'reaction' => 'like',
        	],
        	[
        	'user_id' => '5',
        	'comment_id' => '3',
        	'reaction' => 'dislike',
        	],
        	[
        	'user_id' => '4',
        	'comment_id' => '1',
        	'reaction' => 'like',
        	],
        	[
        	'user_id' => '4',
        	'comment_id' => '2',
        	'reaction' => 'like',
        	],

        ]);
    }
}
