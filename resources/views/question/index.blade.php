@extends('layouts.app')
@extends('menus.user_menu')


<!-- if there are creation errors, they will show here -->

<!-- Box para filtragem das questões -->

@section('content')	
@include('menus.filter-box')
<!--	Questions/Questões do usuário	-->
	@if($questions!=null)
	<div class="index-questions box" data-value="question">		
		<div class="row">
			<div class="col-md-10">
				<h2 class="index-questions-title">Questões</h2>
			</div>
			<div class="col-md-2">
				<button type="button" class="btn btn-hide-show pull-right" action="#">
					<span class="glyphicon glyphicon-chevron-up pull-right"> </span>
				</button>
			</div>
		</div>
		@foreach($questions as $question)
		<div class="question-box" id="index-questions-box-{{$question->id}}" data-value="{{ $question->id }}">
			<div class="row" >
				<div class="col-md-9">
					<h4><a href="{{ URL::route('question.show', $question->id)}}"> {{ $question->title }} </a></h4>
				</div>
				<div class="col-md-3 reaction-box">
					@include('partials.reactions.bars.question_bar')
					@include('partials.reactions.buttons.question_bar_buttons')
				</div>
			</div>
			<div class="row" id="index-questions-box-{{$question->id}}-bottom">
				<div class="col-md-9">					
					<p> por {{ $question->author['name'] }} {{ $question->author['lastname'] }} em {{ $question->district }}, {{ $question->city }}, {{ $question->state }}, {{ $question->country}}</p> 
				</div>
				<div class="col-md-3">						
					<p class="pull-right"> {{ $question->created_at}}</p>
					@foreach($question->categories as $cat)
						{{ $cat->name}}
					@endforeach
				</div>
			</div>
		</div>			
		@endforeach
	</div>
	@endif
@endsection

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="{{ URL::asset('js/hide-show.js') }}"></script>

<!-- @include('partials.scripts.question_reaction_scripts') -->

@include('partials.scripts.question_reaction_scripts')

