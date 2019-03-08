$(document).on('turbolinks:load', function(){
  var category_tag = $(".category_list")
  var link = $(".category_link")
  var parent_wrap = $(".pc-header-nav-parent-wrap")
  var category_parent = $(".pc-header-nav-parent")
  var child_wrap = $(".pc-header-nav-child-wrap")
  var category_child = $(".pc-header-nav-child")
  var grand_child_wrap = $(".pc-header-nav-grand-child-wrap")
  var category_grand_child = $(".pc-header-nav-grand-child")
  var append_count = 0

  category_tag.on("mouseover", function(){
    parent_wrap.prop('style', "display:block;")
    $(this).find(child_wrap).prop('style', "display:block;")
    if(append_count == 0) {
      $(".category").append(`<li class="pc-header-nav-parent">
                              <h3 class="upper_category__text">
                                <a href="https://www.mercari.com/jp/category/" class="category_link">
                                  カテゴリー一覧
                                </a>
                              </h3>
                            </li>`)
    }
    append_count += 1
  })

  category_tag.on("mouseover", ".pc-header-nav-parent", function(){
    $(this).prop('style', "background-color:red;")
    $(this).find(link).prop('style', "color:white;")
  })

  category_tag.on("mouseout", ".pc-header-nav-parent", function(){
    $(this).prop('style', "background-color:none;")
    $(this).find(link).prop('style', "color:black;")
  })

  category_parent.on("mouseover", function(){
    $(this).prop('style', "background-color:red;")
    $(this).find(link).prop('style', "color:white;")
  })

  category_parent.on("mouseout", function(){
    $(this).prop('style', "background-color:none;")
    $(this).find(link).prop('style', "color:black;")
    $(this).parent(parent_wrap).prop('style', "display:none;");
  })

  category_child.on("mouseover", function(){
    $(this).prop('style', "background-color:#eee;")
    $(this).find(grand_child_wrap).prop('style', "display:block;")
  })

  category_child.on("mouseout", function(){
    $(this).prop('style', "background-color:white;")
    $(this).parent(child_wrap).prop('style', "display:none;");
  })

  category_grand_child.on("mouseover", function(){
    $(this).prop('style', "background-color:#eee;")
  })

  category_grand_child.on("mouseout", function(){
    $(this).prop('style', "background-color:white;")
    $(this).parent(grand_child_wrap).prop('style', "display:none;")
  })
})

