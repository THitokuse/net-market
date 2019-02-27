$(document).on('turbolinks:load', function(){

  $(".owl--dot").on("mouseover", function(){
    $(this).addClass("active")
    var thum_image = $(this).find('img').attr('src')
    $(".owl--item__inner").children('img').attr('src', thum_image)
  })

  $(".owl--dot").on("mouseout", function(){
    $(this).removeClass("active")
  })
})
