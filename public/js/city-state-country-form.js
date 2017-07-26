$(document).ready(function () {
    $.getJSON("/js/json/estados_cidades.json" , function (data) {
        var items = [];
        var options = '';    
        $.each(data, function(key, val){                    
            options += '<option value="' + val.nome + '">' + val.nome + '</option>'; 
        });                 
        $("#state").html(options);                
        $("#state").change(function(){       
            
            var options_cities = '';
            var str = "";                   
            $("#state option:selected").each(function () {
                    str += $(this).text();
            });
            $.each(data, function (key, val) {
                if(val.nome == str) {                           
                    $.each(val.cidades, function (key_city, val_city) {                                
                        options_cities += '<option value="' + val_city + '">' + val_city + '</option>';
                    });                         
                }
            });
            $("#city").html(options_cities);                    
        });  

        $("#city").change(function(){
            console.log('mudou');
            var options_districts = "";
            var str = "";
            var city = $("#city option:selected").text();            
            console.log(city);
            $.getJSON("/js/json/bairros.json", function(data){
                console.log('pegou json');
                $.each(data, function(key, val){
                    console.log('loop externo - ' + key + '| valor: ' + val);
                    console.log(val.cidade);
                    if(city == val.cidade){
                        console.log(val.cidade)
                        $.each(val.bairros, function(key_district, val_district){
                            console.log('loop interno: ' + val_district);
                            options_districts += '<option value="' + val_district + '">' + val_district + '</option>';
                        });

                    }
                });
                if(options_districts == ""){
                    options_districts += '<option value=""> Indisponível para este município </option>';
                }

                $("#district").html(options_districts);
            });
            
        });
    }); 
});