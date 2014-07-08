// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.ui.datepicker
//= require jquery.ui.sortable
//= require jquery_ujs
//= require jquery-fileupload/basic
//= require jquery.validate.min
//= require lazyload.min
//= require bootstrap
//= require photo
//= require_tree .

$(document).ready(function() {
  $(".js-datepicker").each(function() {
    $(this).datepicker({
      minDate: 1,
      altFormat: "yy/mm/dd",
      dateFormat: "mm/dd/yy",
      altField: $(this).next()
    });
  });

  $(".js-timepicker").each(function() {
    $(this).timepicker();
  });

  $("img.js-lazyload").lazyload({
    container: $("#photo-scroller"),
    threshold: 200
  });

  $(".js-slideshow").slidesjs({
    navigation: {
      active: false
    },
    pagination: {
      active: false
    },
    play: {
      active: false,
      effect: "slide",
      interval: 5000,
      auto: true
    }
  });

  $(".js-sortable").sortable({
    update: function (event, ui) {
      var data = $(this).sortable('serialize');
      var url = $(this).data("url");
      $.ajax({
        data: data,
        type: 'POST',
        url: url
      });
    }
  });
  $(".js-sortable").disableSelection();

  if((image_count = $(".js-slide-background-image").length) > 0) {
    var index = 0;
    $(".js-slide-background").css({backgroundImage: "url(" + $(".js-slide-background-image:eq(" + index + ")").attr("src") + ")"});
    $(".js-slide-background-fade").animate({opacity: 0});
    setInterval(function() {
      $(".js-slide-background-fade").stop().animate({opacity: 1}, 400, function() {
        if(index == image_count - 1) {
          index = 0;
        }
        else {
          index++;
        }
        $(".js-slide-background").css({backgroundImage: "url(" + $(".js-slide-background-image:eq(" + index + ")").attr("src") + ")"});
        $(this).stop().animate({opacity: 0}, 400);
      });
    }, 5000);
  }

  $(".js-use-billing-address").click(function() {
    $($(this).data("target")).toggle(!this.checked);
  });
  if ($(".js-use-billing-address").length > 0) {
    $($(".js-use-billing-address").data("target")).toggle(!$(".js-use-billing-address")[0].checked);
  }

  $(document).ready(function() {
    $('.js-lightbox').magnificPopup({type:'image'});
  });
});

$(window).load(function() {
  var $container = $('#masonry-container');
  // initialize
  $container.masonry({
    itemSelector: '.item'
  });
});
