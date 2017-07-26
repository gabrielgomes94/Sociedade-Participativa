<?php

namespace App\Http\Controllers\Proposal;

use App\Http\Controllers\Controller;
use Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProposalReactionController extends Controller
{

	public function show($id)
	{
		$user_proposal_reaction = $this->getUserProposalReaction($request->proposal_id);        
        if($user_proposal_reaction == null){
            return Response::json(-1);
        } else {            
            return Response::json($user_proposal_reaction->reaction);
        }
	}

	public function store(Request $request)
	{
		$user = Auth::user();                
        DB::table('proposal_reactions')->insert(array(
            'user_id' => $user->id,
            'proposal_id' => $request->proposal_id,
            'reaction' => $request->rating
        ));
        //$rating = $this->updateRating($request);
        $rating = $this->getAVGReaction($request->id);
        return Response::json($rating);
	}

	public function update($id)
	{
		$user = Auth::user();
        DB::table('proposal_reactions')->where('proposal_id', $request->proposal_id)->where('user_id', $user->id)->update(['reaction' => $request->rating]);
        $rating = $this->updateAverageReactions($request);
        return Response::json($rating);   
	}

	/** 
	 * 	Average Reaction
	 * 
	 */

	public function showAVGReaction(Request $request)
	{
		//$proposal = Proposal::find($request->id);                
        $rating = $this->updateAverageReactions($request);
        $rating = number_format($rating, 2);
        return Response::json($rating);
	}

	public function updateAVGReaction(Request $request)
	{
		$rating = DB::table('proposal_reactions')->where('proposal_id', $request->proposal_id)->avg('reaction');
        DB::table('proposals')->where('id', $request->proposal_id)->update(['rating' => $rating]);
        return $rating;
	}        

    public static function getAVGReaction($id)
    {
    	$rating = DB::table('proposal_reactions')->where('proposal_id', $id)->avg('reaction');
        $rating = number_format($rating, 2);
        return $rating;
    }

    public static function getUserReaction($id){
        $query = DB::table('proposal_reactions')->select('reaction')->where('proposal_id', $id)->where('user_id', Auth::user()->id)->get()->first();
        return $query;
    }
}
