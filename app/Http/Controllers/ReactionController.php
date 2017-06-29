<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class ReactionController extends Controller
{
    public function get_question_reactions($question_id)
    {
        //$questions = Question::all();
        $upvotes = 10;
        $downvotes = 10;
        return view('question.index')->with('upvotes',$upvotes)->with('downvotes', $downvotes);     
    }
}
