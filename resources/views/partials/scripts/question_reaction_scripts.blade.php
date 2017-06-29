<script type="text/javascript">
$(document).ready(function(){

  /**
   * questions Scripts
   * 
   * @type {String}
   */
  var srcQuestionInsertReaction = "{!! URL::route('question.insertReaction') !!}";
  var srcQuestionReadReaction = "{!! URL::route('question.readReaction') !!}";
  var srcQuestionUpdateReaction = "{!! URL::route('question.updateReaction') !!}";
  var srcQuestionReadReactionCounting = "{!! URL::route('question.readReactionCounting') !!}";  

  $('.question-box').each(function(){
    var element = $(this);
    var questionID = element.data("value");
    $.get(srcQuestionReadReaction, { question_id : questionID }, function(data){
      if(data==true){
        element.find(".question-thumbs-up").css("color","#fff").css("background-color", "#006400");
      } else {
        element.find(".question-thumbs-down").css("color","#fff").css("background-color","#8B0000");
      }
    });
  });
  

  $('.question-thumbs-up').click(function (){    
    $(this).next().css("color","#fff").css("background-color", "#B22222");
    $(this).css("color","#fff").css("background-color", "#006400");
    var questionID = $(this).parents('.question-box').data("value");    
    var reaction = -1;
    $.get(srcQuestionReadReaction, { question_id : questionID }, function(data){
      if(data==-1){
        $.ajax({
          headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    },
          url: srcQuestionInsertReaction,
          dataType: "json",
          type: "POST",
          data: {
            reaction: true,
            question_id: questionID         
          }, 
          success: function(data){                    
          },
          error: function(){          
          }
        });

      } else{
        if(data==false){
          $.ajax({
            headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    },
          url: srcQuestionUpdateReaction,
          dataType: "json",
          type: "PUT",
          data: {
            reaction: true,
            question_id: questionID
          },
          success: function(data){          
          },
          error: function(){
          }     
          }); 
        }
      }
      $.get(srcQuestionReadReactionCounting, { question_id : questionID }, function(data){
          $('#question-downvotes-' + questionID).html(data[0]);    
          $('#question-upvotes-' + questionID).html(data[1]);
          $('#question-progress-bar-like-'+questionID).width(data[2]+'%');
          $('#question-progress-bar-dislike-'+questionID).width(data[3]+'%');
  		});        
    });
  });

  $('.question-thumbs-down').click(function (){    
    $(this).prev().css("color","#fff").css("background-color", "#008B00");
    $(this).css("color","#fff").css("background-color", "#8B0000");
    var questionID = $(this).parents('.question-box').data("value");
    var reaction = -1;
    $.get(srcQuestionReadReaction, { question_id : questionID }, function(data){           
      if(data==-1){
        $.ajax({
          headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    },
          url: srcQuestionInsertReaction,
          dataType: "json",
          type: "POST",
          data: {
            reaction: false,
            question_id: questionID         
          }, 
          success: function(data){        
          },
          error: function(){          
          }
        });         
         
      } else {
        if(data==true){
          $.ajax({
            headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    },
            url: srcQuestionUpdateReaction,
            dataType: "json",
            type: "PUT",
            data: {
              reaction: false,
              question_id: questionID
            },
            success: function(data){
            },
            error: function(){
            }     
          }); 
        } 
      } 
      $.get(srcQuestionReadReactionCounting, { question_id : questionID }, function(data){
          $('#question-downvotes-' + questionID).html(data[0]);    
          $('#question-upvotes-' + questionID).html(data[1]);
          $('#question-progress-bar-like-'+questionID).width(data[2]+'%');
          $('#question-progress-bar-dislike-'+questionID).width(data[3]+'%');
  		});
      //updatequestionProgressBar(questionID);          
    });
    
  });
});

function updateQuestionProgressBar(questionID){
  $.get(srcQuestionReadReactionCounting, { question_id : questionID }, function(data){
          $('#question-downvotes-' + questionID).html(data[0]);    
          $('#question-upvotes-' + questionID).html(data[1]);
          $('#question-progress-bar-like-'+questionID).width(data[2]+'%');
          $('#question-progress-bar-dislike-'+questionID).width(data[3]+'%');
  });
}
</script>