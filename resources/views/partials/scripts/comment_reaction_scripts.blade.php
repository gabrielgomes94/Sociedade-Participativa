<script type="text/javascript">
$(document).ready(function(){
  /**
   * Comments Scripts
   * 
   * @type {String}
   */
  var srcCommentInsertReaction = "{!! URL::route('comment.insertReaction') !!}";
  var srcCommentReadReaction = "{!! URL::route('comment.readReaction') !!}";
  var srcCommentUpdateReaction = "{!! URL::route('comment.updateReaction') !!}";
  var srcCommentReadReactionCounting = "{!! URL::route('comment.readReactionCounting') !!}";  

  $('.comment-box').each( function(){
    var element = $(this);
    var commentID = $(this).data("value");    
    $.get(srcCommentReadReaction, { comment_id : commentID }, function(data){      
      if(data==true){        
        element.find(".comment-thumbs-up").css("color","#fff").css("background-color", "#006400");
      } else if(data==false){
        element.find(".comment-thumbs-down").css("color","#fff").css("background-color", "#8B0000");
      }
    });
  });

  $('.comment-thumbs-up').click(function (){    
    $(this).next().css("color","#fff").css("background-color", "#B22222");
    $(this).css("color","#fff").css("background-color", "#006400");
    var commentID = $(this).parents('.comment-box').data("value");
    console.log(commentID);
    var reaction = -1;
    $.get(srcCommentReadReaction, { comment_id : commentID }, function(data){
      if(data==-1){
        $.ajax({
          headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
          },
          url: srcCommentInsertReaction,
          dataType: "json",
          type: "POST",
          data: {
            reaction: true,
            comment_id: commentID         
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
          url: srcCommentUpdateReaction,
          dataType: "json",
          type: "PUT",
          data: {
            reaction: true,
            comment_id: commentID
          },
          success: function(data){          
          },
          error: function(){
          }     
          }); 
        }
      }
      $.get(srcCommentReadReactionCounting, { comment_id : commentID }, function(data){
          $('#comment-downvotes-' + commentID).html(data[0]);    
          $('#comment-upvotes-' + commentID).html(data[1]);
          $('#comment-progress-bar-like-'+commentID).width(data[2]+'%');
          $('#comment-progress-bar-dislike-'+commentID).width(data[3]+'%');
  		});        
    });
  });

  $('.comment-thumbs-down').click(function (){
    $(this).prev().css("color","#fff").css("background-color", "#008B00");
    $(this).css("color","#fff").css("background-color", "#8B0000");    
    var commentID = $(this).parents('.comment-box').data("value");
    var reaction = -1;
    $.get(srcCommentReadReaction, { comment_id : commentID }, function(data){           
      if(data==-1){
        $.ajax({
          headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
          },
          url: srcCommentInsertReaction,
          dataType: "json",
          type: "POST",
          data: {
            reaction: false,
            comment_id: commentID         
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
            url: srcCommentUpdateReaction,
            dataType: "json",
            type: "PUT",
            data: {
              reaction: false,
              comment_id: commentID
            },
            success: function(data){
            },
            error: function(){
            }     
          }); 
        } 
      } 
      $.get(srcCommentReadReactionCounting, { comment_id : commentID }, function(data){
          $('#comment-downvotes-' + commentID).html(data[0]);    
          $('#comment-upvotes-' + commentID).html(data[1]);
          $('#comment-progress-bar-like-'+commentID).width(data[2]+'%');
          $('#comment-progress-bar-dislike-'+commentID).width(data[3]+'%');
  		});
      //updateCommentProgressBar(commentID);          
    });
    
  });
});

function updateCommentProgressBar(commentID){
  $.get(srcCommentReadReactionCounting, { comment_id : commentID }, function(data){
          $('#comment-downvotes-' + commentID).html(data[0]);    
          $('#comment-upvotes-' + commentID).html(data[1]);
          $('#comment-progress-bar-like-'+commentID).width(data[2]+'%');
          $('#comment-progress-bar-dislike-'+commentID).width(data[3]+'%');
  });
}
</script>