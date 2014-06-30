$(document).ready ->
  calculateTotlePrice = ->
    total = 0.0
    $(".js-event-purchase option:selected").each ->
      total += parseFloat($(@).data("price"))
    $(".js-event-purchase-total").html(total.toFixed(2))

  calculateTotlePrice()

  $(".js-event-purchase").change ->
    calculateTotlePrice()
