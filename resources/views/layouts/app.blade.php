<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <title>{{ config('app.name', 'Laravel') }}</title>

    <!-- Styles -->
    <link href="/css/app.css" rel="stylesheet">
    <link href="/css/colaborativo.css" rel="stylesheet">
    <link href="/css/question-box.css" rel="stylesheet">
    <link href="/css/proposal-box.css" rel="stylesheet">

    <!-- Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Lato|Libre+Baskerville|Source+Sans+Pro" rel="stylesheet"> 

    <!-- Scripts -->
    <script>
        window.Laravel = <?php echo json_encode([
            'csrfToken' => csrf_token(),
        ]); ?>
    </script>
</head>
<body>    
    <div id="app">
        <nav class="navbar navbar-default navbar-static-top">
            <div class="container">
                <div class="navbar-header">

                    <!-- Collapsed Hamburger -->
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <!-- Branding Image -->
                    <a class="navbar-brand" href="{{ url('/') }}">                        
                        {{ config('app.name', 'Sociedade Participativa') }}
                    </a>
                </div>
            </div>
        </nav>


        <div class="container">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10 app-content">
                    @yield('menu')
                    @yield('filter')
                    @yield('content')
                    
                    @yield('footer')
                </div>
                <div class="col-md-1"></div>
            </div>
            
        </div>
        
    </div>

    <!-- Scripts -->
    <script src="/js/app.js"></script>
    <script type="text/javascript">
    $.ajaxSetup({
        headers: {'X-CSRF-Token' : $('meta[name=csrf-token').attr('content')}
    });
    </script>
</body>
</html>
