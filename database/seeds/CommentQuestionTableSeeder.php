<?php

use Illuminate\Database\Seeder;

class CommentQuestionTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //DB::table('comments_question')->truncate();
    	DB::table('comments_question')->insert([
            ['content' => 'Vivamus orci orci, congue sed egestas et, vestibulum ac magna. Curabitur dapibus vehicula mauris, a pulvinar orci placerat vel. Pellentesque sem enim, egestas vel ligula a, fringilla ullamcorper nisl. Curabitur scelerisque, magna id dapibus dapibus, turpis risus interdum elit, nec placerat nibh sapien quis dui. Aliquam id felis fermentum, tincidunt quam at, placerat eros. In nulla nisi, sollicitudin eu dapibus nec, molestie sed enim. Vivamus aliquam, velit id sollicitudin commodo, risus leo pretium mauris, quis euismod quam ante sit amet lacus. Etiam vel faucibus eros. Etiam suscipit pretium lectus, sollicitudin accumsan sapien porttitor ut. Aliquam tristique, purus ut bibendum gravida, ipsum ipsum convallis dolor, in auctor arcu justo in purus. Sed finibus, elit nec tempor imperdiet, lacus dolor consectetur justo, ac suscipit risus elit nec arcu. Donec ac elementum mauris. Aliquam consectetur dictum quam, a aliquam lectus suscipit et. Nam et tincidunt eros. In hac habitasse platea dictumst. ', 
				'author_id' => '2',
				'question_id' => '1',
                'post_date'=>'2017-03-22 23:11:01.000000',
            ],
            ['content' => ' Fusce ac eros quam. Maecenas bibendum, nunc in consequat bibendum, nibh justo euismod enim, nec pellentesque dolor ipsum id lacus. Sed eleifend est erat, nec ornare tellus interdum ac. Nulla aliquet elit risus, vitae tincidunt leo imperdiet vitae. Nam commodo consequat suscipit. Suspendisse finibus libero quis felis sagittis molestie. Integer justo quam, tincidunt sit amet malesuada eget, tincidunt et orci. Integer at ligula vel eros luctus aliquam. In urna dui, luctus quis leo vitae, tincidunt varius elit. Suspendisse euismod elit vitae orci tincidunt elementum. Cras ut neque sit amet urna aliquam suscipit. Nunc sit amet imperdiet ante, in placerat tortor. Nullam feugiat dolor non viverra pellentesque. ', 
                'author_id' => '3',
                'question_id' => '1',
                'post_date'=>'2017-03-22 03:12:21.000000',
            ], 
            ['content' => ' F Integer eget elit id eros pellentesque luctus. Sed ut lectus id nisi varius vulputate. Cras iaculis tellus id lacus dignissim, non congue sem pulvinar. Vestibulum auctor risus lacus, nec vulputate leo rutrum a. Aenean et quam accumsan, imperdiet lacus ut, sollicitudin dolor. Ut dolor turpis, suscipit quis diam at, maximus aliquet velit. Morbi ut interdum massa, eu viverra urna. Aliquam condimentum, nulla at hendrerit hendrerit, felis augue auctor augue, eu vestibulum dui metus a mi. ', 
                'author_id' => '1',
                'question_id' => '1',
                'post_date'=>'2017-03-22 03:12:21.000000',
            ],
            ['content' => ' F Integer eget elit id eros pellentesque luctus. Sed ut lectus id nisi varius vulputate. Cras iaculis tellus id lacus dignissim, non congue sem pulvinar. Vestibulum auctor risus lacus, nec vulputate leo rutrum a. Aenean et quam accumsan, imperdiet lacus ut, sollicitudin dolor. Ut dolor turpis, suscipit quis diam at, maximus aliquet velit. Morbi ut interdum massa, eu viverra urna. Aliquam condimentum, nulla at hendrerit hendrerit, felis augue auctor augue, eu vestibulum dui metus a mi. ', 
                'author_id' => '1',
                'question_id' => '2',
                'post_date'=>'2017-03-22 03:16:21.000000'
            ]
        ]);
        
    }
}
