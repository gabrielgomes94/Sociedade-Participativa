<!-- Create Proposal Modal -->
<div id="create-modal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Adicionar Proposta</h4>
      </div>
      <div class="modal-body">
        <!-- Proposal Text-Area -->
        <form action="{{ URL::route('proposal.store') }}" method="POST">      
          <textarea rows="15" cols="75" class="proposal-textarea"></textarea>
          <input type="hidden" name="question_id" value="{{ $question->id}}">
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary btn-create-proposal">Salvar Propostas</button>
        <button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
      </div>
    </div>

  </div>
</div>