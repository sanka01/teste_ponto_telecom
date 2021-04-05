# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

calcula_valor_total = ->
  valor_total = 0
  valores = document.getElementsByClassName('valor')
  quantidades = document.getElementsByClassName('valor')
  valor_total_campo = document.getElementById('pedido_valor_total')
  i = 0
  while i < valores.length
    valor_total += valores[i].value * quantidades[i].value
    i++
  valor_total_campo.value = valor_total
  return