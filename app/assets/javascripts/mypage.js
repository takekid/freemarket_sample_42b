$(function () {
  $(".mypage-tab-contents .tab-pane:gt(0)").css("display", "none");
  $(".mypage-tab-contents .mytpage-tabs li").click(function () {
    var num = $(".mypage-tab-contents .mypage-tabs li").index(this);
    $(".mypage-tab-contents .mypage-tabs li").removeClass("now");
    $(this).addClass("now");
    $(".mypage-tab-contents .tab-pane").css("display", "none");
    $(".mypage-tab-contents .tab-pane").eq(num).css("display", "block");
  });
  $(".mypage-tab-under .tab-pane:gt(0)").css("display", "none");
  $(".mypage-tab-under .mytpage-tabs li").click(function () {
    var num = $(".mypage-tab-under .mypage-tabs li").index(this);
    $(".mypage-tab-under .mypage-tabs li").removeClass("now");
    $(this).addClass("now");
    $(".mypage-tab-under .tab-pane").css("display", "none");
    $(".mypage-tab-under .tab-pane").eq(num).css("display", "block");
  });
});
