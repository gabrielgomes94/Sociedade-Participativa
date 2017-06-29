<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Auth;
use Carbon\Carbon;
use Session;

use App\Question;
use App\Proposal;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;

class ProposalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        dd('eaea');
        $proposals = Proposal::all();
        return view('proposal.index')->with('proposals',$proposals);     
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
       	$proposal = Proposal::all(); 
        //$proposals = DB::table("proposals")->pluck("name","id");        
    	return view('proposal.create', compact('proposal'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        $proposal = Proposal::findOrFail($id);
        return view('proposal.edit')->with('proposal', $proposal);
    }

    public function show($id){
    	$proposals = Proposal::findOrFail($id);
    	return view('proposal.show')->with('proposals', $proposals);
    }

    /**
     *  TODO: revisar esse método
     * */
    public function store(Request $request)
    {        
    	$user = Auth::user();        
    	$datetime = Carbon::now();
    	$inputs = $request->all();    	    	

        $inputs = array(
            'content' => $request['content'],
            'author_id' => Auth::user()->id,
            'question_id' => $request['question_id'],
            'created_at' => $datetime,
            'updated_at' => null,
            'rating' => 0, 
            'type' => true,
            );
    	Proposal::create($inputs);    	

    	//return redirect()->route('question.show', $inputs['question_id']);
        return view('question.show');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update(SpecialtyFormRequest $request, $id)
    {
        $proposal = Proposal::findOrFail($id);
        $proposal->fill($request->all());
        $proposal->save();
        return redirect()->route('question.update', compact('question'));;
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy(Request $request){
        $proposal = Proposal::findOrFail($request->id);
        $proposal->delete();        
        Session::flash('message', 'Deletado com sucesso');
        return redirect('question');
    }

    public function search(Request $request){        
        $results = Proposal::search($request->search)->get();        
        return view('user.show_search_results')->with('results', $results);
    }

    /**
     *  GetRating retorna 
     * 
     * */
    public function getAverageReactions(Request $request){
        //$proposal = Proposal::find($request->id);                
        $rating = $this->updateAverageReactions($request);
        $rating = number_format($rating, 2);
        return Response::json($rating);
    }
    public function updateAverageReactions(Request $request){
        // $reactions_count = DB::table('proposal_reactions')->select('reaction')->where('proposal_id', $request->proposal_id)->count();
        // $reactions_sum = DB::table('proposal_reactions')->where('proposal_id', $request->proposal_id)->sum('reaction');
        // if($reactions_count!=0){
        //     $rating = $reactions_sum/$reactions_count;    
        // } else {
        //     $rating = 0;
        // }
        $rating = DB::table('proposal_reactions')->where('proposal_id', $request->proposal_id)->avg('reaction');
        DB::table('proposals')->where('id', $request->proposal_id)->update(['rating' => $rating]);
        return $rating;
    }
    public function getProposalRating($id){
        $rating = DB::table('proposal_reactions')->where('proposal_id', $id)->avg('reaction');
        $rating = number_format($rating, 2);
        return $rating;
    }


    /**
     *  Métodos relativos as reações
     * */
    public function insertReaction(Request $request){        
        $user = Auth::user();                
        DB::table('proposal_reactions')->insert(array(
            'user_id' => $user->id,
            'proposal_id' => $request->proposal_id,
            'reaction' => $request->rating
        ));
        //$rating = $this->updateRating($request);
        $rating = $this->getProposalRating($request->id);
        return Response::json($rating);
    }

    public function readReaction(Request $request){        
        $user_proposal_reaction = $this->getUserProposalReaction($request->proposal_id);        
        if($user_proposal_reaction == null){
            return Response::json(-1);
        } else {            
            return Response::json($user_proposal_reaction->reaction);
        }
    }
    
    public function updateReaction(Request $request){
        $user = Auth::user();
        DB::table('proposal_reactions')->where('proposal_id', $request->proposal_id)->where('user_id', $user->id)->update(['reaction' => $request->rating]);
        $rating = $this->updateAverageReactions($request);
        return Response::json($rating);   
    }

    public static function showProposalBox(Proposal $proposal){
        $proposal_controller = new ProposalController;
        $proposal->rating = $proposal_controller->getProposalRating($proposal->id);        
        $proposal->abstract = substr($proposal->content, 0, 350);            
        $proposal->created_at = Carbon::parse($proposal->created_at)->formatLocalized('%d %b %Y - %H:%I:%S');
        $user_proposal_reaction = $proposal_controller->getUserProposalReaction($proposal->id);
        if($user_proposal_reaction != null){
            $proposal->user_rate = $user_proposal_reaction->reaction;
        }
        return $proposal;
    }

    public function getUserProposalReaction($id){
        //dd($id);
        //dd(Auth::user()->id);
        $query = DB::table('proposal_reactions')->select('reaction')->where('proposal_id', $id)->where('user_id', Auth::user()->id)->get()->first();
        return $query;
    }
}
