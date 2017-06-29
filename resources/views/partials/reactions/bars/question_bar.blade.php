<div class="progress reaction-bar">							
	<div class="progress-bar progress-bar-like" id="question-progress-bar-like-{{ $question->id }}" style="width: {{$question->rate_upvotes }}%">
	</div>
	<div class="progress-bar progress-bar-dislike" id="question-progress-bar-dislike-{{ $question->id }}" style="width: {{ $question->rate_downvotes}}%">	    	
	</div>
</div>