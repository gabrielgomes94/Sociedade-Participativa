<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Laravel\Scout\Searchable;

class Question extends Model
{
    use Searchable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'title', 'content', 'created_at', 'user_id', 'status', 'user_id'
    ];

    //public $timestamps = false;
    protected $dateFormat = 'Y-m-d H:i:sO';

    
    public function author(){
    	return $this->belongsTo('App\User', 'user_id');
    }
    public function categories(){
        return $this->belongsToMany('App\Category', 'category_questions');
    }
    public function comments(){
        return $this->morphMany('App\Comment', 'commentable');
    }
    public function moderators(){
        return $this->belongsToMany('App\Moderator', 'moderator_questions');
    }
    public function proposals(){
        return $this->hasMany('App\Proposal');
    }
    public function reports(){
        return $this->morphMany('App\Report', 'reportable');
    }
    public function searchableAs(){
        return 'question_index';
    }
    public function solution(){
        return $this->hasOne('App\Solution');
    }
}
