$(document).on('turbolinks:load',function(){
  $('.sub-image li img').hover(function(){
    $('.main-image img').attr('src', $(this).attr('src'));
  });

  $('select[class = "parents"]').change(function(){
    var parent_id = $('select[class = "parents"]').val();
    var count = $('select[class = "child"]').children().length;
    for(var i = 1; i < count; i++){
      var child_op = $('select[class = "child"] option:eq(' +i+ ')');
      if (child_op.attr("parent") === parent_id || child_op.attr("parent") === "") {child_op.show();
    }else{
      child_op.hide();
      }
    }
  })

  $('select[class = "child"]').change(function(){
    var parent_id = $('select[class = "child"]').val();
    var count = $('select[class = "grandson"]').children().length;
    for(var i = 1; i < count; i++){
      var grandson_op = $('select[class = "grandson"] option:eq(' +i+ ')');
      if (grandson_op.attr("parent") === parent_id || grandson_op.attr("parent") === "") {grandson_op.show();
    }else{
      grandson_op.hide();
      }
    }
  })

  $('.parents').change(function(){
    var parents_val = $(".parents").val();
    var noValue = $('.child').html();
    if(parents_val == "0"){
      $('.child').css('display', 'none');
      $('.grandson').css('display', 'none');
    }else{
      $('.child').css('display', 'block');
      $('.grandson').css('display', 'none')
      $('.child').html(noValue);
    }
  });
  $('.child').change(function(){
    var child_val = $('.child').val();
    var noValue = $('.grandson').html();
    if(child_val == "0"){
      $('.grandson').css('display', 'none');
    }else{
      $('.grandson').css('display', 'block');
      $('.grandson').html(noValue);
    }
  });
});

