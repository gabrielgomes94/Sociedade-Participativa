<!-- Question-Proposals -->
		<br>
		<div class="proposals box" data-value="proposal">
			<div class="row">
				<div class="proposals-title col-md-10 " > 
					<h2>Propostas</h2>
				</div>
				<div class="col-md-2">
					<button type="button" class="btn btn-hide-show proposals-hide-show-button pull-right" action="#">
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
					<div class="row">
						<div class="add-comment" data-type="question" data-value="">
							<a class="cu">Adicionar um comentário</a>
							<form action="{{ URL::route('comment.store') }}" method="post">
								<div class='form-group'>
								<input type="hidden" name="_token" value="{{ csrf_token() }}">
									<input type='text' class='form-control' placeholder='Escreva um comentário...' name='content'>
									<input type='hidden' name='commentable_type' value='proposal'>
									<input type='hidden' name='commentable_id' value='{{ $proposal->id }}'>
									<input type='submit' class='btn btn-primary' value='Enviar'></div>
							</form>				

				<!-- Question-Proposals-Proposal-Comments -->
				@if(!$proposal->comments->isEmpty())
				<div class="comments row box" data-value="comment">
					<div class="col-md-1"></div>
					<div class="col-md-11">
						<div class="row">
							<div class="col-md-10">
								<h4>Comentários</h4>	
							</div>
							<div class="col-md-2">
								<button type="button" class="btn btn-hide-show pull-right" action="#">
									<span class="glyphicon glyphicon-chevron-up"> </span>
								</button>								
							</div>
						</div>
					@foreach($proposal->comments as $comment)
						<!-- Question-Proposals-Proposal-Comments-Comment-Box -->
						<div class="comment-box" data-value="{{$comment->id}}">
						<!-- Question-Proposals-Proposal-Comments-Comment -->
							<div class="comments-comment">
								<div class="comments-comment">
									<!-- Question-Proposals-Proposal-Comments-Comment-Author -->
									<div class="comments-comment-author">
										<i><b><p class="text-justify">por 
											<a href="{{URL::route('user.show', $comment->author['id']) }}"> {{$comment->author['name']}} {{$comment->author['lastname']}} </a>  às {{$comment->post_date}}.</p>
										</b></i> 
									</div>
									<!-- Question-Proposals-Proposal-Comments-Comment-Content -->
									<div class="comments-comment-content">
										<p class="text-justify">{!! $comment->content !!}</p>								
									</div>						
									<!-- Question-Proposals-Proposal-Comments-Comment-Footer -->
									<div class="comments-comment-footer row">
											<!-- Question-Proposals-Proposal-Comments-Comment-Reaction -->
											<div class="comments-comment-box-footer-reactions">
												<div class="row">
													<div class="col-md-6">
														<!-- Question-Proposals-Proposal-Comments-Comment-Reaction -->
														<div class="comments-comment-box-footer-reactions pull-left row">
															<!-- Question-Proposals-Proposal-Comments-Comment-Reaction-Buttons -->
															<div class="comment-reaction-buttons">
																@include('partials.reactions.buttons.comment_bar_buttons')
															</div>
															<!-- Question-Proposals-Proposal-Comments-Comment-Reaction-Bar-->
															<div class="comment-reaction-bar">
																@include('partials.reactions.bars.comment_bar')
															</div>
														</div>
													</div>
													<div class="col-md-6">
														<!-- Question-Proposals-Proposal-Comments-Comment-Box-Footer-Buttons -->
														<div class="comments-comment-footer-buttons comment-buttons pull-right">
															@include('partials.buttons.user_comment_buttons')
														</div>
													</div>		
												</div>
											</div>																				
									</div>
								</div>
							</div>
						</div>
					@endforeach
				</div>
				<hr>
			</div>
			@endif
		</div>
		@endforeach
	</div>