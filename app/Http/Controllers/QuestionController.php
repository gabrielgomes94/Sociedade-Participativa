<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
//duse Illuminate\Http\Response;
use Illuminate\Support\Facades\Route;
//use Illuminate\Database\Query\Builder;
use App\Question;
use App\Proposal;
use App\Category;
use App\QuestionReaction;

use GuzzleHttp\Client;// as GuzzleHttpQuestion;
use GuzzleHttp\Exception\GuzzleException;


use Auth;

use Carbon\Carbon;
//use DB;
use Session;

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;

class QuestionController extends Controller
{
    
    //
    //
    /**
     * Display a listing of the resource.
     *
     * @return Response
     */
    public function index()
    {
        $questions = Question::all();
        $categories = Category::all();
        foreach ($questions as $question) {
            $question = $this->showQuestionBox($question);                
        }        
        return view('question.index')->with('questions',$questions)->with('categories', $categories);     
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
       	$question = Question::all(); 

    	return view('question.create', compact('question'));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        $question = Question::findOrFail($id);        
        return view('question.edit')->with('question', $question);
    }

    public function show($id){    	        
        //$question = new Question();
        $client = new Client();
        // $apiRequest = $client->request('GET', 'http://colaboreapi-bpimenta.rhcloud.com/v1/questao', ['query' => ['id' => '1'], ]);
        // $content = json_decode($apiRequest->getBody()->getContents());
        // $req = 0;        
        // $question->id = $content[0]->id;
        // $question->title = $content[0]->title;
        // $question->content = $content[0]->content;
        // $question->post_date = $content[0]->post_date;
        // $question->post_modified_date = $content[0]->post_modified_date;
        // $question->author_id = $content[0]->author_id;
        // $question->city = $content[0]->city_id;
        // $question->status = $content[0]->status;
        // $question->deleted_at = $content[0]->deleted_at;
        $question = Question::findOrFail($id);


        $proposals = $question->proposals;  
        foreach ($proposals as $proposal) {                      
            $proposal = ProposalController::showProposalBox($proposal);
            foreach($proposal->comments as $comment){
                $comment = CommentController::showCommentBox($comment);    
            }            
        }          
        foreach($question->comments as $comment)             {
            $comment = CommentController::showCommentBox($comment);
        }        
        $proposals = $proposals->sortByDesc('rating');        
        $question->rate_upvotes = Controller::getVotesRate($question->id, 'question', true);
        $question->rate_downvotes = Controller::getVotesRate($question->id, 'question', false);
        $question->upvotes = Controller::getVotesCount($question->id, 'question', true);
        $question->downvotes = Controller::getVotesCount($question->id, 'question', false);
    	return view('question.show')->with('question', $question)->with('proposals', $proposals);
    }

    public function store(Request $request)
    {        
    	$user = Auth::user();        
    	$datetime = Carbon::now();
    	$inputs = array(
            'title' => $request['title'],
            'content' => $request['content'],
            'post_date' => $datetime,
            'post_modified_date' => '',
            'user' => $user->id,
            'status' => 0,
            'city_id' => $request['city'],
        );
    	Question::create($inputs);
    	return redirect()->route('user.profile', $user->id);
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  int  $id
     * @return Response
     */
    public function update(SpecialtyFormRequest $request, $id)
    {
        $question = Question::findOrFail($id);
        $question->fill($request->all());
        $question->save();
        return redirect()->route('question.update', compact('question'));
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id*
     * @return Response
     */
    public function destroy(Request $request)
    {        
        $question = Question::findOrFail($request->id);
        $question->delete();        
        //Session::flash('message', 'Deletado com sucesso');
        return redirect()->route('question.index');
    }
    public function search(Request $request){        
        $questions = null;
        $proposals = null;
        if($request->search_element=='question'){
            $questions = Question::search($request->search)->get();    
        }
        if($request->search_element=='proposal'){
            $proposals = Proposal::search($request->search)->get();     
        }        
        return view('question.search_results')->with('questions', $questions)->with('proposals', $proposals);
    }    
    
    public static function showQuestionBox(Question $question){
        $table = 'question_reactions';    
        $question->rate_upvotes = Controller::getVotesRate($question->id, 'question', true);        
        $question->rate_downvotes = Controller::getVotesRate($question->id, 'question', false);
        $question->upvotes = DB::table($table)->where('question_id', $question->id)->where('reaction', true)->count();        
        $question->downvotes = DB::table($table)->where('question_id', $question->id)->where('reaction', false)->count();
        $dt = Carbon::parse($question->post_date);
        $question->post_date = $dt->formatLocalized('%d %b %Y - %H:%I:%S');  
        return $question;
    }

    public function insertReaction(Request $request){
        $user = Auth::user();
        DB::table('question_reactions')->insert(array(
            'user_id' => $user->id,
            'question_id' => $request->question_id,
            'reaction' => $request->reaction
        ));
    }

    public function readReaction(Request $request){
        $user = Auth::user();
        dd('eae');
        $query = DB::table('question_reactions')->select('reaction')->where('question_id', $request->question_id)->where('user_id', $user->id)->get()->first();        
        if($query==null){
            return Response::json('-1');
        } else {            
            return Response::json($query->reaction);
        }
    }

    public function readReactionCounting(Request $request){
        $counting[0] = Controller::getVotesCount($request->question_id, 'question', false);
        $counting[1] = Controller::getVotesCount($request->question_id, 'question', true);
        $counting[2] = Controller::getVotesRate($request->question_id, 'question', true);
        $counting[3] = Controller::getVotesRate($request->question_id, 'question', false);        
        return $counting;
    }

    public function updateReaction(Request $request){
        $user = Auth::user();
        DB::table('question_reactions')->where('question_id', $request->question_id)->where('user_id', $user->id)->update(['reaction' => $request->reaction]);
        return Response::json();   
    }

    public function sortQuestions(Request $request){        
        $questions = Question::all();
        $categories = Category::all();        
        /**
         *  Filtragem das categorias
         * */
        $query = $categories->whereIn('id', $request->category);        

        /**
         *  Filtragem da localização - Bairro, Cidade, Estado e País
         * */
        $questions = $questions->where('country', $request->country);
        $questions = $questions->where('state', $request->state);
        $questions = $questions->where('city',$request->city);        
        //$questions = $questions->where('where',$request->city);        
        //$questions = $questions->get(['district'=>$request->district]);
        /**
         *  Ordenação das Questões
         * */
        switch ($request->sort_option) {
            case 'date':
                $questions = $questions->sortBy('post_date');                
                break;
            case 'vote':
                foreach($questions as $question){

                    //$question->votes = 
                }
                break;
            case 'comments-number':

                break;
            //2-1-3
            default:
                # code...
                break;
        }
        return view('question.index')->with('questions',$questions)->with('categories', $categories);     


    }

}
