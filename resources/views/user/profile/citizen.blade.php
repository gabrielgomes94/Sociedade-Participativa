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
@stop