$(document).on('turbolinks:load', function(){
  var price_min = $(".min")
  var price_max = $(".max")

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
  $(".price_list").on("change", function(){
    var num = $(this).val()
    if(num == 300) {
      price_min.prop('value', num)
      price_max.prop('value', 1000)
    } else if(num == 1000) {
      price_min.prop('value', num)
      price_max.prop('value', 5000)
    } else if(num == 5000) {
      price_min.prop('value', num)
      price_max.prop('value', 10000)
    } else if(num == 10000) {
      price_min.prop('value', num)
      price_max.prop('value', 30000)
    } else if(num == 30000) {
      price_min.prop('value', num)
      price_max.prop('value', 50000)
    } else if(num == 50000) {
      price_min.prop('value', num)
    } else {
      price_min.prop('value', '')
      price_max.prop('value', '')
    }
  })
})
