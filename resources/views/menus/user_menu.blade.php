@section('menu')
    <div class="row">
            <nav class="navbar navbar menu">
                <div class="navbar-header">
                    <a class="navbar-brand" href="{{ URL::route('user.profile', Auth::user()->id) }}"> {{Auth::user()->name}}</a>
                </div>
                <ul class="nav navbar-nav">
                    <li><a href="{{ URL::route('user.profile', Auth::user()->id)}}" class="menuZ">Perfil</a></li>
                    <li><a href="{{ URL::route('question.index') }}">Postagens</a></li>
                    <li><a href="{{ URL::route('question.create', Auth::user()->id) }}">Criar   Questão</a></li>

                    <li><a href="#"><span class="glyphicon glyphicon-bell notification pull-right"> </span></a>
                    <li><a href="#"><span class="glyphicon glyphicon-log-out logout pull-right"> </span></a></li>
                    <!-- Implementar um botão e um mecanismo de busca -->
                </ul>
                <!-- Right Side Of Navbar -->
                    <ul class="nav navbar-nav navbar-right menuZ">
                        <!-- Authentication Links -->
                        @if (Auth::guest())
                            <li><a href="{{ url('/login') }}">Login</a></li>
                            <li><a href="{{ url('/register') }}">Register</a></li>
                        @else
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                    Opções <span class="caret"></span>
                                </a>

                                <ul class="dropdown-menu" role="menu">
                                    <li>
                                        <a href="{{ url('/logout') }}"
                                            onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                            Logout
                                        </a>

                                        <form id="logout-form" action="{{ url('/logout') }}" method="POST" style="display: none;">
                                            {{ csrf_field() }}
                                        </form>
                                    </li>
                                </ul>
                            </li>
                        @endif
                    </ul>

            </nav>
    </div>
@endsection