$(document).on('turbolinks:load', function(){
  var brand_tag = $(".brand_list")
  var brand_list = $("#search-menu__list__brand-list")
  var append_brand_count = 0


  function append_brands(brand){
    var html = `<li class="pc-header-nav-parent" id="category-${brand.id}" data-upper-id="${brand.id}">
                    <h3 class="upper_category__text">
                    <a href="https://www.mercari.com/jp/category/${brand.id}/" class="brand_link" style="color:black;">
                        ${brand.name}
                    </a>
                  </h3>
                </li>`
    return html
  }

  brand_tag.on("mouseenter", function(){
    $.ajax({
      type: 'GET',
      url: '/brands',
      dataType: 'json'
    })
    .done(function(brands){
      console.log(brands)
      brands.forEach(function(brand){
        if(append_brand_count == 0){
          var brand_toggle = append_brands(brand)
          brand_list.append(brand_toggle)
        }
      })
      brand_list.append(`<li class="pc-header-nav-parent">
                    <h3 class="upper_category__text">
                    <a href="https://www.mercari.com/jp/brand/" class="brand_link" style="color:black;">
                        ブランド一覧
                    </a>
                  </h3>
                </li>`)
      append_brand_count += 1
    })
  })

  brand_tag.on("mouseenter", ".pc-header-nav-parent", function(){
    $(this).prop('style', "background-color:red;")
    $(this).find(".brand_link").prop('style', "color:white;")
  })

  brand_tag.on("mouseleave", ".pc-header-nav-parent", function(){
    $(this).prop('style', "background-color:none;")
    $(this).find(".brand_link").prop('style', "color:black;")
  })

  brand_tag.on("mouseleave", function(){
    $(".pc-header-nav-parent").remove()
    append_brand_count = 0
  })
})
