<!-- app/views/nerds/create.blade.php -->

@extends('layouts.app')
@extends('menus.specialty_menu')
@section('header_title')
<body>
        
        <!-- if there are creation errors, they will show here -->
@stop
@section('content')
    <h1>Create a Nerd</h1>
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

        {{ Form::open(array('route' => 'specialty.store', 'method'=>'POST')) }}

            <div class="form-group">
                {{ Form::label('name', 'Nome') }}
                {{ Form::text('name', Request::old('name'), array('class' => 'form-control')) }}
            </div>

            <div class="form-group">
                {{ Form::label('area', 'Area de Atuação') }}
                {{ Form::text('area', Request::old('area'), array('class' => 'form-control')) }}
            </div>

            <div class="form-group">
                {{ Form::label('description', 'Descrição') }}
                {{ Form::text('description', Request::old('area'), array('class' => 'form-control')) }}
            </div>

            {{ Form::submit('Create the Nerd!', array('class' => 'btn btn-primary')) }}

        {{ Form::close() }}
    </div>
@stop
</body>
</html>

