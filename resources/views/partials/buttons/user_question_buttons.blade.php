@if($question->author['id']!=Auth::user()->id)
	<button type="button" class="btn btn-report" action="{{URL::route('question.report', $question->id)}}" method="post">
		 <span class="glyphicon glyphicon-ban-circle"></span> 
	</button>
@elseif($question->author['id']==Auth::user()->id)	
	<button type="button" class="btn btn-edit " action="{{URL::route('question.edit', $question->id)}}" method="post">  
			<span class="glyphicon glyphicon-pencil"> </span>
	</button>
	<button type="button" class="btn btn-delete " action="{{URL::route('question.delete')}}" method="delete" data-toggle="modal" data-target="#delete-modal" data-type="question" data-id="{{ $question->id }}">
		<span class="glyphicon glyphicon-trash"></span>
	</button>
@endif