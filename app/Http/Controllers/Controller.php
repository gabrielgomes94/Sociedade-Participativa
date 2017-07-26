<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use App\Question;
use App\Proposal;
use App\User;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public static function getVotesCount($id, $entity, $reaction_type){
        $table = $entity . '_reactions';
        $column = $entity . "_id";
        $votes = DB::table($table)->where($column, $id)->where('reaction', $reaction_type)->count();        
        return $votes;
    }

    public static function getVotesQuantityCount($id, $column, $table){
        $quantity_votes = DB::table($table)->where($column, $id)->count();
        return $quantity_votes;
    }



    public static function getVotesRate($id, $entity, $reaction_type){
        $table = $entity . '_reactions';
        $column = $entity . '_id';        
        $quantity_votes = self::getVotesQuantityCount($id, $column, $table);
        if($quantity_votes!=0){
            $votes = self::getVotesCount($id, $entity, $reaction_type);
            $rating = $votes/$quantity_votes; 
        } else {
            $rating = 0;
        }
        return 100*$rating;
    }
}
