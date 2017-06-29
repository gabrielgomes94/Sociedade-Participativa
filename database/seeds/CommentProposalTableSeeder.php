<?php

use Illuminate\Database\Seeder;

class CommentProposalTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //DB::table('comments_proposal')->truncate();
        DB::table('comments_proposal')->insert(array(

            array('content' => 'Vestibulum a sem vel massa porta pharetra. Quisque efficitur erat quis ultricies mollis. Suspendisse vel viverra ligula. Quisque scelerisque commodo turpis, ut congue arcu consectetur quis. Aliquam ultrices enim id mi ultrices condimentum. Pellentesque rutrum lorem iaculis, sagittis metus eu, finibus sapien. Pellentesque convallis id magna a consequat. Quisque pretium at lacus et ullamcorper. Vestibulum sit amet sapien id purus mollis pellentesque. Morbi viverra libero non dapibus sodales. Proin rhoncus, metus interdum rutrum fermentum, erat ligula scelerisque ligula, quis accumsan mi erat at mi. ', 
				'author_id' => '2',
				'proposal_id' => '1',
                'post_date'=>'2017-03-26 02:40:01.000000',
                'post_modified_date'=>'2017-03-27 02:40:01.000000'),

            array('content' => ' Ut vehicula vulputate sem, at facilisis neque porta eget. Etiam maximus dolor non elit bibendum semper. Curabitur vitae tincidunt justo, quis lobortis dui. Sed varius, libero ut pellentesque rhoncus, metus est sollicitudin enim, in iaculis sapien ligula ultrices risus. Duis non bibendum ipsum. Vivamus blandit augue massa, id rutrum augue tempor eu. Aliquam viverra euismod sem vel auctor. ', 
                'author_id' => '1', 
                'proposal_id' => '1',
                'post_date'=>'2017-03-26 02:40:01.000000',
                'post_modified_date'=> null),
            ['content' => '  Nullam sed urna vitae arcu dictum placerat a vestibulum metus. Maecenas sit amet porttitor ante. Sed a ex sapien. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla vel viverra est. Sed pellentesque nulla et mauris laoreet, nec porta ligula suscipit. Morbi eu viverra lectus. Donec vestibulum urna sed aliquam tincidunt. Quisque facilisis tincidunt velit, eu varius ex venenatis ac. Vivamus iaculis metus quam, a egestas est sollicitudin at.  ', 
                'author_id' => '3', 
                'proposal_id' => '2',
                'post_date'=>'2017-04-26 02:40:01.000000',
                'post_modified_date'=> null],
            ['content' => '   Aliquam erat volutpat. Quisque in tortor accumsan elit lobortis consectetur eu sed orci. Aliquam ultricies rutrum risus, et varius nisi ornare ac. Etiam maximus at arcu vel laoreet. Cras tincidunt, purus et bibendum feugiat, ex risus luctus magna, quis viverra orci lacus vel dolor. Duis ut congue enim. Phasellus in mauris risus. Maecenas nec nisi tellus.   ', 
                'author_id' => '5', 
                'proposal_id' => '2',
                'post_date'=>'2017-04-26 02:46:01.000000',
                'post_modified_date'=> null],
            ['content' => '    Maecenas nisl quam, accumsan nec diam at, ultrices dignissim ex. Mauris tristique tortor nec egestas tempor. Proin vitae imperdiet justo, et sodales sem. Fusce sagittis pretium rhoncus. Donec eu leo dapibus, suscipit nisl a, ultrices lacus. Vivamus auctor nisl ac volutpat varius. In velit orci, maximus rutrum sem nec, fringilla interdum magna. Etiam vel interdum sem, a vehicula dui. In a est semper, elementum metus et, tempor turpis. ', 
                'author_id' => '4', 
                'proposal_id' => '3',
                'post_date'=>'2017-04-26 02:52:01.000000',
                'post_modified_date'=> null]

			
        ));
    }
}
