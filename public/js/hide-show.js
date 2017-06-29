$(document).ready(function(){
    	$(".btn-hide-show").click(function(){                        
            var target = $(this);
            var type = target.data("value");
    		if($(this).children().attr("class") == "glyphicon glyphicon-chevron-up"){   	                                                                
                var classTarget = type + '-box';
                $('.' + classTarget).slideUp();
    			$(this).children().remove();	
    			$(this).append("<span class='glyphicon glyphicon-chevron-down'> </span>");
    		}
    		else if($(this).children().attr("class") == "glyphicon glyphicon-chevron-down"){   	                                
                var classTarget = type + '-box';
    			$("." + classTarget).slideDown();
    			$(this).children().remove();	
    			$(this).append("<span class='glyphicon glyphicon-chevron-up'> </span>");
    		}
    	});
	});