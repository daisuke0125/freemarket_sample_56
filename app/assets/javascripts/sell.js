$(document).on('turbolinks:load', function(){
  var item = $('.sell-form__upload--box--item');
  var box = $('.sell-form__upload--box')
  var dropzone = $('.dropzone');
  var dropzone2 = $('.dropzone-area2');
  var dropzone_box = $('.dropzone-box');
  var images = [];
  var inputs  =[];
  var input_area = $('.input_area');
  var preview = $('#preview');
  var preview2 = $('#preview2');
  var view = $('.img_view');
  var photo_left = $('.img_view').find('img');
  var upload = $('.upload-image');

  $(document).on('change', 'input[type= "file"].upload-image',function(event) {
    var file = $(this).prop('files')[0];
    var reader = new FileReader();
    inputs.push($(this));
    var img = $(`<div class= "img_view"><img></div>`);
    reader.onload = function(e) {
      var btn_wrapper = $('<div class="btn_wrapper-image"><div class="btn-edit">編集</div><div class="btn-delete">削除</div></div>');
      img.append(btn_wrapper);
      img.find('img').attr({
        src: e.target.result
      })
    }
    reader.readAsDataURL(file);
    images.push(img);

    if(images.length > 5) {
      $('#dropzone2').css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview2.append(image);
        $('#dropzone2').css({
          'width': `calc(100% - (135px * ${images.length - 5}))`
        })
      })
      if(images.length == 9) {
        box.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
    } else {
        $('#preview').empty();
        $.each(images, function(index, image) {
          image.attr('data-image', index);
          preview.append(image);
        })
        box.css({
          'width': `calc(100% - (130px * ${images.length}))`,
          'left': `calc(130px * ${images.length})` 
        })
        preview.css ({
          'left': `calc(-160px * ${images.length})`,
          'marginLeft': `calc(35px * ${images.length - 1})`
        })
        upload.css ({
          'width': `calc(622px - (130px * ${images.length}))`,
          'left': `calc(-62px + (13px * ${images.length}))`
        })
        // photo_left.css ({
        //   'left' : '-200px'
        // })
      }
      if(images.length == 4) {
        box.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
    if(images.length == 10) {
      dropzone2.css({
        'display': 'none'
      })
      return;
    }
    var new_image = $(`<input multiple= "multiple" name="product_images[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`);
    input_area.prepend(new_image);
  });


//   else if(images.length = 5) {
//     // box.css({
//     //   'display': 'none'
//     // })
//     dropzone2.css({
//       'display': 'block'
//     })
//     $.each(images, function(index, image) {
//       image.attr('data-image', index);
//       preview2.append(image);
//       dropzone2.css({
//         'width': `calc(100% - (135px * ${images.length - 5}))`
//       })
//     })
//     dropzone.css({
//       'height': '550px'
//     })
// }

  // $(document).on('click', '.delete', function() {
  //   var target_image = $(this).parent().parent();
  //   $.each(inputs, function(index, input){
  //     if ($(this).data('image') == target_image.data('image')){
  //       $(this).remove();
  //       target_image.remove();
  //       var num = $(this).data('image');
  //       images.splice(num, 1);
  //       inputs.splice(num, 1);
  //       if(inputs.length == 0) {
  //         $('input[type= "file"].upload-image').attr({
  //           'data-image': 0
  //         })
  //       }
  //     }
  //   })
  //   $('input[type= "file"].upload-image:first').attr({
  //     'data-image': inputs.length
  //   })
  //   $.each(inputs, function(index, input) {
  //     var input = $(this)
  //     input.attr({
  //       'data-image': index
  //     })
  //     $('input[type= "file"].upload-image:first').after(input)
  //   })
  //   if (images.length >= 5) {
  //     dropzone2.css({
  //       'display': 'block'
  //     })
  //     $.each(images, function(index, image) {
  //       image.attr('data-image', index);
  //       preview2.append(image);
  //     })
  //     dropzone2.css({
  //       'width': `calc(100% - (135px * ${images.length - 5}))`
  //     })
  //     if(images.length == 9) {
  //       dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
  //     }
  //     if(images.length == 8) {
  //       dropzone2.find('i').replaceWith('<p>ココをクリックしてください</p>')
  //     }
  //   } else {
  //     dropzone.css({
  //       'display': 'block'
  //     })
  //     $.each(images, function(index, image) {
  //       image.attr('data-image', index);
  //       preview.append(image);
  //     })
  //     dropzone.css({
  //       'width': `calc(100% - (135px * ${images.length}))`
  //     })
  //   }
  //   if(images.length == 4) {
  //     dropzone2.css({
  //       'display': 'none'
  //     })
  //   }
  //   if(images.length == 3) {
  //     dropzone.find('i').replaceWith('<p>ココをクリックしてください</p>')
  //   }
  // })
});