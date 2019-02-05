$(document).on('turbolinks:load',function(){
  $('#pare select[id="item_shippingfee"]').change(function() {
    if ($('select[id="item_shippingfee"] option:selected').val() == '送料込み(出品者負担)','着払い(購入者負担)')
      $('#chi').css('display','block');
    else
      $('#chi').css('display','none');
  });

  $('.grandson').change(function() {
    if ($('.grandson').val() >= 63 && $('.grandson').val() <= 66){
      $('#shoes').css('display','block');
      $('#clothes').css('display', 'none');
      $('#shoes').insertAfter('#clothes');

    }else if ($('.grandson').val() >= 112 && $('.grandson').val() <= 117){
      $('#shoes').css('display','block');
      $('#clothes').css('display', 'none');
      $('#shoes').insertAfter('#clothes');

    }else{
      $('#shoes').css('display','none');
      $('#clothes').css('display', 'block');
      $('#clothes').insertAfter('#shoes');
    }
  });
  $('.child').change(function(){
    $('#shoes').css('display', 'none');
    $('#clothes').css('display', 'none');
  });

});
