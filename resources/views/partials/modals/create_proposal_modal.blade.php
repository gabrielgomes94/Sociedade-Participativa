<!-- Create Proposal Modal -->
<div id="create-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Adicionar Proposta</h4>
      </div>
      <form action="{{ URL::route('proposal.store', $question->id) }}" method="POST">      
        <input type="hidden" name="_token" value="{{ csrf_token() }}">
        
        <div class="modal-body">
          <!-- Proposal Text-Area -->
            <textarea rows="15" cols="75" class="proposal-textarea" name="content"></textarea>
        </div>
        <div class="modal-footer">          
          <input type="hidden" name="question_id" value="{{ $question->id }}">
          <input type="submit" class="btn btn-primary" value="Save changes"> 
          <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
        </div>
      </form>
    </div>

  </div>
</div>