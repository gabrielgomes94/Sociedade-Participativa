@extends('layouts.app')
@extends('menus.user_menu')
@extends('question.filter-box')        
<!-- if there are creation errors, they will show here -->

<!-- Box para filtragem das questões -->

@include('menus.filter-box')        
@section('content')


<!-- Questions -->
	@if($questions!=null)
	<div class="profile-questions">		
		<div class="row">
			<div class="col-md-10">
				<h2 class="profile-questions-title">Questões Recentes</h2>
			</div>
			<div class="col-md-2">
				<button type="button" class="btn btn-hide pull-right" action="#">
					<span class="glyphicon glyphicon-chevron-up pull-right"> </span>
				</button>
			</div>
		</div>
		@php 
			$id=0;
		@endphp
		@foreach($questions as $question)
			<div class="profile-questions-box" id="profile-questions-box-{{$id}}">
				<div class="row">
					<div class="col-md-9">
						<h4><a href="{{ URL::route('question.show', $question->id)}}"> {{ $question->title }} </a></h4>
					</div>

					<div class="col-md-3 reaction-box">
						@include('reactions.question_bar')
						@include('reactions.question_bar_buttons')						
					</div>
				</div>
				<div class="row" id="profile-questions-box-{{$id}}-bottom">
					<div class="col-md-9">
						@include('question.location')						
					</div>
					<div class="col-md-3">						
						<p class="pull-right"> {{ $question->post_date}}</p>
					</div>
				</div>
			</div>
			@php
				$id++;
			@endphp
		@endforeach
		
	</div>
	@endif

	<!-- Proposals -->
	@if($proposals!=null)
	<div class="profile-proposals">
		<div class="row">
			<div class="col-md-10">
					<h2 class="profile-proposals-title">Propostas Recentes</h2>
			</div>
			
			<div class="col-md-2">
				<button type="button" class="btn btn-hide pull-right" action="#">
					<span class="glyphicon glyphicon-chevron-up pull-right"> </span>
				</button>
			</div>
		</div>
		
		
		@php 
			$id=0;
		@endphp
		@foreach($proposals as $prop)						
			@if($prop!=null)
			<div class="profile-proposals-box" id="profile-proposals-box-{{$id}}">
				<div class="row">
					<div class="col-md-9">
						<p>{!! $prop->abstract !!}</p>
					</div>
					<div class="col-md-3 reaction-box">
						<h1>{{ $prop->rating }}</h1>
						<div class="pull-right reaction-box-label">
							<span class="glyphicon glyphicon-thumbs-up"> {{$prop->upvotes}} </span>
							<span class="glyphicon glyphicon-thumbs-down"> {{$prop->downvotes}}</span>
						</div>
						<p class="pull-right"> {{ $prop->post_date}}</p>
					</div>
				</div>
				<div class="row" id="profile-questions-box-{{$id}}-bottom">
					<div class="col-md-12">
						@if($prop->question!=null)
						 <h4 class="text-right"> em <a href="{{ URL::route('question.show', $prop->question->id)}}"> {{ $prop->question->title}}</a></h4>
						@endif
					</div>
				</div>
			</div>
			@endif
			@php
				$id++;
			@endphp
		@endforeach
	</div>
	@endif
	


@endsection
