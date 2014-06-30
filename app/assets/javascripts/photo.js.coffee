$(document).ready ->
  $(".js-add-photos").click ->
    $(".js-add-photos-input").click()

  $(".js-add-photos-input").fileupload(
    dataType: 'json', done: (e, data) ->
      file = data.result
      img = new Image()
      img.onload = ->
        $("<div class='col-sm-4 phxxs mtxs fade-xl js-admin-gallery-photo' data-url='/admin/photos/#{file.id}'><div class='relative'><img src='#{file.thumb}' class='img-responsive'/><div class='absolute top right mtxxxs mrxxxs pointer js-admin-gallery-photo-remove'><i class='fa fa-times fss c-red'></i></div></div></div>").prependTo($(".js-photos-uploaded")).animate({opacity: 1}, 1000)
      img.src = file.thumb;
    fail: (e, data) -> alert 'Upload failed'
  ).bind "fileuploadstart", (e, data) ->
    $progress = $("#progress")
    $progress.css({width: "1%"})
    $progress.removeClass("hide")
    $progress.animate({width: "80%"}, 12000)
  .bind "fileuploadstop", (e, data) ->
    $("#progress").stop().animate {width: "100%"}, 1000, ->
      $(@).addClass("hide")

  $("body").on "click", ".js-admin-gallery-photo-remove", ->
    $photo = $(@).closest(".js-admin-gallery-photo")

    $.ajax(
      type: "POST"
      url: $photo.data("url")
      dataType: "json"
      data:
        "_method": "delete"
      success: ->
        $photo.fadeOut()
    )

  $(".js-gallery-photo:first").addClass("active")

  $(".js-gallery-photo").click ->
    $(".js-gallery-photo.active").removeClass("active")
    $($(@).data("target")).find("img").attr("src", $(@).find("img").attr("src"))
    $(@).addClass("active")
