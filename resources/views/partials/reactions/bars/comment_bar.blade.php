
<div class="progress reaction-bar">					
	<div class="progress-bar progress-bar-like" id="comment-progress-bar-like-{{ $comment->id }}" style="width: {{$comment->rate_upvotes }}%">
	</div>
	<div class="progress-bar progress-bar-dislike" id="comment-progress-bar-dislike-{{ $comment->id }}" style="width: {{ $comment->rate_downvotes}}%">	    	
	</div>
</div>						