$(function() {
  $('.send-signout-btn')
    .mouseover(function(e) {
      $(this).css("cursor","pointer");
    })
    .mouseout(function(e) {
    });
});

$(function(){
    $('.send-signout-btn').on('click', function(event){
    event.preventDefault();
        $(this).toggleClass('active');
    });
});
