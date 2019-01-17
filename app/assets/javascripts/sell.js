$(function() {
  $('.sell-item-price').bind('keydown keyup keypress change',function(){
    var putNumber = $(".sell-item-price").val();
    if ( putNumber >= 300 ) {
    var thisValue = $(this).val() * 0.1;
    $('.sell-item-carc-right').html("¥" + Math.round(thisValue));
    var calcValue = $(this).val() * 0.9;
    $('.sell-item-ans-right').html("¥" + Math.round(calcValue));
  } else if(putNumber <= 300) {
    $('.sell-item-carc-right').html("-");
    $('.sell-item-ans-right').html("-");
  }
  });
});

$(function() {
  $('.sell-image-dropbox')
    .mouseover(function(e) {
      $(this).css("cursor","pointer");
    })
    .mouseout(function(e) {
    });
});
