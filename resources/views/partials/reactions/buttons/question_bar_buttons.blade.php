<div class="reaction-box-label">
	<span class="glyphicon glyphicon-thumbs-up question-thumbs-up">
		<div id="question-upvotes-{!! $question->id !!}">
			{{$question->upvotes}} 
		</div>
	</span>
	<span class="glyphicon glyphicon-thumbs-down question-thumbs-down">
		<div id="question-downvotes-{!! $question->id !!}">
			{{$question->downvotes}}
		</div>
	</span>	
</div>