$(document).on('turbolinks:load',function(){
   $('.menu li').hover(function(){
       $("ul:not(:animated)", this).show();
   }, function(){
       $("ul.pull-left",this).hide();
   });
   $('.menu li').hover(function(){
       $("ul:not(:animated)", this).show();
   }, function(){
       $("ul.pull-right",this).hide();
   });
});
