$(document).on('turbolinks:load', function(){
  var box_count = 0;
  function append_itemimages(image) {
    var html = `<div class="sell-upload-item">
              <figure class="sell-upload-figure portrait">
                <img src="${image}">
              </figure>
              <div class="sell-upload-button">
                <a id="upload_item_edit">編集</a>
                <a id="upload_item_delete">削除</a>

            </div>`
    return html;
  }

  function change_class_to_increment() {
    if($(".sell-upload-items").children(".sell-upload-item") && box_count < 6){
      box_count += 1
      var add_box = $("have-item-" + box_count.toString(10));
      var remove_box = $("have-item-" + (box_count - 1).toString(10));
      $(".sell-upload-items").removeClass(remove_box.selector).addClass(add_box.selector);
      $(".sell-upload-drop-box").removeClass(remove_box.selector).addClass(add_box.selector);
      parseInt(box_count, 10)
    }
  }

  function change_class_to_decrement(delete_target) {
    var reduce_box = delete_target.parent()
    reduce_box.removeClass("have-item-" + box_count.toString(10))
    $(".sell-upload-drop-box").removeClass("have-item-" + box_count.toString(10))
    box_count -= 1
    reduce_box.addClass("have-item-" + box_count.toString(10))
    $(".sell-upload-drop-box").addClass("have-item-" + box_count.toString(10))
    // $("#sell-dropbox-field").removeClass("have-item-" + box_count.toString(10))
  }

  function append_uploadbox() {
    var html = `
    <div class="sell-dropbox-container clearfix state-image-number-10 sell-dropbox-field" id="dropbox">
      <div class="sell-upload-items-container">
        <div class="sell-upload-items have-item-0" id="upload-items">
        </div>
      </div>
      <label class="sell-upload-drop-box have-item-0" for="item_item_images_atrributes_0_image" id="append_uploadbox">
        <input class="sell-upload-drop-file" multiple="multiple" style="display:none;" type="file" name="item[item_images_attributes][0][image][]" id="item_item_images_atrributes_0_image">
        <pre class="visible-pc">ドラッグアンドドロップまたはクリックしてファイルをアップロード</pre>
        <i class="fa fa-camera"></i>
      </label>
    </div>`
    return html;
  }

  $(".sell-upload-drop-file").on("change", function(e){
    var insert_image = "";
    var reader = new FileReader();
    var image = e.target.files[0];

    reader.addEventListener("load", function(){
      insert_image = append_itemimages(reader.result);
      if($("div").hasClass("sell-upload-item") == true) {
        $(".sell-upload-item:last").after(insert_image);
      }else {
        $(".sell-upload-items").prepend(insert_image)
      }
    }, false);

    if(image){
      reader.readAsDataURL(image)
    }
    change_class_to_increment()

    if(box_count == 5){
      console.log(box_count)
      var insert_box = append_uploadbox()
      var append_box = $(".sell-upload-box").append(insert_box)
      box_count = 0
    }
  })

   $(".sell-upload-box").on("change", "#dropbox", function(e){
    var insert_image = "";
    var reader = new FileReader();
    var image = e.target.files[0];
    console.log(e)

    reader.addEventListener("load", function(){
      insert_image = append_itemimages(reader.result);
      if($("div").hasClass("#upload-items") == true) {
        $("#upload-items:last").after(insert_image);
      }else {
        $("#upload-items").prepend(insert_image)
      }
    }, false);

    if(image){
      reader.readAsDataURL(image)
    }
    change_class_to_increment()
   })

  $(".sell-dropbox-container").on("click", "#upload_item_delete", function(){
    var delete_target = $(this).parents(".sell-upload-item")
    $(".sell-dropbox-field").prop('style', "display:none;")
    change_class_to_decrement(delete_target)
    delete_target.remove();
  })

  $(".sell-dropbox-container").on("click", "#upload_item_edit", function(){
    var edit_target = $(this).parents(".sell-upload-item").find("img")
    var target_image = edit_target.attr("src")
    var modal = append_modal_window(target_image)
    $(".sell-upload-box").after(modal);
    console.log(target_image)
  })
})
