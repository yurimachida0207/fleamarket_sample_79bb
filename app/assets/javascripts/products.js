$(function () {
  $(document).on('click', '.image_upload', function () {
    $('.image_upload').off('change')
    console.log('aaaaa')
    var preview = $( `<div class="image-preview__wapper">
                        <img class="preview", width="80" height="80">
                          </div><div class="image-preview_btn">
                            <div class="image-preview_btn_delete">
                            削除
                            </div>
                          </div>`);
    var append_input = $(`<li class="input">
                            <label class="upload-label">
                              <div class="input-area display-none">
                              <input class="hidden image_upload" type="file">
                              </div>
                            </label>
                          </li>`)
    $ul = $('#previews')
    $li = $(this).parents('li');
    $label = $(this).parents('.upload-label');
    $inputs = $ul.find('.image_upload');
    if ($)
    $('.image_upload').on('change', function (e) {
      console.log('画像')
      var reader = new FileReader();
      reader.readAsDataURL(e.target.files[0]);
      reader.onload = function (e) {
        $(preview).find('.preview').attr('src', e.target.result);
      }
      $li.append(preview);
      $('#previews li').css({
        'width': `80px`
      })
      $label.css('display', 'none');
      $li.removeClass('input');
      $li.addClass('image-preview');
      $lis = $ul.find('.image-preview');
      if ($lis.length < 5) {
        $ul.append(append_input)
        $('#previews li:last-child').css({
          'width': `80px`
        })
        
      }
      $inputs.each(function (num, input) {
        $(input).removeAttr('name');
        $(input).attr({
          name: "item[images_attributes][" + num + "][image]",
          id: "images_attributes_" + num + "_image"
        });
      });
    });
  });
  $(document).on('click', '.image-preview_btn_delete', function () {
    var append_input = $(`<li class="input">
                            <label class="upload-label">
                                <div class="input-area display-none">
                                  <input class="hidden image_upload" type="file">
                                </div>
                            </label>
                          </li>`)
    $ul = $('#previews')
    $lis = $ul.find('.image-preview');
    $li = $(this).parents('.image-preview');
    $li.remove();
    $lis = $ul.find('.image-preview');
    if ($lis.length == 4) {
      $ul.append(append_input)
    }
    $('#previews li:last-child').css({
      'width': `80px`
    })
  });
});