<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Specialty extends Model
{
   	/**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'description',
    ];

    public $timestamps = false;

	public function users(){
        return $this->belongsToMany('App\User', 'specialty_user');
    }
}
