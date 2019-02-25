$(document).on('turbolinks:load', function(){
  function append_delivery_method(){
    var html = `<div class="form-group method">
                  <label for="item_delivery_method_id">配送の方法
                    <span class="form-require">必須</span>
                  </label>
                  <div>
                    <div class="select-wrap">
                      <select class="select-default" name="item[delivery_method_id]" id="delivery_method">
                        <option id="delivery_method_choice">---</option>
                      </select>
                      <i class="fa fa-arrow-bottom"></i>
                    </div>
                  </div>
                </div>`
    return html
  }


  $(".delivery_burden").on("change", function(){
    $("#delivery_method").children().prop('style', "display:none;")
    var delivery_burden = $(this).val()
    $.ajax({
      type: 'GET',
      url: '/items/new',
      data: {delivary_method_id: delivery_burden},
      dataType: 'json'
    })
    .done(function(delivary_methods){
      if($(".method").length == 0){
        var method = append_delivery_method()
        $(".burden").after(method)
      }
      delivary_methods.forEach(function(method){
        $("#delivery_method_choice").after(`<option value=${method.id}>${method.name}</option>`)
      })
    })
  })
})
