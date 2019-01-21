$(document).on('turbolinks:load',function(){
    $('.sub-image li img').hover(function(){
        $('.main-image img').attr('src', $(this).attr('src'));
    });
});
