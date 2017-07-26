<!--Question Solution -->
<br>

<div class="solution">
	<h3>Solução</h3>
	@if($question->solution!=null)
	<br>{{ $question->solution->content }}
	@else
	<br>Ainda não existe uma solução para esta questão
	@endif
</div>