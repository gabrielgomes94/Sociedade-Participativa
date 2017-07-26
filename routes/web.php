<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/
Route::get('/', function () {
    return view('welcome');
});
Auth::routes();

Route::get('/home', function(){
		return view('home');
});

Route::prefix('questao')->group(function(){
	Route::namespace('Question')->group(function(){
		Route::get('/', 'QuestionController@index')
			->name('question.index');

		Route::post('/', 'QuestionController@store')
			->name('question.store');

		Route::get('/criar', 'QuestionController@create')
			->name('question.create');

		Route::get('/{question_id}', 'QuestionController@show')
			->name('question.show');

		Route::get('/{question_id/editar', 'QuestionController@edit')
			->name('question.edit');

		Route::put('/{question_id}/atualizar', 'QuestionController@update')
			->name('question.update');

		Route::delete('{question_id}/deletar', 'QuestionController@destroy')
			->name('question.delete');

		Route::get('/buscar', 'QuestionController@search')
			->name('question.search');
		/**
		 * 	Reactions
		 * */
		Route::post('/{question_id}/reaction/', 'QuestionReactionController@store')
			->name('question.reaction.store');
		Route::get('/{question_id}/reaction/{user_id}', 'QuestionReactionController@show')
			->name('question.reaction.show');
		Route::post('/{question_id}/reaction/', 'QuestionReactionController@update')
			->name('question.reaction.update');
		Route::delete('/{question_id}/reaction/', 'QuestionReactionController@delete')
			->name('question.reaction.delete');
	});

	Route::namespace('Proposal')->group(function(){
		Route::prefix('/{question_id}')->group(function(){
			Route::get('/', 'ProposalController@index')
				->name('proposal.index');

			Route::post('/', 'ProposalController@store')
				->name('proposal.store');

			Route::get('/proposta/{proposal_id}', 'ProposalController@show')
				->name('proposal.show');

			Route::put('/proposta/{proposal_id}/atualizar', 'ProposalController@update')
				->name('proposal.update');

			Route::delete('proposta/{proposal_id}/deletar', 'ProposalController@destroy')
				->name('proposal.delete');

			/**
			 * 	Reactions
			 * */
			Route::post('/reaction/', 'ProposalReactionController@store')
				->name('proposal.reaction.store');
			Route::get('/reaction/{user_id}', 'ProposalReactionController@show')
				->name('proposal.reaction.show');
			Route::post('/reaction/', 'ProposalReactionController@update')
				->name('proposal.reaction.update');
			Route::delete('/reaction/', 'ProposalReactionController@delete')
				->name('proposal.reaction.delete');
		});
		Route::get('/buscar', 'ProposalController@search')
			->name('proposal.search');
	});

	Route::namespace('Comment')->group(function(){
		Route::prefix('/{question_id}/comentario')->group(function(){
			Route::get('/', 'CommentController@index')
				->name('comment.index');

			Route::get('/{comentario_id}', 'CommentController@show')
				->name('comment.show');

			Route::post('/', 'CommentController@store')
				->name('comment.store');

			Route::put('/{comentario_id}/atualizar', 'CommentController@update')
				->name('comment.update');

			Route::delete('/{commentario_id}/deletar', 'CommentController@destroy')
				->name('comment.delete');
		});



		Route::prefix('/{question_id}/proposta/{proposal_id}/comentario')->group(function(){			

		});


	});
});



/**
 * 	Specialty/Especialidades
 * 
 * */
Route::group(['prefix' => 'specialty'], function(){
	Route::get('/', ['as' => 'specialty.index', 'uses'=>'SpecialtyController@index']);
	Route::get('/criar', ['as'=>'specialty.create', 'uses'=>'SpecialtyController@create']);
	Route::post('/', ['as'=>'specialty.store', 'uses'=>'SpecialtyController@store']);
	Route::get('/{id}/mostrar', ['as'=>'specialty.show', 'uses'=>'SpecialtyController@show']);
	Route::get('/{id}/editar', ['as'=>'specialty.edit', 'uses'=>'SpecialtyController@edit']);
	Route::put('/{id}/atualizar', ['as'=>'specialty.update', 'uses'=>'SpecialtyController@update']);
	Route::post('/{id}/deletar', ['as' => 'specialty.delete', 'uses'=>'SpecialtyController@delete']);
});

/**
 * 	Users/Usuários
 *  
 */
	
Route::namespace('User')->group(function(){
	Route::prefix('usuario')->group(function(){		
		Route::prefix('/{user_id}')->group(function() {
			Route::get('/perfil/', 'UserController@show')->name('user.profile');
			Route::get('/editar/', 'UserController@edit')->name('user.edit');
		});
	});
});