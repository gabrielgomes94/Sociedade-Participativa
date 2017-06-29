<!-- app/views/nerds/create.blade.php -->

@extends('layouts.app')
@extends('menus.user_menu')
@section('header_title')
<body>
        
        <!-- if there are creation errors, they will show here -->
@stop
@section('content')
    <h1>Criar uma questão</h1>
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

        {{ Form::open(array('route' => 'question.store', 'method'=>'POST')) }}

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
            
            {{ Form::submit('Criar a questão', array('class' => 'btn btn-primary')) }}
        {{ Form::close() }}
    </div>
@stop
</body>



<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="{{ URL::asset('js/city-state-country-form.js') }}"></script>   
<script src="{{ URL::asset('js/tinymce/js/tinymce/tinymce.min.js') }}"></script>
<script src="{{ URL::asset('js/tinymce-config.js') }}"></script>

</html>

