$(document).on('turbolinks:load',function() {
  $('.sell-item-price').bind('keydown keyup keypress change',function(){
    var putNumber = $(".sell-item-price").val();
    if ( putNumber >= 300 ) {
    var thisValue = $(this).val() * 0.1;
    console.log();
    $('.sell-item-carc-right').html(thisValue.toLocaleString('ja-JP', { style: 'currency', currency: 'JPY' }));
    var calcValue = $(this).val() * 0.9;
    $('.sell-item-ans-right').html(calcValue.toLocaleString('ja-JP', { style: 'currency', currency: 'JPY' }));
  } else if(putNumber <= 300) {
    $('.sell-item-carc-right').html("-");
    $('.sell-item-ans-right').html("-");
  }
  });
});

$(document).on('turbolinks:load',function() {
  $('.sell-image-dropbox')
    .mouseover(function(e) {
      $(this).css("cursor","pointer");
    })
    .mouseout(function(e) {
    });
});
