$(document).ready ->
  if $(".js-credit-card-number").length
    $creditCardNumber = $(".js-credit-card-number")
    $creditCardNumber.payment("formatCardNumber");
    $creditCardCVC = $(".js-credit-card-security-code")
    $creditCardCVC.payment("formatCardCVC");

    $.validator.addMethod "creditCardNumber", (value, element, params) ->
      $.payment.validateCardNumber(value)
    , $.validator.format("Please enter a valid credit card number.")

    $.validator.addMethod "creditCardCVC", (value, element, params) ->
      $.payment.validateCardCVC($creditCardCVC.val(), $.payment.cardType($creditCardNumber.val()))
    , $.validator.format("Please enter a valid security code.")

    $(".js-order-create").validate
      rules:
        "order[credit_card_number]":
          creditCardNumber: true
        "order[credit_card_security_code]":
          creditCardCVC: true
