$(document).on('turbolinks:load', function(){
  $("#mypage-top_left, #mypage-top_right").on("click", function() {
    $(this).addClass("active");
    $(".mypage-tab-notification_top").hide();
    $("." + this.id).show();
  });
  $("#mypage-bottom_left, #mypage-bottom_right").on("click", function() {
    $(this).addClass("active");
    $(".mypage-tab-notification_bottom").hide();
    $("." + this.id).show();
  });
});
