$(document).on('turbolinks:load',function(){
     $('.tab-pane').hide();
     $('.mypage-tab a').click(function () {
          $('.tab-pane').hide().filter(this.hash).fadeIn();
          $('.mypage-tab a').removeClass('active');
          $(this).addClass('active');
          return false;
     }).filter(':eq(0)').click();
    $('.tab-panes').hide();
    $('.mypage-tabs a').click(function () {
          $('.tab-panes').hide().filter(this.hash).fadeIn();
          $('.mypage-tabs a').removeClass('active');
          $(this).addClass('active');
          return false;
     }).filter(':eq(0)').click();
});
