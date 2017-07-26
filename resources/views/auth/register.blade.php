@extends('layouts.app')

@section('content')
<div class="panel panel-default">
  <div class="panel-heading">Registro</div>
  <div class="panel-body">
      <form class="form-horizontal" role="form" method="POST" action="{{ url('/register') }}">
          {{ csrf_field() }}
          <div class="form-group{{ $errors->has('name') ? ' has-error' : '' }}">
              <label for="name" class="col-md-4 control-label">Nome</label>
              <div class="col-md-5">
                  <input id="name" type="text" class="form-control" name="name" value="{{ old('name') }}" required autofocus>
                  @if ($errors->has('name'))
                      <span class="help-block">
                          <strong>{{ $errors->first('name') }}</strong>
                      </span>
                  @endif
              </div>
          </div>

          <div class="form-group{{ $errors->has('lastname') ? ' has-error' : '' }}">
              <label for="lastname" class="col-md-4 control-label">Sobrenome</label>
              <div class="col-md-5">
                  <input id="name" type="text" class="form-control" name="name" value="{{ old('lastname') }}" required autofocus>
                  @if ($errors->has('lastname'))
                      <span class="help-block">
                          <strong>{{ $errors->first('lastname') }}</strong>
                      </span>
                  @endif
              </div>
          </div>

          <div class="form-group{{ $errors->has('email') ? ' has-error' : '' }}">
              <label for="email" class="col-md-4 control-label">Endereço de E-Mail</label>
              <div class="col-md-5">
                  <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required>
                  @if ($errors->has('email'))
                      <span class="help-block">
                          <strong>{{ $errors->first('email') }}</strong>
                      </span>
                  @endif
              </div>
          </div>

          <div class="form-group{{ $errors->has('password') ? ' has-error' : '' }}">
              <label for="password" class="col-md-4 control-label">Senha</label>
              <div class="col-md-5">
                  <input id="password" type="password" class="form-control" name="password" required>

                  @if ($errors->has('password'))
                      <span class="help-block">
                          <strong>{{ $errors->first('password') }}</strong>
                      </span>
                  @endif
              </div>
          </div>

          <div class="form-group">
              <label for="password-confirm" class="col-md-4 control-label">Confirmar Senha</label>

              <div class="col-md-5">
                  <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required>
              </div>
          </div>

           <div class="form-group">
              <label for="gender" class="col-md-4 control-label">Gênero</label>
              <div class="col-md-5">
                <input type="radio" name="gender" value="male" >
                <label for="type">Masculino</label><br>               
                <input type="radio" name="gender" value="female">
                <label for="type">Feminino</label>                    
              </div>
          </div>

          <div class="form-group">
            <label for="birthday" class="col-md-4 control-label">Data de Nascimento</label>
            <div class="col-md-5">
              <div class="row">
                <div class="col-md-4">
                  <select id="year" name="year" class="form-control">
                    <option value="">Ano</option>               
                  </select>
                </div>
                <div class="col-md-4">
                  <select id="month" name="month" class="form-control">
                    <option value="">Mês</option>
                    <option value="1">Janeiro</option>
                    <option value="2">Fevereiro</option>
                    <option value="3">Março</option>
                    <option value="4">Abril</option>
                    <option value="5">Maio</option>
                    <option value="6">Junho</option>
                    <option value="7">Julho</option>
                    <option value="8">Agosto</option>
                    <option value="9">Setembro</option>
                    <option value="10">Outubro</option>
                    <option value="11">Novembro</option>
                    <option value="12">Dezembro</option>
                  </select>
                </div>                
                <div class="col-md-4">
                  <select id="day" name="day" class="form-control">
                    <option value="">Dia</option>
                  </select>
                </div>
              </div>
            </div>
          </div>

          @include('partials.box.location-form')

          <div class="form-group">
              <div class="col-md-5 col-md-offset-4">
                  <button type="submit" class="btn btn-primary">
                      Registrar
                  </button>
              </div>
          </div>
      </form>
  </div>
</div>
@endsection

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="{{ URL::asset('js/city-state-country-form.js') }}"></script>
<script type="text/javascript">
  $(document).ready(function(){    

    $('#year').ready(function (){      
      var options = '<option>Ano</option>';
      for(var i=2016; i>=1900; i--){
         options += '<option value="' + i + '">' + i + '</option>';                   
      }
      $('#year').html(options);
    });

    $('#month').change(function (){
      var options = ''
      var month_code = $('#month option:selected').val();            
      if(month_code == 4 || month_code == 6 || month_code == 9 || month_code == 11){
        limit = 30;
      } else if(month_code == 2){
        limit = 28;
      } else {
        limit = 31;
      }
      for(var i=1; i<=limit; i++){
        options += '<option value="' + i + '">' + i + '</option>';                   
      }
      $('#day').html(options);
    });
  });
</script>