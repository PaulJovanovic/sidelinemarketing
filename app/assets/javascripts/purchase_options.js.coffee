$(document).ready ->
  $(".js-purchase-option:last").addClass("active")
  quantity = $(".js-purchase-option").length
  $("#add-purchase-option").click ->
    quantity++
    $(".js-purchase-option.active").removeClass("active")
    $("#purchase-options").append """
      <tr class="js-purchase-option active">
        <td class="prs ptxxxs">
          #{quantity}
          <input id="event_purchase_options_attributes_#{quantity - 1}_quantity" name="event_purchase[options_attributes][#{quantity - 1}][quantity]" type="hidden" value="#{quantity}">
        </td>
        <td class="ptxxxs">
          <table class="full-width">
            <tr>
              <td class="prxxxs">
                $
              </td>
              <td>
                <input class="paxxxs bss bwas bc-12 full-width" id="event_purchase_options_attributes_#{quantity - 1}_price" name="event_purchase[options_attributes][#{quantity - 1}][price]" placeholder="Price" type="text">
              </td>
            </tr>
          </table>
        </td>
        <td class="ptxxxs pls pointer fade-xl fade-n-active js-purchase-option-delete">
          <i class="fa fa-times"></i>
        </td>
      </tr>
    """
  $("body").on "click", ".js-purchase-option.active .js-purchase-option-delete", ->
    $purchaseOption = $(@).closest(".js-purchase-option")
    removePurchaseOption = ->
      quantity--
      $("#event_purchase_options_attributes_#{quantity}_id").remove()
      $purchaseOption.remove()
      $(".js-purchase-option:last").addClass("active")

    if $purchaseOption.data("url")?.length
      $.ajax(
        type: "POST"
        url: $purchaseOption.data("url")
        dataType: "json"
        data:
          "_method": "delete"
        success: ->
          removePurchaseOption()
      )
    else
      removePurchaseOption()
