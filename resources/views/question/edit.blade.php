<!-- app/views/nerds/create.blade.php -->

@extends('layouts.app')
@extends('menus.user_menu')
@section('header_title')

        
        <!-- if there are creation errors, they will show here -->
@stop
@section('content')

	<div class="edit-question">
		<h2>Editar uma questão</h2>
		@if (count($errors) > 0)
        <div class="alert alert-danger">
            There were some problems adding the category.<br />
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
        @endif
        <form action="{{ URL::route('question.update', $question->id) }}" method="post">
        	<input type="hidden" name="_token" value="{{ csrf_token() }}">
        	<input type="hidden" name="_method" value="put">
        	<div class="form-group">
                {{ Form::label('titulo', 'Titulo') }}
                {{ Form::text('title', Request::old('title'), array('class' => 'form-control')) }}
            </div>

            <div class="form-group">
                {{ Form::label('conteudo', 'Conteúdo') }}
                {{ Form::textarea('content', Request::old('content'), array('class' => 'form-control')) }}
            </div>
            <div class="panel-body row form-group">
                <div class="col-md-4">
                    <label for="title">Selecionar País:</label>
                    <select id="country" name="country" class="form-control location-combo-box">
                        
                        <option value="Brasil">Brasil </option>
                    </select>                                
                </div>
                <div class=" col-md-4  ">
                    <label for="title">Select Estado:</label>
                    <select name="state" id="state" class="form-control location-combo-box">
                        <option value="{{ Auth::user()->state}}"> {{Auth::user()->state}} </option>
                    </select>
                </div>         
                <div class=" col-md-4  ">
                    <label for="title">Selecionar Cidade:</label>
                    <select name="city" id="city" class="form-control location-combo-box">
                    <option value="{{Auth::user()->city}}"> {{Auth::user()->city}} </option>
                    </select>
                </div>
                
            </div>
            <div class="row">
            	<div class="col-md-12">
            		<input type="submit" class="btn btn-primary" value="Editar a questão">
            	</div>
            	
            </div>
            
        </form>
	</div>
@endsection