<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use DB;
use App\City;
use App\Country;
use App\State;
class LocationController extends Controller
{
	public function index()
    {
        //$countries = DB::table("countries")->pluck("name","id");
        $countries = Country::all();
        return view('index',compact('countries'));
    }
    public function getStateList(Request $request)
    {

    	$states = State::all()->pluck("name", "id");//->where("country_id", $request->country_id)->pluck("id", "name");
    	//var_dump($states);
        // $states = DB::table("states")
        //             ->where("country_id",$request->country_id)
        //             ->pluck("name","id");
        return response()->json($states);
    }

    public function getCityList(Request $request)
    {
    	$cities = City::all()->where('state_id', $request->state_id)->pluck("name", "id");
        // $cities = DB::table("cities")
        //             ->where("state_id",$request->state_id)
        //             ->pluck("name","id");
        return response()->json($cities);
    }
}
