<!--
	TODO: 
		1) radiobuttons para ordenar as questões
		2) select list para selecionar as cidades
 !-->


<div class="questions-filter-box box" data-value="filter">
	<!-- Título -->
	<div class="row">
		<div class="col-md-10">
			<h2 class="profile-specs-title">Filtro Avançado</h2>
		</div>			
		<div class="col-md-2">
			<button type="button" class="btn btn-hide-show pull-right" action="#">
				<span class="glyphicon glyphicon-chevron-down pull-right"> </span>
			</button>
		</div>
	</div>

	<!-- Corpo -->
	<div class="filter-box">
		<div class="row">
			<form action="{{ URL::route('question.sort') }}" method="POST">
				{{ csrf_field() }}
				<div class="col-md-12">
					<h3>Ordenar por</h3>				
					<input type="radio" name="sort_option" value="date" checked> Data		
					<input type="radio" name="sort_option" value="votes"> Votos			
					<input type="radio" name="sort_option" value="comments-number"> Número de Comentários
					<div class="panel-body row form-group">
		      	<div class="col-md-3">
		        	<label for="title">Selecionar País:</label>
		        	<select id="country" name="country" class="form-control location-combo-box">
		          	<option value="Brasil">Brasil </option>
		        	</select>                                
		      	</div>
		      	<div class="col-md-3">
		        	<label for="title">Selecionar Estado:</label>
		          <select name="state" id="state" class="form-control location-combo-box">
		            <option value="{{ Auth::user()->state}}"> {{Auth::user()->state}} </option>
		          </select>
		      	</div>         
		      	<div class="col-md-3">
		        	<label for="title">Selecionar Cidade:</label>
		          	<select name="city" id="city" class="form-control location-combo-box">
		            	<option value="{{Auth::user()->city}}"> {{Auth::user()->city}} </option>
		          	</select>
	        	</div>
	        	<div class="col-md-3">
		        	<label for="title">Selecionar Bairro:</label>
		          	<select name="district" id="district" class="form-control location-combo-box">
		            	<option value="{{Auth::user()->district}}"> {{Auth::user()->district}} </option>
		          	</select>
	        	</div>
		    	</div>
		    	<div class="row panel-group">
		    		<div class="col-md-12">
			    		<h3>Categorias</h3>
			    		@foreach($categories as $category)
			    			<div class="col-md-3">
			    				<input type="checkbox" name="category[]" value="{{$category->id}}" checked> {{$category->name}}
			    			</div>
			    		@endforeach
		    		</div>
		    	</div>
					<input type="submit" class="form-control pull-right">
				</div>
	 		</form>
		</div>
	</div>
</div>

	
<hr>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="{{ URL::asset('js/city-state-country-form.js') }}"></script>   
<!-- <script src="{{ URL::asset('js/hide-show.js') }}"></script>    -->
<script type="text/javascript">
	$(document).ready(function(){
		//$('.filter-box').hide();
	});
</script>