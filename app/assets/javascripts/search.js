$(document).on('turbolinks:load', function(){

  function append_brand_name() {
    var html = `<div class="sell-brand">
                  <ul class="sell-brand-suggest">
                  </ul>
                </div>`
    return html;
  }
  $(".sell-form-box").on("keyup", ".brand", function(){
    var input = $(this).val()
    $.ajax({
      type: 'GET',
      url: '/brands',
      data: { name: input},
      dataType: 'json'
    })
    .done(function(brands){
      $(".sell-brand-suggest").empty()
      if((brands.length !== 0 && input.length !== 0) && $(".sell-brand-suggest").length == 0) {
        var brand_html = append_brand_name()
        $(".brand").after(brand_html)
      }
      brands.forEach(function(brand){
        $(".sell-brand-suggest").append(`<a><li class="brand_option" id=${brand.id}>${brand.name}</li></a>`)
      })
    })
  })

  $(".sell-form-box").on("click", ".brand_option", function(){
    var id = $(this).attr('id')
    var name = $(this).text()
    $(".brand_hidden").prop('value', id)
    $(".brand").prop('value', name)
    $(".sell-brand").remove()
  })
})
