<?php

namespace App\Http\Controllers;

use App\CommentProposal;
use App\CommentQuestion;
use App\Comment;
use App\Proposal;
use App\Question;
use App\Specialty;
use App\SpecialtyUser;
use App\User;
use App\UserSpecialty;
use App\Http\Controllers\QuestionController;
use App\Http\Controllers\ProposalController;
use App\Http\Controllers\CommentProposalController;
use App\Http\Controllers\CommentQuestionController;
use App\Http\Controllers\CommentController;
use Auth;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Redirect;
use Validator;
use View;
//use App\Http\Requests\SpecialtyFormRequest;


class UserController extends Controller
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
        
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return Response
     */
    public function create()
    {
       
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return Response
     */
    public function edit($id)
    {
        $user = User::find($id);
        $specs = Specialty::all();
        return view('user.edit_profile')->with('specs', $specs)->with('user', $user);
    }

    public function show($id){     
        $user = User::find($id);
        $specialties = $user->specialties;                
        $questions = Question::where('user_id', $user->id)->get();
        $proposals = Proposal::where('user_id', $user->id)->get();        
        $comments = Comment::where('user_id', $user->id)->get();
        
        setlocale(LC_TIME, '');
        $dt = Carbon::parse($user->birthday);
        $user->birthday = $dt->formatLocalized('%d de %B de %Y');
        $user->age = $dt->diffInYears();

        /**
         *  Question
         *  Este bloco formata a data da questão e suas reações
         * */
        foreach($questions as $question){
            $question = QuestionController::showQuestionBox($question);                
        }

        /**
         * Proposal
         * Este bloco formata a data da proposta e suas reações         
         * */        
        foreach($proposals as $proposal){
            $proposal = ProposalController::showProposalBox($proposal);       
            dd($proposal->author);
        }

        /**
         * Comments
         * Este bloco formata os atributos dos comentários
         * */
        foreach($comments as $comment){
            $comment = CommentController::showCommentBox($comment);
            
        }

        return view('user.show_profile')->with('user', $user)->with('specialties', $specialties)->with('questions', $questions)->with('proposals', $proposals)->with('comments_proposal')->with('comments_question')->with('comments', $comments);
    }

    public function store(Request $request)
    {        

    }

    public function update_contact_info(Request $request, $id)
    {
        //$user = Auth::user();
        $user = User::find($id);
        if($request['password']){
            $user->password = bcrypt($request['password']);
        }        
        $user->email = $request['email'];
        $user->save();
        return redirect()->route('user.profile', $user->id);
    }

    public function update_profile_info(Request $request, $id)
    {
        //$user = Auth::user();
        $user = User::find($id);
        $user->fill($request->all());
        $user->save();
        return redirect()->route('user.profile', $user->id);
    }
    public function update_privacy_info(Request $request, $id)
    {

    }
    public function add_specialty_info(Request $request, $id)
    {
        $user = User::find($id);
        $inputs = $request->except('_token');
        foreach($inputs as $key => $specs){
            $spec_user = new SpecialtyUser;
            $spec_user->user_id = $user->id;
            $spec_user->specialty_id = $specs;
                $spec_user->save();            
        }
        return redirect()->route('user.profile', $user->id);
    }

    public function remove_specialty_info(Request $request, $id)
    {
        $user = User::find($id);
        $inputs = $request->except('_token');
        foreach($inputs as $key => $specs){            
            $spec_user = new SpecialtyUser;
            $spec_user = SpecialtyUser::where('user_id', $user->id)->where('specialty_id', $specs);        
            $spec_user->delete();
        }
        return redirect()->route('user.profile', $user->id);
    }

    public function search(Request $request){        
        $results = User::search($request->search)->get();        
        return view('user.show_search_results')->with('user_results', $results);
    }
}
