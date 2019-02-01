$(document).on('turbolinks:load',function() {
  $(function(){
    var modal = $('#modal'),
        modalContent = $('#modal_content'),
        btnOpen = $("#delete-btn"),
        btnClose = $(".btn-cansel");
        btnSubmit = $("#modal-btn-submit");

  $(btnOpen).on('click', function(e) {
    e.preventDefault();
    modal.show();
    return false;
  });

  $(modal).on('click', function(event) {
    if(!($(event.target).closest(modalContent).length)||($(event.target).closest(btnClose).length)){
    modal.hide();
    }
  });
  $(modal).on('click', function(event) {
    if(!($(event.target).closest(modalContent).length)||($(event.target).closest(btnSubmit).length)){
    modal.hide();
    }
  });
  });

  $(function(){
    var modal = $('.modal.is-show.is-animate.sell-draft'),
        modalContent = $('.modal-inner'),
        btnOpen = $(".items-send-btn"),
        btnSubmit = $(".btn.btn-default-modal");

  $(btnOpen).on('click', function(e) {
    modal.show();
    $('.items-send-btn').submit();
    $('.text-center').submit();
  });

  $(modal).on('click', function(event) {
    if(!($(event.target).closest(modalContent).length)||($(event.target).closest(btnSubmit).length)){
    modal.hide();
    }
  });
});
});
