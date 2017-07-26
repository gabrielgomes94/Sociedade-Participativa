<?php

namespace App\Http\Controllers\Proposal;

use App\Http\Controllers\Controller;
use App\Http\Controllers\Proposal\ProposalReactionController;
use App\Proposal;
use App\Question;
use Auth;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;
use Session;

class ProposalController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {   $proposals = Proposal::all();
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

    public static function show(Proposal $proposal){
        $reaction = new ProposalReactionController;

    	//$proposal->rating = $reaction::getAVGReaction($proposal->id);        
        $proposal->abstract = substr($proposal->content, 0, 350);            
        $proposal->created_at = Carbon::parse($proposal->created_at)->formatLocalized('%d %b %Y - %H:%I:%S');
        // $user_proposal_reaction = $reaction::getUserReaction($proposal->id);

        // if($user_proposal_reaction != null){
        //     $proposal->user_rate = $user_proposal_reaction->reaction;
        // }
        return $proposal;
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
            'user_id' => Auth::user()->id,
            'question_id' => $request['question_id'],
            'created_at' => $datetime,
            'updated_at' => null,
            'rating' => 0
            );
    	Proposal::create($inputs);    	

        //return view('question.show');
        return redirect()->route('question.show', $request['question_id']);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update(Request $request, $id)
    {
        $datetime = Carbon::now();
        $proposal = Proposal::findOrFail($id);
        $proposal->fill($request->all());
        $proposal->updated_at = $datetime;
        $proposal->save();
        return redirect()->route('question.show', $request['question_id']);
        
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function destroy(Request $request){
        $proposal = Proposal::findOrFail($request->proposal_id);
        $id = $proposal->question_id;
        $proposal->delete();        
        Session::flash('message', 'Deletado com sucesso');
        //return redirect()->route('question.show', $request['question_id']);
        //return redirect()->action('QuestionController@show', ['id' => $request['question_id']]);
        $questionController = new QuestionController;
        return $questionController->show($id);
    }

    public function search(Request $request){        
        $results = Proposal::search($request->search)->get();        
        return view('user.show_search_results')->with('results', $results);
    }

    public static function showProposalBox(Proposal $proposal){        
        $proposal->rating = $this->getProposalRating($proposal->id);        
        $proposal->abstract = substr($proposal->content, 0, 350);            
        $proposal->created_at = Carbon::parse($proposal->created_at)->formatLocalized('%d %b %Y - %H:%I:%S');
        $user_proposal_reaction = $this->getUserProposalReaction($proposal->id);
        if($user_proposal_reaction != null){
            $proposal->user_rate = $user_proposal_reaction->reaction;
        }
        return $proposal;
    }

}
