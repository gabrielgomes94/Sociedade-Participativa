<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Comment extends Model
{
    protected $fillable = [
    	'user_id', 'commentable_id', 'commentable_type','content', 'created_at', 'type'
    ];
    protected $dateFormat = 'Y-m-d H:i:sO';
    public $table =  'comments';
    public $timestamps = false;

    public function author(){
    	return $this->belongsTo('App\User', 'user_id');
    }

    public function commentable(){
        return $this->morphTo();
    }
    public function reports(){
        return $this->morphMany('App\Report', 'reportable');
    }
}
