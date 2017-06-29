@extends('layouts.app')
@extends('menus.user_menu')

@section('content')
<div class="row">
	<div class="col-md-12">
		@include('partials.box.question-box')
		<hr>
		@include('partials.box.proposal-box')
		<!-- 
			Proposal Text-Area
		-->
		{{ Form::open(array('route' => 'proposal.store', 'method'=>'POST')) }}
			{{ Form::label('conteudo', 'Conteúdo') }}
      {{ Form::textarea('content', Request::old('content'), array('class' => 'form-control')) }}
      {{ Form::hidden('question_id', $question->id) }}

   		{{ Form::submit('Criar a questão', array('class' => 'btn btn-primary')) }}
    {{ Form::close() }}
    	@include('partials.modals.delete_modal')

    	@include('partials.modals.create_proposal_modal')

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
		var id = $(this).data("id");		
		var type = $(this).data("type");
		var src = '';
		console.log(type);		
			var text = '';	
			switch(type){
				case 'question':
					src = "{{ URL::route('question.delete') }}";
					text = 'Excluir Questão';
					
				break;
				case 'proposal':
					src = "{{ URL::route('proposal.delete') }}";
					text = 'Excluir Proposta';
				break;
				case 'comment':
					src = "{{ URL::route('comment.delete') }}";
					text = 'Excluir Comentário';
				break
			}
		$('.modal-title').html(text);			
		$('.btn-delete-confirm').click(function(){										
			$.ajax({
				headers: {
	      			'X-CSRF-Token': $('input[name="_token"]').val()
	    		},
				url: src,
				dataType: "json",
				type: "POST",
				data: { id }, 
				success: function(data){
					console.log('sucesso');
				}, 
				error: function(){
					console.log('fracasso');
				}
			});
			$("#delete-modal").modal('hide');
		});
		
	});
	$('.btn-edit').click(function(){
		var id = $(this).data('id');
		var srcCommentContent = "{!! URL::route('comment.content') !!}";
		var srcCommentUpdate = "{!! URL::route('comment.update' ) !!}";
		var element = $(this).parents('.comments-comment').find('.comments-comment-content');
		
		console.log('ID: ' + id);
		var content;
		$.get(srcCommentContent, {id}, function(data){
			content = data;
			console.log('Conteudo data : ' + content);
			element.append("<form action='" + srcCommentUpdate + "' method='PUT'><input type='text' class='add_comment form-control' value='" + content +"'  name='content'<input type='hidden' name='id' value='" + id + "'><input type='submit' class='btn btn-primary' value='Enviar'></form>");
			console.log('');
		});
		

		
	});
	$('.btn-report').click(function(){
		console.log('');
	});
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