$(document).on('turbolinks:load', function(){

  function append_size_form(){
    var html = `<div class="form-group size">
                  <label for="item_size_id">サイズ</label>
                    <span class="form-require">必須</span>
                  <div>
                    <div class="select-wrap">
                      <select class="select-default" name="item[size_id]" id="item_size">
                        <option id="size_choice">---</option>
                      </select>
                      <i class="fa fa-arrow-bottom"></i>
                    </div>
                  </div>
                </div>
                <div class="form-group">
                  <label for="item_brand_id">
                    ブランド
                    <span class="form-arbitrary">任意</span>
                  </label>
                  <div>
                    <div class="select-wrap">
                      <input placeholder="例) シャネル" default="default" class="input-default brand" type="text" id="item_brand_id">
                      <input name="item[brand_id]" type="hidden" class="hidden-default brand_hidden">
                      <i class="fa fa-arrow-bottom"></i>
                    </div>
                  </div>
                </div>`
    return html;
  }
  $(".sell-form-box").on("change", "#lower_category", function(){
    // $("#item_size").children().prop('style', "display:none;")
    var middle_choice = $(".middle").find(".append_choice")
    var size_type_id = middle_choice.data("size-id")
    $.ajax({
      type: 'GET',
      url: '/sizes',
      data: {size_type_id: size_type_id},
      dataType: 'json'
    })
    .done(function(sizies){
      if($(".size").length == 0) {
        var size_form = append_size_form()
        $(".category").after(size_form)
      }
      sizies.forEach(function(size){
        if(size.size_type_id != undefined) {
          var size = $("#item_size").append(`<option value=${size.id}>${size.name}</option>`)
        }
      })
    })
  })
})
