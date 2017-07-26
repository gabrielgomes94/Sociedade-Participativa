<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Moderator extends User
{
    public function questions(){
        return $this->belongsToMany('App\Question', 'moderator_questions');
    }
}
