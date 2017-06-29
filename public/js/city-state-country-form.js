$(document).ready(function () {
        $.getJSON("/js/json/estados_cidades.json" , function (data) {
            var items = [];
            var options = '';    
            $.each(data, function (key, val) {                    
                options += '<option value="' + val.nome + '">' + val.nome + '</option>'; });                 
            $("#state").html(options);                
            $("#state").change(function () {              
                var options_cidades = '';
                var str = "";                   
                $("#state option:selected").each(function () {
                    str += $(this).text();
                });                
                $.each(data, function (key, val) {
                    if(val.nome == str) {                           
                        $.each(val.cidades, function (key_city, val_city) {                                
                            options_cidades += '<option value="' + val_city + '">' + val_city + '</option>';
                                });                         
                    }
                });
                $("#city").html(options_cidades);                    
            }).change();        
    }); 
});