$(document).on('turbolinks:load', function(){
  function append_middlecategory(){
    var html = `<div class="select-wrap middle">
                  <select class="select-default" name="item[middle_category_id]" include_blank: "---", id="middle_category">
                    <option id="middle_choice">---</option>
                  </select>
                  <i class="fa fa-arrow-bottom"></i>
                </div>`
    return html;
  }

  function append_middlecategory_for_search(){
    var html = `<div class="select-wrap middle">
                  <select class="select-default middle_search" name="q[middle_category_id_eq]" include_blank: "---">
                    <option id="middle_choice">---</option>
                  </select>
                  <i class="fa fa-arrow-bottom"></i>
                </div>`
    return html;
  }

  $("#upper_category").on("change", function(){
     $("#middle_category").children().prop('style', "display:none;")
    var upper_category = $(this).val()
    $.ajax({
      type: 'GET',
      url: '/middle_categories',
      data: {upper_category_id: upper_category},
      dataType: 'json'
    })
    .done(function(categories) {
      var count = $(".select-wrap.upper").length
      if($(".upper").length == 1) {
        var middle_category_html = append_middlecategory()
       $(".select-wrap.upper").after(middle_category_html)
      }
      categories.forEach(function(category) {
        if(category.size_type_id != undefined) {
          var middle = $("#middle_choice").after(`<option class="append_choice" value="${category.id}" data-size-id="${category.size_type_id}">${category.name}</option>`)
        }
      })
    })
  })

  $(".upper_search").on("change", function(){
    $("#middle_category").children().prop('style', "display:none;")
    var upper_category = $(this).val()
    $.ajax({
      type: 'GET',
      url: '/items/new',
      data: {upper_category_id: upper_category},
      dataType: 'json'
    })
    .done(function(categories) {
      var count = $(".select-wrap.upper").length
      if($(".upper").length == 1) {
        var middle_category_html = append_middlecategory_for_search()
       $(".select-wrap.upper").after(middle_category_html)
      }
      categories.forEach(function(category) {
        if(category.size_type_id != undefined) {
          var middle = $("#middle_choice").after(`<option class="append_choice" value="${category.id}" data-size-id="${category.size_type_id}">${category.name}</option>`)
        }
      })
    })
  })
})


