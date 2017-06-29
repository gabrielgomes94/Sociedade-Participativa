<div class="comment-reaction-buttons-label">
	<span class="glyphicon glyphicon-thumbs-up comment-thumbs-up"> 
		<div id="comment-upvotes-{!! $comment->id !!}">
			{{$comment->upvotes}} 
		</div>
	</span>
	<span class="glyphicon glyphicon-thumbs-down comment-thumbs-down">
		<div id="comment-downvotes-{!! $comment->id !!}">
			{{$comment->downvotes}}
		</div>
	</span>	
</div>