<?php

namespace App\Http\Controllers\Question;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class QuestionReactionController extends Controller
{
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request, $question_id)
    {
        $question = Question::findOrFail($question_id);
        $user = Auth::user();
        DB::table('question_reactions')->insert(array(
            'user_id' => $user->id,
            'question_id' => $question->id,
            'reaction' => $request->reaction
        ));
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($question_id)
    {
        $question = Question::findOrFail($question_id);
        $user = Auth::user();
        $query = DB::table('question_reactions')->select('reaction')->where('question_id', $question->id)->where('user_id', $user->id)->get()->first();        
        if($query==null){
            return Response::json('-1');
        } else {            
            return Response::json($query->reaction);
        }
    }    

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $question_id)
    {
        $question = Question::findOrFail($question_id);
        $user = Auth::user();
        DB::table('question_reactions')->where('question_id', $question->id)->where('user_id', $user->id)->update(['reaction' => $request->reaction]);
        return Response::json();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($question_id)
    {
        $user = Auth::user();
        $question = Question::findOrFail($question_id);
        DB::table('question_reactions')->delete()->where('question_id', $question->id)->where('user_id', $user->id)->update(['reaction' => $request->reaction]);
    }

    public function getReactionCounting(Request $request){
        $counting[0] = Controller::getVotesCount($request->question_id, 'question', false);
        $counting[1] = Controller::getVotesCount($request->question_id, 'question', true);
        $counting[2] = Controller::getVotesRate($request->question_id, 'question', true);
        $counting[3] = Controller::getVotesRate($request->question_id, 'question', false);        
        return $counting;
    }
}
