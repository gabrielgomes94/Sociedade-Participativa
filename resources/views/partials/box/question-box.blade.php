<!-- Question -->
<div class="question box" data-value="question">
	<div class="row">
		<!-- Question-Header -->
		<div class="question-header" >
			<div class="col-md-10">
				<!-- Question-Header-Title -->
				<h2 class="question-header-title">{{$question->title}}</h2>
				<p>por <a href="{{URL::route('user.show', $question->author['id']) }}">{{$question->author['name']}} {{$question->author['lastname']}}</a> às {{$question->created_at}} </p>
			</div>
			<div class="col-md-2">					
				<button type="button" class="btn btn-hide-show question-header-hide-show-button pull-right" action="#" data-value="question">
					<span class="glyphicon glyphicon-chevron-up"> </span>
				</button>										
			</div>
		</div>
	</div>
	<div class="row">
		<!-- Question-Box -->
		<div class="question-box" data-value="{{ $question->id }}">
			<div class="col-md-12">
				<!-- Question-Content -->
				<div class="question-content">
					<p class="text-justify">{!! $question->content !!}</p>
				</div>
				<!-- Question-Footer -->					
				<div class=" question-footer">
					<div class="row question-footer-btns">
						<div class="col-md-5">
							<!-- Question-Footer-Reaction -->
							<div class="question-footer-reaction row ">
								<!-- Question-Footer-Reaction-Bar -->
								<div class="question-footer-reaction-bar">
									@include('partials.reactions.bars.question_bar')
								</div>
								<!-- Question-Footer-Reaction-Buttons -->
								<div class="question-footer-reaction-button">
									@include('partials.reactions.buttons.question_bar_buttons')
								</div>										
							</div>
						</div>
						<div class="col-md-2">
							<div class="row">
								<!-- Trigger the modal with a button -->
								<button type="button" class="btn btn-info btn-add-proposal pull-right" data-toggle="modal" data-target="#create-modal">Escrever Proposta</button>							
							</div>
						</div>
						<div class="col-md-5" >
							<div class="question-footer-right pull-right row">
								<!-- Question-Footer-Location -->
								<div class="question-footer-right-location text-right">
									<p> em Varginha, Minas Gerais, Brasil </p>
								</div>
								<!-- Question-Footer-Buttons -->
								<div class="question-footer-right-buttons pull-right">
									@include('partials.buttons.user_question_buttons')
								</div>									
							</div>									
						</div>
					</div>																	
				</div>										
			<!-- Question-Comments -->
			<div class="question-comments row" >
				<div class="col-md-1"></div>
				<div class="col-md-11 ">								
					<div class="row question-comments-header">
						<div class="col-md-10 question-comments-header-title">							
							<p>Comentários</p>
						</div>
						<div class="col-md-2 question-comments-header-hide-btn">
							<button type="button" class="btn btn-hide-show pull-right" action="#" data-value="question-comments">
								<span class="glyphicon glyphicon-chevron-up" > </span>
							</button>								
						</div>
					</div>
					@foreach($question->comments as $comment)
						<div class="question-comments-box" data-value="{{ $comment->id }}">
							<!-- Question-Comments-Comment -->
							<div class="question-comments-comment">						
								<!-- Question-Comments-Comment-Author -->									
								<div class="question-comments-comment-header">
									<div class="col-md-1 question-comments-comment-header-type">
											<div class="question-comments-comment-header-type-icon">
												<span class="glyphicon glyphicon-education"></span>
											</div>
									</div>
									<div class="question-comments-comment-author">
										<i><b><p class="text-justify">por 
											<a href="{{URL::route('user.show', $comment->author['id']) }}"> {{$comment->author['name']}} {{$comment->author['lastname']}} </a>  às {{$comment->post_date}}.</p>
										</b></i> 
									</div>
									
								</div>
								<!-- Question-Comments-Comment-Box-Content -->
								<div class="row question-comments-comment-content">
									<div class="question-comments-comment-content-text">
											<p class="text-justify"> {!! $comment->content !!}</p>		
										</div>
									<div class="col-md-12"></div>
								</div>									
								<!-- Question-Comments-Comment-Box-Footer -->
								<div class="question-comments-comment-footer row">
									<div class="col-md-6">
										<!-- Question-Comments-Comment-Footer-Reaction -->
										<div class="question-comments-comment-footer-reaction row ">
											<!-- Question-Footer-Reaction-Bar -->
											<div class="question-comments-comment-footer-reaction-bar">
												@include('partials.reactions.bars.comment_bar')
											</div>
											<!-- Question-Footer-Reaction-Buttons -->
											<div class="question-comments-comment-footer-reaction-button">
												@include('partials.reactions.buttons.comment_bar_buttons')
											</div>										
										</div>
									</div>
									<div class="col-md-6">
										<div class="question-footer-right-location text-right">
											<p> em Varginha, Minas Gerais, Brasil </p>
										</div>
										<!-- Question-Comments-Comment-Box-Footer-Buttons -->
										<div class="question-comments-comment-footer-buttons comment-buttons pull-right">
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
				</div>
			</div>
		</div>
	</div>
							
</div>
