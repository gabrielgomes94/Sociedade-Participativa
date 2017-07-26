<!-- Create Proposal Modal -->
<div id="edit-proposal-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Editar Proposta</h4>
      </div>      
      <form action="{{ URL::route('proposal.update', $question->id) }}" method="POST">      
        <input type="hidden" name="_token" value="{{ csrf_token() }}">
        <input type="hidden" name="_method" value="put">
        
        <div class="modal-body">
          <!-- Proposal Text-Area -->
            <textarea rows="15" cols="50" class="proposal-textarea" name="content">dasd</textarea>
        </div>
        <div class="modal-footer">          
          <input type="hidden" name="question_id" value="{{ $question->id }}">
          <input type="submit" class="btn btn-primary" value="Salvar alterações"> 
          <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
        </div>
      </form>
    </div>

  </div>
</div>