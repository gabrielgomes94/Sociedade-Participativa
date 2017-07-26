<?php

namespace App\Http\Controllers\Comment;

use Illuminate\Http\Request;
use Auth;
use Carbon\Carbon;
use Session;


use App\Question;
use App\Proposal;
use App\Comment;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Response;

use App\Http\Controllers\Controller;
class CommentController extends Controller
{

	public function index(){

	}

	public function create(Request $request){        
        $this->store($request);
	}

	public function store(Request $request){                
        $question_controller = new QuestionController();
        $datetime = Carbon::now();
        $inputs = array(
            'user_id' => Auth::user()->id,
            'commentable_id' => $request['commentable_id'],
            'commentable_type' => $request['commentable_type'],
            'content' => $request['content'],
            'post_date' => $datetime,
            'post_modified_date' => $datetime,
            );
        Comment::create($inputs);
        if($request['commentable_type']=='question'){
            $question_id = $request['commentable_id'];        
        } else {
            $proposal = Proposal::findOrFail($request['commentable_id']);
            $question_id = $proposal->question->id;            
        }
        return $question_controller->show($question_id);
    }

	public function edit($id){
        $comment = Comment::findOrFail($id);        
        return view('comment.edit')->with('comment', $comment);
	}
    /**
     *  TODO ClassRequest para validar entrada
     * */
	public function update(Request $request){
        $comment = Comment::findOrFail($request->id);
        $comment->fill($request->all());
        $comment->save();
        return view('comment.update')->with('comment', $comment);
	}

	public function destroy(Request $request){
        $comment = Comment::findOrFail($request->id);
        $comment->delete();        
        Session::flash('message', 'Deletado com sucesso');
        return redirect('question');
	}

	public function insertReaction(Request $request){
		$user = Auth::user();
		DB::table('comment_reactions')->insert(array(
			'user_id' => $user->id,
			'comment_id' => $request->comment_id,
            'reaction' => $request->reaction
		));

	}

	public function readReaction(Request $request){
        dd('d');
		$user = Auth::user();
        $query = DB::table('comment_reactions')->select('reaction')->where('comment_id', $request->comment_id)->where('user_id', $user->id)->get()->first();        
        if($query==null){
            return Response::json('-1');
        } else {            
            return Response::json($query->reaction);
        }
	}

	public function updateReaction(Request $request){
		$user = Auth::user();
        DB::table('comment_reactions')->where('comment_id', $request->comment_id)->where('user_id', $user->id)->update(['reaction' => $request->reaction]);
        return Response::json();   
	}

	public static function showCommentBox(Comment $comment){
		$table = 'comment_reactions';        
        $comment->rate_upvotes = Controller::getVotesRate($comment->id, 'comment', true);        
        $comment->rate_downvotes = Controller::getVotesRate($comment->id, 'comment', false);        
        $comment->upvotes = Controller::getVotesCount($comment->id, 'comment', true);
        $comment->downvotes = Controller::getVotesCount($comment->id, 'comment', false);
        $comment->abstract = substr($comment->content, 0, 350);        
        $comment->post_date = Carbon::parse($comment->post_date)->formatLocalized('%d %b %Y - %H:%I:%S');
        $commentable = $comment->commentable;        
        if(get_class($commentable)=="App\Proposal"){
        	$comment->link_title = $commentable->question->title;	
        	$comment->link_id = $commentable->question->id;   
        } else if(get_class($commentable)=="App\Question"){
        	$comment->link_title = $commentable->title;
        	$comment->link_id = $commentable->id;           
        }
        return $comment;
    }

    public function readReactionCounting(Request $request){
        $counting[0] = Controller::getVotesCount($request->comment_id, 'comment', false);
        $counting[1] = Controller::getVotesCount($request->comment_id, 'comment', true);
        $counting[2] = Controller::getVotesRate($request->comment_id, 'comment', true);
        $counting[3] = Controller::getVotesRate($request->comment_id, 'comment', false);
        return $counting;
    }

    public function report(Request $request){

    }

    public function showCommentContent(Request $request){
        $comment = Comment::findOrFail($request->id);
        return $comment->content;

    }
}