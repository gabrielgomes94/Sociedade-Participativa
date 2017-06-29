@extends('layouts.app')
@extends('menus.user_menu')
@section('header_title')


<body>        
    <!-- if there are creation errors, they will show here -->
@stop
@section('content')
	@foreach($results as $result)
		{{ ($result->name ) }} {{ ($result->lastname ) }}
		--- {{$result->id}}
		<br>
	@endforeach
@stop
@extends('footer.footer')

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
    	$(".btn").click(function(){
    		if($(this).children().attr("class") == "glyphicon glyphicon-chevron-up pull-right"){   	
    			var target = $(this).parent().parent().parent().attr("class");
    			target += '-box';
    			$("." + target).slideUp();
    			$(this).children().remove();	
    			$(this).append("<span class='glyphicon glyphicon-chevron-down pull-right'> </span>");
    		}
    		else if($(this).children().attr("class") == "glyphicon glyphicon-chevron-down pull-right"){   	
				var target = $(this).parent().parent().parent().attr("class");
    			target += '-box';
    			$("." + target).slideDown();
    			$(this).children().remove();	
    			$(this).append("<span class='glyphicon glyphicon-chevron-up pull-right'> </span>");
    		}
    	});
	});
</script>


<script type="text/javascript">
	$(document).ready(function(){
		$(".btn-edit-profile-specialties").click(function(){
			
		});
	});
</script>