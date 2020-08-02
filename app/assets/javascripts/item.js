// $(function() {
//   const buildFileField = (index)=> {
//     const html = `<div data-index="${index}" class="group">
//                     <input class="file" type="file"
//                     name="product[images_attributes][${index}][src]"
//                     id="product_images_attributes_${index}_src"><br>
//                     <div class="remove">削除</div>
//                   </div>`;
//     return html;
//   }

//   let fileIndex = [1,2,3,4,5];

//   $('#image-box').on('change', '.file', function(e) {
//     $('#image-box').append(buildFileField(fileIndex[0]));
//     fileIndex.shift();
//     fileIndex.push(fileIndex[fileIndex.length - 1] + 1)
//   });

//   $('#image-box').on('click', '.remove', function() {
//     $(this).parent().remove();
//     if ($('.file').length == 0) $('#image-box').append(buildFileField(fileIndex[0]));
//   });
// });

window.alert('こんにちは');