$(document).on('turbolinks:load',function(){
    $('#item_category_id').bind('change',function(){
      var bigwordindex = $(this).prop('selectedIndex') - 1;
      console.log(bigwordindex );
      if(bigwordindex<0){
         $('#child select').removeClass('on');
      }else{
         $('#child select:not(:eq(bigwordindex)) option').attr('selected', false);
         $('#child select:not(:eq(bigwordindex))').removeClass('on');
         $('#child select').eq(bigwordindex).addClass('on');
      }
    });
});
