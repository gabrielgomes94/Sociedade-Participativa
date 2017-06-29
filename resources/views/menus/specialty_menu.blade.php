@section('menu')
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
