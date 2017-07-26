<?php

namespace App\Http\Controllers\User;

use App\Citizen;
use App\Comment;
use App\Http\Controllers\Comment\CommentController;
use App\Http\Controllers\Controller;
use App\Http\Controllers\Proposal\ProposalController;
use App\Http\Controllers\Question\QuestionController;
use App\Proposal;
use App\Question;
use Carbon\Carbon;
use Illuminate\Http\Request;

class CitizenController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public static function show($citizen)
    {
        $specialties = $citizen->specialties;                
        $questions = Question::where('user_id', $citizen->id)->get();
        $proposals = Proposal::where('user_id', $citizen->id)->get();        
        $comments = Comment::where('user_id', $citizen->id)->get();
        
        setlocale(LC_TIME, '');
        $dt = Carbon::parse($citizen->birthday);
        $citizen->birthday = $dt->formatLocalized('%d de %B de %Y');
        $citizen->age = $dt->diffInYears();

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
            $proposal = ProposalController::show($proposal);                  
        }

        /**
         * Comments
         * Este bloco formata os atributos dos comentários
         * */
        foreach($comments as $comment){
            $comment = CommentController::showCommentBox($comment);
            
        }

        return view('user.profile.citizen')->with('user', $citizen)->with('specialties', $specialties)->with('questions', $questions)->with('proposals', $proposals)->with('comments_proposal')->with('comments_question')->with('comments', $comments);
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
