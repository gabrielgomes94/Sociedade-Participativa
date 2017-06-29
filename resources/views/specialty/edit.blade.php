<!-- app/views/nerds/create.blade.php -->

<!DOCTYPE html>
<html>
<head>
    <title>Look! I'm CRUDding</title>
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css">
</head>
<body>
    <div class="container">
        <nav class="navbar navbar-inverse">
            <div class="navbar-header">
                <a class="navbar-brand" href="{{ URL::to('specialty') }}">Nerd Alert</a>
            </div>
            <ul class="nav navbar-nav">
                <li><a href="{{ URL::to('specialty') }}">View All Nerds</a></li>
                <li><a href="{{ URL::to('specialty/create') }}">Create a Nerd</a>
            </ul>
        </nav>

        <h1>Edit {{ $specialty->name }}</h1>
        <!-- if there are creation errors, they will show here -->
        

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

        {{ Form::open(array('route' => 'specialty.update', 'method'=>'POST')) }}

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
</body>
</html>

