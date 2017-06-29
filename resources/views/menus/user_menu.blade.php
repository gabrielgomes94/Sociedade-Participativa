@section('menu')
    <div class="row">
            <nav class="navbar navbar-inverse menu">
                <div class="navbar-header">
                    <a class="navbar-brand" href="{{ URL::route('user.show', Auth::user()->id) }}"> {{Auth::user()->name}}</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="{{ URL::route('user.show', Auth::user()->id)}}">Perfil</a></li>
                    <li><a href="{{ URL::route('question.index') }}">Postagens</a></li>
                    <li><a href="{{ URL::route('question.create', Auth::user()->id) }}">Criar   Questão</a></li>

                    <li><a href="#"><span class="glyphicon glyphicon-bell notification pull-right"> </span></a>
                    <li><a href="#"><span class="glyphicon glyphicon-log-out logout pull-right"> </span></a></li>
                    <!-- Implementar um botão e um mecanismo de busca -->
                </ul>

            </nav>
    </div>
@endsection