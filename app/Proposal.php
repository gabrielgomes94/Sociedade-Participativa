<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Laravel\Scout\Searchable;
class Proposal extends Model
{
    use Searchable;
    protected $fillable = [
        'content', 'created_at', 'user_id', 'question_id', 
    ];
    protected $dateFormat = 'Y-m-d H:i:sO';
    public $timestamps = false;
    //;/;protected $dateFormat = 'Y-m-d H:i:s.u';

    public function author(){
    	return $this->belongsTo('App\User', 'user_id');
    }

    public function comments(){
        return $this->morphMany('App\Comment', 'commentable');
    }
    public function reports(){
        return $this->morphMany('App\Report', 'reportable');
    }
    public function question(){
        return $this->belongsTo('App\Question');
    }
}