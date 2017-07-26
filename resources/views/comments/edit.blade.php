<!-- app/views/nerds/create.blade.php -->

@extends('layouts.app')
@extends('menus.user_menu')
@section('header_title')

        
        <!-- if there are creation errors, they will show here -->
@stop
@section('content')

	<div class="edit-question">
		<h2>Editar um Comentário</h2>
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
        <form action="{{ URL::route('comment.update') }}" method="post">
        	<input type="hidden" name="_token" value="{{ csrf_token() }}">
        	<input type="hidden" name="_method" value="put">        	
            <div class="form-group">
                {{ Form::label('conteudo', 'Conteúdo') }}
                {{ Form::textarea('content', Request::old('content'), array('class' => 'form-control')) }}
            </div>            
            <div class="row">
            	<div class="col-md-12">
            		<input type="submit" class="btn btn-primary" value="Editar o comentário">
            	</div>            	
            </div>            
        </form>
	</div>
@endsection