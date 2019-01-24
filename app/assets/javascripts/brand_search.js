$(document).on('turbolinks:load', function(){
  $(document).on('keyup', '#brand_name', function(e){
    e.preventDefault();
    var input = $.trim($(this).val());
  });
});
