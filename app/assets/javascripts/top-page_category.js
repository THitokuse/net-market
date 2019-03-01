$(document).on('turbolinks:load', function(){
  var category_tag = $(".category_list")
  var category_list = $("#search-menu__list__category-list")
  var append_upper_count = 0
  var append_middle_count = 0
  var append_lower_count = 0

  function append_upper_categories(category){
    var html = `
                  <li class="pc-header-nav-parent" data-upper-id="${category.id}">
                    <h3 class="upper_category">
                      <a href="https://www.mercari.com/jp/category/${category.id}/">
                        ${category.name}
                      </a>
                    </h3>
                    <ul class="pc-header-nav-child-wrap></ul>
                  </li>`
    return html
  }

  function append_middle_categories(category) {
    var html = `<li class="pc-header-nav-child" data-middle-id="${category.id}">
                  <a href="">${category.name}</a>
                  <ul class="pc-header-nav-grand-child-wrap"></ul>
                </li>`
    return html
  }

  function append_lower_categories(category) {
    var html = `<li class="pc-header-nav-grand-child" data-lower-id="${category.id}">
                  <a>${category.name}</a>
                </li>`
    return html
  }

  category_tag.on("mouseenter", function(){
    $.ajax({
      type: 'GET',
      url: '/upper_categories',
      dataType: 'json'
    })
    .done(function(upper_categories){
      console.log("Hello World!!")
      upper_categories.forEach(function(category) {
        if(append_upper_count == 0){
          var upper_category_toggle = append_upper_categories(category)
          category_list.append(upper_category_toggle)
        }
      })
      append_upper_count += 1
    })
  })

  category_tag.on("mouseleave", function(){
    $(".pc-header-nav-parent").remove()
    append_upper_count = 0
  })

  category_tag.on("mouseenter", ".pc-header-nav-parent", function(){
    var upper_category_id = $(this).data("upper-id")
    console.log(upper_category_id)
    $.ajax({
      type: 'GET',
      url: '/middle_categories',
      data: {upper_category_id: upper_category_id},
      dataType: 'json'
    })
    .done(function(middle_categories){
      middle_categories.forEach(function(category){
        if(category.upper_category_id == upper_category_id && append_middle_count == 0) {
          var middle_category_toggle = append_middle_categories(category)
        $(".pc-header-nav-child-wrap").append(middle_category_toggle)
        }
      })
      console.log(middle_categories)
      append_middle_count += 1
    })
  })

  category_tag.on("mouseleave", ".pc-header-nav-child-wrap", function(){
    $(".pc-header-nav-child-wrap").remove()
    append_middle_count = 0
  })

  category_tag.on("mouseenter", ".pc-header-nav-child", function(){
    var middle_category_id = $(this).data("middle-id")
    console.log(middle_category_id)
    $.ajax({
      type: 'GET',
      url: '/lower_categories',
      data: {middle_category_id: middle_category_id},
      dataType: 'json'
    })
    .done(function(lower_categories){
      lower_categories.forEach(function(category){
        if(category.middle_category_id == middle_category_id && append_lower_count == 0) {
          var lower_category_toggle = append_lower_categories(category)
          $(".pc-header-nav-grand-child-wrap").append(lower_category_toggle)
        }
      })
      append_lower_count += 1
    })
  })

  category_tag.on("mouseleave", ".pc-header-nav-grand-child-wrap", function(){
    $(".pc-header-nav-grand-child-wrap").remove()
    append_lower_count = 0
  })
})

