@extends('layouts.app')
@extends('menus.user_menu')

@section('content')
<div class="row">
	<div class="col-md-12">
		@include('partials.box.question-box')
		@include('partials.box.solution-box')
		@include('partials.box.proposal-box')
		
    	@include('partials.modals.delete_question_modal')
    	@include('partials.modals.delete_proposal_modal')
    	@include('partials.modals.create_proposal_modal')
    	@include('partials.modals.edit_proposal_modal')

	</div>
</div>
<hr>


@endsection

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="{{ URL::asset('js/tinymce/js/tinymce/tinymce.min.js') }}"></script>
<script src="{{ URL::asset('js/tinymce-config.js') }}"></script>
<script src="{{ URL::asset('js/hide-show.js') }}"></script>

@include('partials.scripts.comment_reaction_scripts')
@include('partials.scripts.proposal_reaction_scripts')
@include('partials.scripts.question_reaction_scripts')

<script type="text/javascript">

$(document).ready(function(){

	/**
	 *	TODO: retirar o ID da proposta como parâmetro para exclusão
	 *	Ler a documentaçaõ e entender porque deste padrão
	 * 
	 */

	 $('.btn-delete').click(function(){
	 	console.log('sasdas');
	 	var id = $(this).data('id');		
		var type = $(this).data("type");
		var src = '';
		var text = '';
		$('.btn-delete-proposal').click(function(){
			src = "{{ URL::route('proposal.delete', $question->id) }}";
			text = 'Deletar Proposta';
			$.ajax({
				url: src,
				method: "DELETE", 
				data: {
					proposal_id : id
				}, 
				success: function(data){
					console.log("yololololo");
					$('#delete-proposal-modal').modal('hide');
				},
				error: function(data){				
				}
			});

		});	 	
	 });

	
	$('.btn-edit').click(function(){
		var id = $(this).data('id');		
		var type = $(this).data("type");
		var src = '';
		console.log(type);		
		var element = $(this).parents('.' + type + '-content');
		console.log('.' + type + '-content');
		element = $(this).parents('.proposal-content');
		console.log(element.attr("class"));
		element.append('aaa');
		var text = '';	
		switch(type){
			case 'question':
				src = "{{ URL::route('question.update', $question->id) }}";
				text = 'Editar Questão';				
			break;
			case 'proposal':
				src = "{{ URL::route('proposal.update', $question->id) }}";
				text = 'Editar Proposta';				
				$.get("{{ URL::route('proposal.show') }}", )
				$('#edit-proposal-modal').find('.proposal-textarea').text("texto novo");
				$('#edit-proposal-modal').find('.modal-title').text("texto novo");				
				//$('#edit-proposal-modal').modal('toggle');
				$('#edit-proposal-modal').modal('show');
				//$('#edit-proposal-modal').find('.proposal-textarea').append('<textarea rows="15" cols="75" class="proposal-textarea" name="content">fdfdfdfdfdsfsdf</textarea>');
			break;
			case 'comment':
				src = "{{ URL::route('comment.update', $question->id) }}";
				
				text = 'Editar Comentário';
			break
		}

	});
		// var srcCommentContent = "{!! URL::route('comment.content') !!}";
		// var srcCommentUpdate = "{!! URL::route('comment.update' ) !!}";

		// var element = $(this).parents('.comments-comment').find('.comments-comment-content');
		
		// console.log('ID: ' + id);
		// var content;
		// $.get(srcCommentContent, {id}, function(data){
		// 	content = data;
		// 	console.log('Conteudo data : ' + content);
		// 	element.append("<form action='" + srcCommentUpdate + "' method='PUT'><input type='text' class='add_comment form-control' value='" + content +"'  name='content'<input type='hidden' name='id' value='" + id + "'><input type='submit' class='btn btn-primary' value='Enviar'></form>");
		// 	console.log('');
		
});


$(function(){
	var divContent = $('.hidden-form-comment-question');
	var botaoAdicionar = $('#add-comment-question');
	$(botaoAdicionar).click(function(){		
		var linha = $(divContent).append(
			"<div class='form-group'><input type='text' class='add_comment form-control' value='Escreva um comentário...' name='comment_question'><input type='submit' class='btn btn-primary' value='Enviar'></div>");
	});
});

$(function(){
	var divContent = $('#hidden-form-comment-proposal');
	var botaoAdicionar = $('#add-comment-proposal');
	$(botaoAdicionar).click(function(){		
		var linha = $(divContent).append(
			"<div class='form-group'><input type='text' class='add_comment form-control' value='Escreva um comentário...' name='comment_question'><input type='submit' class='btn btn-primary' value='Enviar'></div>");
	});
});
</script>