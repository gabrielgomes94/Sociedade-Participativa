<?php

use Illuminate\Database\Seeder;

class SpecialtyTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //DB::table('specialties')->truncate();
    	DB::table('specialties')->insert([[
        	'name' => 'Engenharia',
        	'description' => 'Engenharia, blablabla'
        	], 
        	[
        	'name' => 'Medicina',
        	'description' => 'Medicina'
        	], 
        	[
        	'name' => 'Transporte',
        	'description' => 'sdhsuhdasdiasodnasd'       	
        	], 
        	[
        	'name' => 'Programação de computadores',
        	
        	'description' => 'Programação' 	
        	], 
        	[
        	'name' => 'Direito',
        	
        	'description' => 'Quesjfmkopsdkc'
        	]
        ]);
    }
}
