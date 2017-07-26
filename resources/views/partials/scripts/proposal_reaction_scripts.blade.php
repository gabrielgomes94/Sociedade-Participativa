<script type="text/javascript">
$(document).ready(function(){
	//Definição de variáveis
	
  var srcProposalInsertReaction = "{!! URL::route('proposal.insertReaction', $question->id) !!}";  
  var srcProposalReadAvgReactions = "{!! URL::route('proposal.getAvgReactions', $question->id) !!}";  
	var srcProposalReadReaction = "{!! URL::route('proposal.readReaction', $question->id) !!}";
  var srcProposalUpdateReaction = "{!! URL::route('proposal.updateReaction', $question->id) !!}";
	
	var j = {!! json_encode($proposals) !!};					
	defaultColorStars(j);

	$(".star").hover(
		function (){
			var element = $(this).parents('.reaction-proposal-box-label');
			var rat = $(this).attr("value");	
	    var rat = $(this).data("value");
			colorStars(element, rat);					
		}, 
		function(){
			var element = $(this).parents('.reaction-proposal-box-label');
	    var proposalID = $(this).parents('.proposal-box').data("value"); 
			$.get(srcProposalReadReaction, { proposal_id : proposalID }, function(data){			
				var rat = data;
				//alert(rat);
				colorStars(element, rat);					
			});
		});

	$(".star").click(function (){
		var element = $(this).parents('.reaction-proposal-box-label');			
    	var rat = $(this).data("value");      
    	var proposalID = $(this).parents('.proposal-box').data("value");    
    	console.log(proposalID);
		//var collection = {!! json_encode($proposals) !!};		
		$.get(srcProposalReadReaction, {proposal_id : proposalID}, function(data){						
			if(data!=-1){
				//Requisição PUT para atualizar a reação
				$.ajax({
					headers: {
		            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
		          },
					url: srcProposalUpdateReaction,
					dataType: "json",
					type: "PUT",
					data: {
						rating: rat,
						proposal_id: proposalID
					},
					success: function(data){
						colorStars(element, rat);					
						
					},
					error: function(){
					}			
				});
			} else {
				//Requisição POST para inserir a reação
				$.ajax({
					headers: {
            'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
          },
					url: srcProposalInsertReaction,
					dataType: "json",
					type: "POST",
					data: {
						rating: rat,
						proposal_id: proposalID
					}, 
					success: function(data){
						colorStars(element, rat);
						response(data);					
					},
					error: function(){					
					}
				});
			}
			$.get(srcProposalReadAvgReactions, { proposal_id : proposalID }, function(data){				
				$('#proposal-' + proposalID).find(".proposal-rate").html(data);	
			});	
		});					
	});
});


function defaultColorStars(j){
  for(var i=0; i<"{!! $proposals->count() !!}"; i++){       
    var a = j[i].id;
    //alert(a);
    var proposalUserRate = j[i].user_rate;    
    var element = $("#proposal-"+j[i].id);
    console.log(element);
    if(proposalUserRate!=null){
      colorStars(element, proposalUserRate);
    }
  }
}

function colorStars(elem, rating){
	for(var i=1; i<=5; i++){
		elem.children().children('.proposal-rating-stars').children('.'+i).css({"color":"#111"});	
	}
	for(var i=1; i<=rating; i++){
		elem.children().children('.proposal-rating-stars').children('.'+i).css({"color":"#CD6600"});
	}
}

function userRate(collection, id){	
	for(var i=0; i<collection.length; i++){				
		if(collection[i].id == id){
			return collection[i].user_rate;
		}
	}	
	return null;
}
</script>