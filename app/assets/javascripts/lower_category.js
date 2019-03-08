$(document).on('turbolinks:load', function(){
  function append_lowercategory(){
    var html = `<div class="select-wrap lower">
                  <select class="select-default" name="item[lower_category_id]" include_blank: "---" id="lower_category">
                    <option id="lower_choice">---</option>
                  </select>
                  <i class="fa fa-arrow-bottom"></i>
                </div>`
    return html;
  }

  function append_lowercategory_for_search(){
    var html = `<div class="select-wrap lower">
                  <select class="select-default" name="q[lower_category_id_eq]" include_blank: "---" id="lower_category">
                    <option id="lower_choice">---</option>
                  </select>
                  <i class="fa fa-arrow-bottom"></i>
                </div>`
    return html;
  }

  $(".sell-form-box").on("change", "#middle_category", function(){
    $("#lower_category").children().prop('style', "display:none;")
    var middle_category = $(this).val()
    $.ajax({
      type: 'GET',
      url: '/lower_categories',
      data: {middle_category_id: middle_category},
      dataType: 'json'
    })
    .done(function(categories) {
      if($(".middle").length == 1 && $(".lower").length == 0) {
        var lower_category_html = append_lowercategory()
        $(".select-wrap.middle").after(lower_category_html)
      }
      categories.forEach(function(category) {
        if(middle_category == category.middle_category_id) {
          var lower = $("#lower_choice").after(`<option value=${category.id}>${category.name}</option>`)
        }
      })
    })
  })
  $(".category_list").on("change", ".middle_search", function(){
    $("#lower_category").children().prop('style', "display:none;")
    var middle_category = $(this).val()
    $.ajax({
      type: 'GET',
      url: '/items/new',
      data: {middle_category_id: middle_category},
      dataType: 'json'
    })
    .done(function(categories) {
      if($(".middle").length == 1 && $(".lower").length == 0) {
        var lower_category_html = append_lowercategory_for_search()
        $(".select-wrap.middle").after(lower_category_html)
      }
      categories.forEach(function(category) {
        if(middle_category == category.middle_category_id) {
          var lower = $("#lower_choice").after(`<option value=${category.id}>${category.name}</option>`)
        }
      })
    })
  })
})
