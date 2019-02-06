$(document).on('turbolinks:load',function() {
  $(".menu li ul").hide();
  $(".menu li").hover(function() {
    $(">ul", this).stop(true, true).show();
    $(">a", this).addClass("active");
  },
  function() {
    $(">ul", this).stop(true, true).hide();
    $(">a", this).removeClass("active");
  });
});
