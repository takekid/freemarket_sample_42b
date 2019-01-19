$(document).on('turbolinks:load',function() {
  $('.send-signout-btn')
    .mouseover(function() {
      $(this).css("cursor","pointer");
    })
    .mouseout(function() {
    });
});

$(document).on('turbolinks:load',function(){
  $('.send-signout-btn').on('click', function(event){
    event.preventDefault();
      $(this).toggleClass('active');
    });
});
