<!-- Modal -->
<div id="delete-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Excluir Questão</h4>
      </div>
      <div class="modal-body">
        <p>Tem certeza de que deseja excluir?</p>
      </div>
      <div class="modal-footer">
        <form method="post" action="{{ URL::route('question.delete') }}">
          <input type="hidden" name="_token" value="{{ csrf_token() }}">
          <input type="hidden" name="_method" value="delete">

          <input type="hidden" name="id" value="{{ $question->id }}">
          <input type="submit" class="btn btn-primary" value="Save changes"> 
        </form>        
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>