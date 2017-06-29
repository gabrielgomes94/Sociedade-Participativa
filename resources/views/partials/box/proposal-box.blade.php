<!-- Question-Proposals -->
		<br>
		<div class="proposals" data-value="proposal">
			<div class="row">
				<div class="proposals-title col-md-10 " > 
					<h2>Propostas</h2>
				</div>
				<div class="col-md-2">
					<button type="button" class="btn btn-hide-show proposals-hide-show-button pull-right" action="#" data-value="proposal">
						<span class="glyphicon glyphicon-chevron-up"> </span>
					</button>
				</div>
			</div>

			@foreach($proposals as $proposal)
			<!-- Question-Proposals-Proposal -->
			<div class="proposal-box proposal" data-value="{{$proposal->id}}">
				<!-- Question-Proposals-Proposal-Author -->
				<div class="proposal-author">
					<p class="text-justify"><i><b>por <a href="{{URL::route('user.show', $proposal->author['id']) }}">{{$proposal->author['name']}} {{$proposal->author['lastname']}} </a> às {{$proposal->post_date}}</b></i> </p>
				</div>
				<!-- Question-Proposals-Proposal-Content -->
				<div class="proposal-content">				
					<p class="text-justify">{!! $proposal->content !!}</p>
				</div>
				<!-- Question-Proposals-Proposal-Footer -->
				<div class="proposal-footer">	
					<div class="row">
						<!-- Question-Proposals-Proposal-Footer-Reaction -->
						<div class="proposal-footer-reaction col-md-2">
							@include('partials.reactions.buttons.proposal_bar_buttons')
						</div>	
						<!-- Question-Proposals-Proposal-Footer-Buttons -->
						<div class="proposal-footer-buttons col-md-10">						
							<div class="pull-right">
								@include('partials.buttons.user_proposal_buttons')							
							</div>
						</div>
					</div>
				</div>

				<!-- Question-Proposals-Proposal-Comments -->
				<div class="proposal-comments row" data-value="comment">
				@if(!$proposal->comments->isEmpty())					
						<div class="col-md-1"></div>
						<div class="col-md-11">
							<div class="row proposal-comments-header">
								<div class="col-md-10 proposal-comments-header-title">
									<h4>Comentários</h4>	
								</div>
								<div class="col-md-2 proposal-comments-header-hide-btn">
									<button type="button" class="btn btn-hide-show pull-right" action="#" data-value="proposal-comment">
										<span class="glyphicon glyphicon-chevron-up"> </span>
									</button>								
								</div>
							</div>
					@foreach($proposal->comments as $comment)
						<!-- Question-Proposals-Proposal-Comments-Comment-Box -->
						<div class="proposal-comments-box" data-value="{{$comment->id}}">
						<!-- Question-Proposals-Proposal-Comments-Comment -->
							<div class="proposal-comments-comment">								
								<!-- Question-Proposals-Proposal-Comments-Comment-Author -->
								<div class="proposal-comments-comment-header row">
									<div class="col-md-1 proposal-comments-comment-header-type">
										<div class="proposal-comments-comment-header-type-icon">
											<span class="glyphicon glyphicon-education"></span>
										</div>
									</div>
									<div class="col-md-10 proposal-comments-comment-author">
										<i><b><p class="text-justify">por 
											<a href="{{URL::route('user.show', $comment->author['id']) }}"> {{$comment->author['name']}} {{$comment->author['lastname']}} </a>  às {{$comment->post_date}}.</p>
										</b></i> 
									</div>									
								</div>
								<!-- Question-Proposals-Proposal-Comments-Comment-Content -->
								<div class="proposal-comments-comment-content">
									<p class="text-justify">{!! $comment->content !!}</p>								
								</div>						
								<!-- Question-Proposals-Proposal-Comments-Comment-Footer -->
								<div class="proposal-comments-comment-footer row">
									<!-- Question-Proposals-Proposal-Comments-Comment-Reaction -->
									<div class="col-md-6">
										<!-- Question-Proposals-Proposal-Comments-Comment-Reaction -->
										<div class="proposal-comments-comment-footer-reaction row">
											<!-- Question-Proposals-Proposal-Comments-Comment-Reaction-Bar-->
											<div class="proposal-comments-comment-footer-reaction-bar">
												@include('partials.reactions.bars.comment_bar')
											</div>
											<!-- Question-Proposals-Proposal-Comments-Comment-Reaction-Buttons -->
											<div class="proposal-comments-comment-footer-reaction-buttons">
												@include('partials.reactions.buttons.comment_bar_buttons')
											</div>														
										</div>
									</div>
									<div class="col-md-6">
										<!-- Question-Proposals-Proposal-Comments-Comment-Box-Footer-Buttons -->
										<div class="proposal-comments-comment-footer-buttons comment-buttons pull-right">
											@include('partials.buttons.user_comment_buttons')
										</div>
									</div>
								</div>
							</div>
						</div>
					@endforeach
					<!-- Formulário para inserção de comentários de questão -->
					<div class="row">							
						<div class="col-md-12">
							<div class="form-add-question-comment" data-type="question" data-value="">					
								<label>Escreva um comentário para a questão</label>
								<form action="{{ URL::route('comment.store') }}" method="post">
									<input type="hidden" name="_token" value="{{ csrf_token() }}">
									<input type='hidden' name='commentable_type' value='question'>
									<input type='hidden' name='commentable_id' value='{{ $question->id }}'>
									<!-- <input type='text' class='comment-text' placeholder='Escreva um comentário...'  name='content'> -->
									<div class="row">
										<div class="col-md-12 form-add-question-comment-options">
											<textarea rows="2" placeholder="Escreva um comentário..." name="content" class="form-add-question-comment-box pull-right"></textarea>
										</div>											
									</div>										
									<div class="row form-add-question-comment-options">											
										<div class="col-md-6">
											<div class="form-add-question-comment-type">
											<div class="form-add-question-comment-type-element">
													<label> Tipo de Comentário </label><br>
												</div>
												<div class="form-add-question-comment-type-element">
													<input type="radio" name="type" value="true" >
													<label for="type">Positivo</label><br>														
												</div>
												<div class="form-add-question-comment-type-element">
													<input type="radio" name="type" value="false">
													<label for="type">Negativo</label>
												</div>												
											</div>												
										</div>
										<div class="col-md-6 form-add-question-comment-submit">
											<input type='submit' class='btn btn-primary pull-right form-add-question-comment-submit' value='Enviar'>
										</div>											
									</div>																				
								</form>							
							</div>
						</div>							
					</div>
				</div>
			@endif
				</div>
				
		</div>
		@endforeach
	</div>