// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

function calcula_valor_total(){
    let valor_total = 0;
    let valores = document.getElementsByClassName("valor")
    let quantidades = document.getElementsByClassName("quantidade")
    let valor_total_campo = document.getElementById("pedido_valor_total")
    for(var i = 0; i < valores.length; i++){
        
        valor_total += valores[i].outerText * quantidades[i].value
    }
    valor_total_campo.value = valor_total
}
