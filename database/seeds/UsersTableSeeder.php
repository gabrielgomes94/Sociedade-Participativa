<?php

use Illuminate\Database\Seeder;
use Illuminate\Database\Eloquent\Model;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //DB::table('users')->truncate();
        DB::table('users')->insert(array([            
        	'name' => 'Gabriel',
        	'lastname' => 'Gomes da Silva',
        	'email' => 'gabrielgomesch@gmail.com',
        	'password' => bcrypt('123456'),
            'gender' => 'male',
            'birthday' =>'1994-12-08',
            'street' => 'Rua Santa Isabel',
            'street_number' => '220',            
            'zipcode' => '23212223',
            'district' => 'Parque Urupês',             
            'city'=>'Varginha', 
            'state' => 'Minas Gerais', 
            'country' => 'Brasil',
            'type' => 'admin', 
            'show_email' => 'true',
            'show_birthday' => 'true',
            'show_age' => 'true',
            'show_district' => 'true',
            'show_city' => 'true',
            'show_state' => 'true',
            'show_country' => 'true',
            'show_score' => 'true',
            'show_level' => 'true'
            ], 
            [
            
            'name' => 'Talita',
            'lastname' => 'Goulart',
            'email' => 'talita@email.com',
            'password' => bcrypt('123456'),                       
            'gender' => 'female',
            'birthday' =>'1994-12-08',
            'street' => 'Rua Dr João de Azevedo',
            'street_number' => '386',            
            'zipcode' => '23212223',
            'district' => 'Centro',             
            'city'=>'Itajubá', 
            'state' => 'Minas Gerais', 
            'country' => 'Brasil',
            'type' => 'common', 
            'show_email' => 'true',
            'show_birthday' => 'true',
            'show_age' => 'true',
            'show_district' => 'true',
            'show_city' => 'true',
            'show_state' => 'true',
            'show_country' => 'true',
            'show_score' => 'true',
            'show_level' => 'true'
            ],            
            [
            
            'name' => 'Maria',
            'lastname' => 'José',
            'email' => 'maria@gmail.com',
            'password' => bcrypt('123456'),    
            'gender' => 'female',
            'birthday' =>'1994-12-08',
            'street' => 'Rua Interdum et malesuada fames',
            'street_number' => '223',
            'district' => 'Jardim do Crepúsculo',
            'zipcode' => '23212223',            
            'city'=>'Itajubá', 
            'state' => 'Minas Gerais', 
            'country' => 'Brasil',
            'type' => 'common', 
            'show_email' => 'true',
            'show_birthday' => 'true',
            'show_age' => 'true',
            'show_district' => 'true',
            'show_city' => 'true',
            'show_state' => 'true',
            'show_country' => 'true',
            'show_score' => 'true',
            'show_level' => 'true'
            ],
            [
            
            'name' => 'João',
            'lastname' => 'Dias',
            'email' => 'jd@gmail.com',
            'password' => bcrypt('123456'),    
            'gender' => 'male',
            'birthday' =>'1994-12-08',
            'street' => 'Rua Interdum et malesuada fames',
            'street_number' => '223',
            'district' => 'Jardim do Crepúsculo',
            'zipcode' => '23212223',            
            'city'=>'Itajubá', 
            'state' => 'Minas Gerais', 
            'country' => 'Brasil',
            'type' => 'common', 
            'show_email' => 'true',
            'show_birthday' => 'true',
            'show_age' => 'true',
            'show_district' => 'true',
            'show_city' => 'true',
            'show_state' => 'true',
            'show_country' => 'true',
            'show_score' => 'true',
            'show_level' => 'true'
            ],
            [
            
            'name' => 'Angela',
            'lastname' => 'José',
            'email' => 'angj@gmail.com',
            'password' => bcrypt('123456'),    
            'gender' => 'female',
            'birthday' =>'1994-12-08',
            'street' => 'Rua Interdum et malesuada fames',
            'street_number' => '223',
            'district' => 'Jardim do Crepúsculo',
            'zipcode' => '23212223',            
            'city'=>'Itajubá', 
            'state' => 'Minas Gerais', 
            'country' => 'Brasil',
            'type' => 'common', 
            'show_email' => 'true',
            'show_birthday' => 'true',
            'show_age' => 'true',
            'show_district' => 'true',
            'show_city' => 'true',
            'show_state' => 'true',
            'show_country' => 'true',
            'show_score' => 'true',
            'show_level' => 'true'
            ]
            ));
    }
}
