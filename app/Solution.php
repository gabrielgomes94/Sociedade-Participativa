<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Solution extends Model
{
	protected $fillable = [
        'question_id', 'content', 'user_id', 
    ];

    public function question(){
        return $this->belongsTo('App\Question');
    }
}
