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

  function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#item-prev').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
        }
      }
      $("#item_item_images_attributes_0_image").change(function(){
         readURL(this);
 });

});
