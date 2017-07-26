@if($proposal->author['id']!=Auth::user()->id)
	<button type="button" class="btn btn-report" action="{{URL::route('proposal.report', $proposal->id)}}" method="post">
		<span class="glyphicon glyphicon-ban-circle"></span> 
	</button>
@elseif($proposal->author['id']==Auth::user()->id)
	<button type="button" class="btn btn-edit "  data-type="proposal" data-id="{{ $proposal->id }}">
		<span class="glyphicon glyphicon-pencil"> </span>
	</button>
	<button type="button" class="btn btn-delete" data-toggle="modal" data-target="#delete-proposal-modal"  data-type="proposal" data-id="{{ $proposal->id }}">
		<span class="glyphicon glyphicon-trash"></span>		
	</button>
@endif