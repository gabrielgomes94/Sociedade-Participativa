<?php

use Illuminate\Database\Seeder;

class CategoriesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //DB::table('categories')->all()->delete();
    	//DB::table('categories')->truncate();
        DB::table('categories')->insert([
        	'name' => 'Mobilidade Urbana',
        	'description' => 'Temas relativos a trânsito, transportes e mobilidade',        	
        	], 
            [
        	'name' => 'Habitação',
        	'description' => 'Casas, loteamento, bairros residenciais',        	
        	], 
        	[
        	'name' => 'Educação',
        	'description' => 'Escolas, universidades',        	
        	], 
        	[
        	'name' => 'Saúde',
        	'description' => 'Postos de saúde, clínicas e hospitais',        	
        	], 
        	[
        	'name' => 'Segurança',
        	'description' => 'Policiamento',        	
        	]
            );
        
    }
}
