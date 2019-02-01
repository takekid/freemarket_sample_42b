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
});

