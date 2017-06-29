<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $this->call(UsersTableSeeder::class);
        $this->call(SpecialtyTableSeeder::class);
        $this->call(CategoriesTableSeeder::class);        
        $this->call(QuestionTableSeeder::class);
        $this->call(ProposalsTableSeeder::class);
        $this->call(CommentQuestionTableSeeder::class);     
        $this->call(CommentProposalTableSeeder::class);
        $this->call(UsersReactionsSeeder::class);
        $this->call(ModeratorQuestionTableSeeder::class);                               
        $this->call(SpecialtyUsersTableSeeder::class);
        
        

    }
}
