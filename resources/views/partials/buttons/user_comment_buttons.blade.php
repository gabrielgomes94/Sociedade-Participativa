@if($comment->author['id']!=Auth::user()->id)		
	<button type="button" class="btn btn-report" action="{{URL::route('comment.report', $comment->id)}}" method="post">
		<span class="glyphicon glyphicon-ban-circle"></span> 
	</button>		
@elseif($question->author['id']==Auth::user()->id)		
	<button type="button" class="btn btn-edit " action="{{URL::route('comment.edit', $comment->id)}}" method="post" data-id="{{ $comment->id }}">
		<span class="glyphicon glyphicon-pencil"> </span>
	</button>
	<button type="button" class="btn btn-delete" data-target="#delete-modal" data-toggle="modal" data-type="comment" data-id="{{ $comment->id }}">
		<span class="glyphicon glyphicon-trash"></span>
	</button>					
@endif	