$(document).on('turbolinks:load',function(){

    $('#pare select[id="item_shippingfee"]').change(function() {
    if ($('select[id="item_shippingfee"] option:selected').val() == '送料込み(出品者負担)','着払い(購入者負担)') $('#chi').css('display','block');
    else $('#chi').css('display','none');
  });
});
