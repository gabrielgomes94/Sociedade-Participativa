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

Route::get('/home', 'HomeController@index');
Route::get('/busca', ['as'=>'search', 'uses'=>'Controller@general_search']);

/**
 * 	Location
 * 
 *  */
Route::get('api/dependent-dropdown', ['as'=>'location.country', 'uses'=>'LocationController@index']);
Route::get('api/get-state-list', ['as'=>'location.state', 'uses'=> 'LocationController@getStateList']);
Route::get('api/get-city-list', ['as'=>'location.city', 'uses'=> 'LocationController@getCityList']);


/**
 * 	Reaction
 * 
 * 	*/
Route::get('/question_reaction/{id}', ['as'=>'question.reaction', 'uses'=>'ReactionController@get_question_reactions']);


/**
	 * Comments
	 * 
	 * */
	Route::group(['prefix'=>'comment'], function(){
		Route::get('/', ['as'=>'comment.index', 'uses'=>'CommentController@index']);
		Route::get('/criar', ['as'=>'comment.create', 'uses'=>'CommentController@create']);
		Route::post('/', ['as'=>'comment.store', 'uses'=>'CommentController@store']);
		Route::get('/mostrar', ['as'=>'comment.show', 'uses'=>'CommentController@show']);
		Route::get('/{id}/editar', ['as'=>'comment.edit', 'uses'=>'CommentController@edit']);
		Route::put('/atualizar/', ['as'=>'comment.update', 'uses'=>'CommentController@update']);
		Route::post('/deletar', ['as' => 'comment.delete', 'uses'=>'CommentController@destroy']);
		Route::post('/inserirReacao', ['as'=>'comment.insertReaction', 'uses'=>'CommentController@insertReaction']);
		Route::get('/lerReacaoAvaliacoes', ['as'=>'comment.readReaction', 'uses'=>'CommentController@readReaction']);	
		Route::put('/alterarAvaliacaoProposta', ['as'=>'comment.updateReaction', 'uses'=>'CommentController@updateReaction']);
		Route::get('/lerContagemReacoes', ['as'=>'comment.readReactionCounting', 'uses'=>'CommentController@readReactionCounting']);
		Route::post('/denunciar', ['as'=>'comment.report', 'uses'=>'CommentController@report']);


		Route::get('/content', ['as'=>'comment.content', 'uses'=>'CommentController@showCommentContent']);
		//Route::get('/lerAvaliacao', ['as'=>'comment.getRating', 'uses'=>'ProposalController@getRating']);
	});

/**
	 *	Proposal/Propostas
	 * 
	 */

	//Route::group(['prefix'=>'proposal'], function(){
		// Route::get('/', ['as' => 'proposal.index', 'uses'=>'ProposalController@index']);
		// Route::get('/criar', ['as'=>'proposal.create', 'uses'=>'ProposalController@create']);
		// Route::post('/', ['as'=>'proposal.store', 'uses'=>'ProposalController@store']);
		// Route::get('/mostrar', ['as'=>'proposal.show', 'uses'=>'ProposalController@show']);
		// Route::get('/{id}/editar', ['as'=>'proposal.edit', 'uses'=>'ProposalController@edit']);
		// Route::put('/{id}/atualizar', ['as'=>'proposal.update', 'uses'=>'ProposalController@update']);
		// Route::delete('/deletar', ['as' => 'proposal.delete', 'uses'=>'ProposalController@destroy']);
		// Route::get('/buscar', ['as'=>'proposal.search', 'uses'=>'ProposalController@search']);

		// Route::post('/inserirReacao', ['as'=>'proposal.insertReaction', 'uses'=>'ProposalController@insertReaction']);
		// Route::get('/lerReacaoAvaliacoes', ['as'=>'proposal.readReaction', 'uses'=>'ProposalController@readReaction']);	
		// Route::put('/alterarAvaliacaoProposta', ['as'=>'proposal.updateReaction', 'uses'=>'ProposalController@updateReaction']);
		// Route::get('/lerAvaliacao', ['as'=>'proposal.getAvgReactions', 'uses'=>'ProposalController@getAverageReactions']);
		// Route::post('/denunciar', ['as'=>'proposal.report', 'uses'=>'ProposalController@report']);
	//});


Route::prefix('question')->group(function(){
	Route::get('/', 'QuestionController@index')->name('question.index');
	Route::post('/', 'QuestionController@store')->name('question.store');
	Route::get('/criar', 'QuestionController@create')->name('question.create');
	Route::get('/{id}/', 'QuestionController@show')->name('question.show')->middleware('auth');

	Route::get('/{id}/editar', 'QuestionController@edit')->name('question.edit');
	Route::put('/{id}/atualizar', 'QuestionController@update')->name('question.update');
	Route::delete('/deletar', 'QuestionController@destroy')->name('question.delete');
	Route::get('/buscar', 'QuestionController@search')->name('question.search');
	
	/**
	 * Question Reactions
	 * */
	Route::post('/inserirReacao', 'QuestionController@insertReaction')->name('question.insertReaction');
	Route::get('/lerReacaoAvaliacoesQ', 'QuestionController@readReaction')->name('question.readReaction');	
	Route::put('/alterarAvaliacaoProposta', 'QuestionController@updateReaction')->name('question.updateReaction');	
	Route::get('/lerContagemReacoes', 'QuestionController@readReactionCounting')->name('question.readReactionCounting');
	//Ordenar questões
	Route::post('/ordenarQuestoes', ['as'=>'question.sort', 'uses'=>'QuestionController@sortQuestions']);
	Route::post('/denunciar', ['as'=>'question.report', 'uses'=>'QuestionController@report']);

	Route::prefix('/proposal')->group(function(){
		Route::get('/', 'ProposalController@index')->name('proposal.index');
		Route::get('/criar', 'ProposalController@create')->name('proposal.create');
		Route::post('/', 'ProposalController@store')->name('proposal.store');
		Route::get('/mostrar/', 'ProposalController@show')->name('proposal.show');
		Route::get('/editar/', 'ProposalController@edit')->name('proposal.edit');
		Route::get('/atualizar/', 'ProposalController@update')->name('proposal.update');
		Route::delete('/deletar/', 'ProposalController@destroy')->name('proposal.delete');
		Route::get('/buscar', 'ProposalController@search')->name('proposal.search');
		Route::post('/inserirReacao', 'ProposalController@insertReaction')->name('proposal.insertReaction');
		Route::get('/lerReacaoAvaliacoes', 'ProposalController@readReaction')->name('proposal.readReaction');
		Route::put('/alterarAvaliacaoProposta', 'ProposalController@updateReaction')->name('proposal.updateReaction');
		Route::get('/lerAvaliacao', 'ProposalController@getAverageReactions')->name('proposal.getAvgReactions');	
		Route::post('/denunciar', ['as'=>'proposal.report', 'uses'=>'ProposalController@report']);

	});
});

Route::prefix('comment')->group(function(){
		Route::get('/', 'CommentController@index')->name('comment.index');
		Route::get('/criar', 'CommentController@create')->name('comment.create');
		Route::post('/', 'CommentController@store')->name('comment.store');
		Route::get('/mostrar/', 'CommentController@show')->name('comment.show');
		Route::get('/editar/', 'CommentController@edit')->name('comment.edit');
		Route::get('/atualizar/', 'CommentController@update')->name('comment.update');
		Route::delete('/deletar/', 'CommentController@destroy')->name('comment.delete');
		Route::get('/buscar', 'CommentController@search')->name('comment.search');
		Route::post('/inserirReacao', 'CommentController@insertReaction')->name('comment.insertReaction');
		Route::get('/lerReacaoAvaliacoes', 'CommentController@readReaction')->name('comment.readReaction');
		Route::put('/alterarAvaliacaoProposta', 'CommentController@updateReaction')->name('comment.updateReaction');
		Route::get('/lerAvaliacao', 'CommentController@getAverageReactions')->name('comment.getAvgReactions');	
		Route::post('/denunciar', ['as'=>'comment.report', 'uses'=>'CommentController@report']);
});

/**
 *	Question/Questão
 * 
 */

Route::group(['prefix'=>'question'], function(){
	// Route::get('/', ['as' => 'question.index', 'uses'=>'QuestionController@index']);
	// Route::post('/', ['as'=>'question.store', 'uses'=>'QuestionController@store']);
	// Route::get('/criar', ['as'=>'question.create', 'uses'=>'QuestionController@create']);
	// Route::get('/{id}/', ['as'=>'question.show', 'uses'=>'QuestionController@show']);
	// Route::get('/{id}/editar', ['as'=>'question.edit', 'uses'=>'QuestionController@edit']);
	// Route::put('/{id}/atualizar', ['as'=>'question.update', 'uses'=>'QuestionController@update']);
	// Route::delete('/deletar', ['as' => 'question.delete', 'uses'=>'QuestionController@destroy']);
	// Route::get('/buscar', ['as'=>'question.search', 'uses'=>'QuestionController@search']);

	//Reactions
	// Route::post('/inserirReacao', ['as'=>'question.insertReaction', 'uses'=>'QuestionController@insertReaction']);
	// Route::get('/lerReacaoAvaliacoes', ['as'=>'question.readReaction', 'uses'=>'QuestionController@readReaction']);	
	// Route::put('/alterarAvaliacaoProposta', ['as'=>'question.updateReaction', 'uses'=>'QuestionController@updateReaction']);
	// Route::get('/lerContagemReacoes', ['as'=>'question.readReactionCounting', 'uses'=>'QuestionController@readReactionCounting']);

	// //Ordenar questões
	// Route::post('/ordenarQuestoes', ['as'=>'question.sort', 'uses'=>'QuestionController@sortQuestions']);
	// Route::post('/denunciar', ['as'=>'question.report', 'uses'=>'QuestionController@report']);	

	
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
	
Route::group(['prefix' => 'user'], function(){
	Route::get('/{id}/profile', ['as'=>'user.profile', 'uses'=>'UserController@show']);
	Route::get('/{id}/edit', ['as'=>'user.edit', 'uses'=>'UserController@edit']);
	
	Route::post('/', ['as'=>'user.store', 'uses'=>'UserController@store']);
	Route::get('/{id}/show', ['as'=>'user.show', 'uses'=>'UserController@show']);
	Route::post('/{id}delete', ['as'=>'user.delete', 'uses'=>'UserController@delete']);
	Route::get('/create', ['as'=>'user.create', 'uses'=>'UserController@create']);
	Route::get('/posts', ['as'=>'user.posts', 'uses'=>'UserController@posts']);

	Route::put('/{id}/update1', ['as'=>'user.update_contact_info', 'uses'=>'UserController@update_contact_info']);
	Route::put('/{id}/update2', ['as'=>'user.update_profile_info', 'uses'=>'UserController@update_profile_info']);
	
	Route::put('/{id}/update4', ['as'=>'user.update_privacy_info', 'uses'=>'UserController@update_privacy_info']);

	Route::post('/{id}/update3', ['as'=>'user.add_specialty_info', 'uses'=>'UserController@add_specialty_info']);
	Route::post('/{id}/update5', ['as'=>'user.remove_specialty_info', 'uses'=>'UserController@remove_specialty_info']);
	Route::get('/search', ['as'=>'user.search', 'uses'=>'UserController@search']);
});