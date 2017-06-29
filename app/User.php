<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

use Laravel\Scout\Searchable;

class User extends Authenticatable
{
    use Notifiable;
    use Searchable;
    /**
     * The attributes that are mass assignable.
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'gender', 'city', 'state', 'country', 'type', 
    ];

    /**
     * The primary key for the model.
     * @var  string     
     */    
    protected $primaryKey = 'id';    

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function city(){
        //return $this->belongsTo('App\City');
    }

    public function questions(){
        return $this->hasMany('App\Question', 'questions');
    }

    public function question_votes(){
        return $this->belongsToMany('App\Question', 'question_reactions');
    }

    public function moderator_question(){
        return $this->belongsToMany('App\Question', 'moderator_questions');
    }

    public function specialties(){        
        return $this->belongsToMany('App\Specialty', 'specialty_user');
    }

    public function comments(){
        return $this->hasMany('App\Comment');    
    }

    public function proposals(){
        return $this->hasMany('App\Proposal');
    }


    /**
     *  Get the index name for the model. 
     * 
     *  @return string    
     */
    public function searchableAs(){
        return 'users_index';
    }
}
