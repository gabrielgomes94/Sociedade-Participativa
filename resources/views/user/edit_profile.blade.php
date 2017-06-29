@extends('layouts.app')

@section('header_title')
@extends('menus.user_menu')
<body>
        
        <!-- if there are creation errors, they will show here -->
@stop
@section('content')
    <div class="row">
    <h3>Informações da Conta</h3>
    {{ Form::open(array('route' => array('user.update_contact_info', $user->id), 'method'=>'PUT')) }}
        <div class="form-group">
            {{ Form::label('email', 'Email') }}
            {{ Form::text('email', Request::old('email'), array('class' => 'form-control')) }}
        </div>
        <div class="form-group">
            {{ Form::label('password', 'Senha') }}
            {{ Form::password('password', array('class' => 'form-control')) }}
        </div>
        {{ Form::submit('Editar informações', array('class' => 'btn btn-primary')) }}
    {{ Form::close() }}



    <hr>
    <h3>Informações Pessoais</h3>
    {{ Form::open(array('route' => array('user.update_profile_info', $user->id), 'method'=>'PUT')) }}
    <div class="row">
        <div class="col-md-3">
            <div class="profile-picture">
                <img src="https://imagens.canaltech.com.br/121105.204635-Navegacao-anonima.jpg" class="profile-img">
                
            </div>
            <div class="form-group">
                {{ Form::label('photo_url', 'Foto de Perfil') }}
                {{ Form::file('photo_url', array('class' => 'form-control')) }}
            </div>
        </div>
        <div class="col-md-9">
            <div class="form-group">
                {{ Form::label('name', 'Nome') }}
                {{ Form::text('name', Request::old('name'), array('class' => 'form-control')) }}
            </div>

            <div class="form-group">
                {{ Form::label('lastname', 'Sobrenome') }}
                {{ Form::text('lastname', Request::old('lastname'), array('class' => 'form-control')) }}
            </div>
            <div class="row">
                <div class="col-md-3">
                    <div class="form-group">
                        {{ Form::label('gender', 'Gênero') }}
                        <br>
                         {{ Form::radio('gender', 'male')}} Masculino<bR>
                         {{ Form::radio('gender', 'female')}} Feminino
                    </div>
                </div>
                <div class="col-md-9">
                    {{ Form::label('birthday', 'Data de Nascimento') }}
                    <div class="panel-body row form-group">                        
                        <div class="col-md-4">                            
                            <select id="day" name="country" class="form-control location-combo-box">                       
                                <option value="Brasil">Dia </option>
                            </select>                                
                        </div>
                        <div class=" col-md-4  ">                            
                            <select name="state" id="month" class="form-control location-combo-box">
                                <option value="{{ Auth::user()->state}}"> {{Auth::user()->state}} </option>
                            </select>
                        </div>         
                        <div class=" col-md-4  ">                            
                            <select name="city" id="year" class="form-control location-combo-box">
                                <option value="{{Auth::user()->city}}"> {{Auth::user()->city}} </option>
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                {{ Form::label('street', 'Rua') }}
                {{ Form::text('street', Request::old('street'), array('class' => 'form-control')) }}
            </div>
        </div>

        <div class="col-md-1">
            <div class="form-group">
                {{ Form::label('number', 'Número') }}
                {{ Form::text('number', Request::old('number'), array('class' => 'form-control')) }}
            </div>
        </div>

        <div class="col-md-2">
            <div class="form-group">
                {{ Form::label('number', 'Complemento') }}
                {{ Form::text('number', Request::old('number'), array('class' => 'form-control')) }}
            </div>
        </div>

        <div class="col-md-3">
            <div class="form-group">
                {{ Form::label('zipcode', 'CEP') }}
                {{ Form::text('zipcode', Request::old('zipcode'), array('class' => 'form-control')) }}
            </div>
        </div>

    </div>
    <div class="row form-group">
        <div class="col-md-3">
            <div class="">
                {{ Form::label('district', 'Bairro') }}
                {{ Form::text('district', Request::old('district'), array('class' => 'form-control')) }}
            </div>        
        </div>
        <div class="col-md-3">
            <label for="title">Selecionar País:</label>
            <select id="country" name="country" class="form-control location-combo-box">
                <option value="Brasil">Brasil </option>
            </select>                                
        </div>
        <div class=" col-md-3">
            <label for="title">Select Estado:</label>
            <select name="state" id="state" class="form-control location-combo-box">
                <option value="{{ Auth::user()->state}}"> {{Auth::user()->state}} </option>
            </select>
        </div>         
        <div class=" col-md-3">
            <label for="title">Selecionar Cidade:</label>
            <select name="city" id="city" class="form-control location-combo-box">
                <option value="{{Auth::user()->city}}"> {{Auth::user()->city}} </option>
            </select>
        </div>
    </div>
    <div class="btn-submit pull-right">
        {{ Form::submit('Editar informações', array('class' => 'btn btn-primary')) }}
    </div>    
    {{ Form::close() }}

    <hr>
    <div class="container">
        <div class="col-sm-6">
            <div class="form-group">
                <h3>Especialidades</h3> 
                {{ Form::open(array('route' => array('user.remove_specialty_info', $user->id), 'method'=>'POST')) }}               
                
                    @foreach($specs->intersect(App\User::find($user->id)->specialties) as $spec)                
                        {{ Form::label('checkbox', $spec->name) }}
                        {{ Form::checkbox($spec->name, $spec->id) }}
                        <br>
                    @endforeach
                    {{ Form::submit('Remover', array('class' => 'btn btn-primary')) }}
                {{ Form::close() }}
            </div>

        </div>
        <div class="col-sm-6">
            <div class="form-group">
                <h3>Adicionar uma Especialidade</h3> 
                {{ Form::open(array('route' => array('user.add_specialty_info', $user->id), 'method'=>'POST')) }}               
                    @foreach($specs->diff(App\User::find($user->id)->specialties) as $spec)                
                        {{ Form::label('checkbox', $spec->name) }}
                        {{ Form::checkbox($spec->name, $spec->id) }}
                        <br>
                    @endforeach
                    {{ Form::submit('Adicionar', array('class' => 'btn btn-primary')) }}
                {{ Form::close() }}
            </div>
        </div>

    
    </div>
@stop

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="{{ URL::asset('js/city-state-country-form.js') }}"></script>   
