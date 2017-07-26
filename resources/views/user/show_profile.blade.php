@extends('layouts.app')
@extends('menus.user_menu')
@section('header_title')
    
@stop
@section('content')
	<div class="row profile-info">
		<div class="col-md-3">
			<div class="profile-picture">
				<img src="https://imagens.canaltech.com.br/121105.204635-Navegacao-anonima.jpg" class="profile-img">
				
			</div>
		</div>
		<div class="col-md-9">
			<div class="row profile-info-text">
				<div class="col-md-9">
					<h2>{{$user->name}} {{$user->lastname}}</h2>
				</div>
				<div class="col-md-3">
					@if($user->show_age)
					<h2 class="pull-right">{{$user->age}} anos</h2>
					@endif
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					@if($user->show_district || $user->show_city || $user->show_state || $user->show_country)
						<p><b>Localização: </b> @if($user->show_district) {{$user->district}} @endif, @if($user->show_city) {{$user->city}} @endif - @if($user->show_state) {{$user->state}} @endif - @if($user->show_country) {{$user->country}} @endif</p>
					@endif
					@if($user->show_birthday)
						<p><b>Data de Nascimento: </b>{{$user->birthday}}</p>
					@endif
					@if($user->show_email)
						<p><b>Email: </b>{{$user->email}}</p>		
					@endif
				</div>
			</div>
			<div class="row">
				<div class="col-md-10">

				</div>
				<div class="col-md-2">
					@if($user->id==Auth::user()->id)
						<a href="{{URL::route('user.edit', $user->id)}}">
						<button type="button" class="btn btn-edit-profile pull-right " action="{{URL::route('user.edit', $user->id)}}" method="get">  
								Editar Perfil <span class="glyphicon glyphicon-pencil"> </span>
						</button>
						</a>
						<br><br>
					@endif
				</div>
				<br>
			</div>
		</div>
	</div>	

	<div class="profile-specs box" data-value="specs">
		<div class="row">
			<div class="col-md-10">
				<h2 class="profile-specs-title">Especialidades</h2>
			</div>			
			<div class="col-md-2">
				<button type="button" class="btn btn-hide-show pull-right" action="#">
					<span class="glyphicon glyphicon-chevron-up pull-right"> </span>
				</button>
			</div>
		</div>
		<div class="specs-box">
			<div class="row">
				<div class="col-md-12">
					<ul>
					@foreach($user->specialties as $specs)
						<div class="col-md-4" id="specialty-{{$specs->id}}">
							<li>{{ $specs->name }}</li>							
						</div>
					@endforeach
					</ul>
				</div>
				
			</div>
			<div class="row">
				<div class="col-md-12">
					@if($user->id==Auth::user()->id)
						<button type="button" class="btn btn-edit-profile-specialties pull-right " action="{{URL::route('user.edit', $user->id)}}" method="post">  
								Editar Especialidades <span class="glyphicon glyphicon-pencil"> </span>
						</button>
						<br><br>
					@endif
				</div>
			</div>
			
		</div>
	</div>


	<!-- 
		Questions/Questões do usuário
	 -->
	@if($questions!=null)
	<div class="profile-questions box" data-value="question">		
		<div class="row">
			<div class="col-md-10">
				<h2 class="profile-questions-title">Questões Recentes</h2>
			</div>
			<div class="col-md-2">
				<button type="button" class="btn btn-hide-show pull-right" action="#">
					<span class="glyphicon glyphicon-chevron-up pull-right"> </span>
				</button>
			</div>
		</div>
		@foreach($questions as $question)
		<div class="question-box" id="profile-questions-box-{{$question->id}}" data-value="{{ $question->id }}">
			<div class="row" >
				<div class="col-md-9">
					<h4><a href="{{ URL::route('question.show', $question->id)}}"> {{ $question->title }} </a></h4>
				</div>

				<div class="col-md-3 reaction-box">
					@include('partials.reactions.bars.question_bar')
					@include('partials.reactions.buttons.question_bar_buttons')
				</div>
			</div>
			<div class="row" id="profile-questions-box-{{$question->id}}-bottom">
				<div class="col-md-9">
					<p> em {{ $question->district }} - {{ $question->city }} - {{ $question->state }} - {{ $question->country}}</p>
				</div>
				<div class="col-md-3">						
					<p class="pull-right"> {{ $question->post_date}}</p>
				</div>
			</div>
		</div>			
		@endforeach
	</div>
	@endif

	<!-- 
		Proposals/Propostas do usuário
	 -->
	@if($proposals!=null)
	<div class="profile-proposals box" data-value="proposal">
		<div class="row">
			<div class="col-md-10">
				<h2 class="profile-proposals-title">Propostas Recentes</h2>
			</div>
			<div class="col-md-2">
				<button type="button" class="btn btn-hide-show pull-right" action="#">
					<span class="glyphicon glyphicon-chevron-up pull-right"> </span>
				</button>
			</div>
		</div>		
				
		@foreach($proposals as $proposal)						
			@if($proposal!=null)
			<div class="proposal-box" id="profile-proposals-box-{{$proposal->id}}" data-value="{{ $proposal->id}}">
				<div class="row">
					<div class="col-md-9">
						<p>{!! $proposal->abstract !!}</p>
					</div>
					<div class="col-md-3 reaction-box">
						@include('partials.reactions.buttons.proposal_bar_buttons')			
						<p class="pull-right"> {{ $proposal->post_date}}</p>
					</div>
				</div>
				<div class="row" id="profile-questions-box-{{$proposal->id}}-bottom">
					<div class="col-md-12">
						@if($proposal->question!=null)
						 <h4 class="text-right"> em <a href="{{ URL::route('question.show', $proposal->question->id)}}"> {{ $proposal->question->title}}</a></h4>
						@endif
					</div>
				</div>
			</div>
			@endif			
		@endforeach
	</div>
	@endif

	<!-- 
		Comments/Comentários do usuário
	-->
	@if($comments != null)
	<div class="profile-comments box" data-value="comment">
		<div class="row">
			<div class="col-md-10">
					<h2 class="profile-comments-title">Comentários Recentes</h2>
			</div>
			<div class="col-md-2">
				<button type="button" class="btn btn-hide-show pull-right" action="#">
					<span class="glyphicon glyphicon-chevron-up pull-right"> </span>
				</button>
			</div>
		</div>
		@foreach($comments as $comment)
		@if($comment!=null)
		<div class="comment-box" id="profile-comments-box-{{$comment->id}}" data-value="{{ $comment->id }}">
			<div class="row profile-comments-box-body"  >
				<div class="col-md-9">
					<p> {!! $comment->abstract !!} [...] </p>					
				</div>
				<div class="col-md-3 comment-reaction-box">						
					@include('partials.reactions.bars.comment_bar')
					@include('partials.reactions.buttons.comment_bar_buttons')			
					<p class="pull-right"> {{ $comment->post_date}}</p>
				</div>
			</div>
			<div class="row profile-comments-box-link" id="profile-comments-box-{{$comment->id}}-bottom">
				<div class="col-md-12">
					 <h4 class="text-right"> em <a href="{{ URL::route('question.show', $comment->link_id)}}"> {{ $comment->link_title }} </a></h4>
				</div>
			</div>
		</div>
		@endif			
		@endforeach
	</div>
	@endif
	<br>
@stop
@extends('footer.footer')

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="{{ URL::asset('js/hide-show.js') }}"></script>


<!-- <script src="{{ URL::asset('js/star-rating.js') }}"></script> -->
<!-- @include('partials.scripts.proposal_reaction_scripts') -->
<!-- @include('partials.scripts.question_reaction_scripts')
@include('partials.scripts.comment_reaction_scripts') -->
<script type="text/javascript">


</script>