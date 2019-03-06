$(document).on('turbolinks:load', function(){
  $(".checkbox_label").on('click', function(){
    $(this).addClass("checked")
    var check = $(this).parent().children(".fa-check")
    check.prop('style', 'color:black;')
  })
  $(".checked").on('click', function(){
    var check = $(this).parent().children(".fa-check")
    console.log(check)
    check.prop('style', 'color:white;')
    $(this).removeClass("checked")
  })
})
