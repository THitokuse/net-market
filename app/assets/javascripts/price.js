$(document).on('turbolinks:load', function(){
  $(".price").on("keyup", function(){
    var raw_price = $(this).val()
    if(300 <= raw_price && 9999999 >= raw_price) {
      var comercial_cost = raw_price * 0.1
      var profit = raw_price - comercial_cost
      $(".comercial_cost").text(Math.floor(comercial_cost))
      $(".profit").text(Math.floor(profit))
    } else if(raw_price < 300 && 9999999 < raw_price) {
      var comercial_cost = "-"
      var profit = "-"
      $(".comercial_cost").text(comercial_cost)
      $(".profit").text(profit)
    }
  })
})
