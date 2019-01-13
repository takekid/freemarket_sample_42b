$(function(){
    $('.menu li').hover(function(){
        $("ul:not(:animated)", this).show();
    }, function(){
        $("ul.pull-left",this).hide();
    });
});

$(function(){
    $('.menu li').hover(function(){
        $("ul:not(:animated)", this).show();
    }, function(){
        $("ul.pull-right",this).hide();
    });
});
