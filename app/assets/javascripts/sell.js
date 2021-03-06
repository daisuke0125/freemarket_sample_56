$(document).on('turbolinks:load', function(){
  var item = $('.sell-form__upload--box--items');
  var box = $('.sell-form__upload--box')
  var dropzone = $('.dropzone-area');
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
  var image_photo = $('img');

  $(document).on('change', 'input[type= "file"].upload-image',function(event) {
    var file = $(this).prop('files')[0];//指定した属性の値を取得
    var reader = new FileReader();
    inputs.push($(this));
    var img = $(`<div class= "img_view"><img></div>`); //img_viewの作成
    reader.onload = function(e) {
      var btn_wrapper = $('<div class="btn_wrapper-image"><div class="btn-edit">編集</div><div class="btn-delete">削除</div></div>');
      img.append(btn_wrapper);
      img.find('img').attr({
        src: e.target.result
      })
    }
    reader.readAsDataURL(file);
    images.push(img);//配列に要素を追加
    if(images.length > 5) {
      $('.sell-form__upload').css({'height': '540px'})
      box.css({
        'display': 'block'
      })
      $('#preview2').css({'flex-wrap':'wrap','height': '600px','position': 'relative', 'top': '-300px'});
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview2.append(image);
        image.find('img').attr('id', index);
        $('#dropzone2').css({
          'width': `calc(100% - (135px * ${images.length - 5}))`
        })
      $('#preview2').css({
        'left': `calc(-150px - (130px * ${images.length - 6}))`
      })
      box.css({
        'width': `calc(100% - (130px * ${images.length - 5}))`,
        'left': `calc(130px * ${images.length - 5})` 
      })
      preview.css ({
        'left': `calc(-160px * ${images.length - 5})`,
        'marginLeft': `calc(35px * ${images.length - 6})`
      })
      upload.css ({
        'width': `calc(622px - (135px * ${images.length - 5}))`,
        'left': `calc(-62px + (13px * ${images.length - 5}))`
      })
      })
      if(images.length == 9) {
        box.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
      if(images.length == 10) {
        box.css({'border': '0'})
      }
    } 
     else {
      if(images.length == 5) {
        $('.sell-form__upload').css({'height':'540px'});
        dropzone.css({'border':'0'});
        $('.pre1').css({'display':'none'});
        box.css({'width': '620px', 'top':'300px','left': '-10px'});
        $('#preview').css({'top':'-300px','left':'-120px'});
        $('#preview').empty();
        $.each(images, function(index, image) {
          image.attr('data-image', index);
          preview.append(image);
          image.find('img').attr('id', index);
        })
      }
      if (images.length <= 4){
        $('#preview').empty();
        $.each(images, function(index, image) {
          image.attr('data-image', index);
          preview.append(image);
          image.find('img').attr('id', index);
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
      }
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

  $('#item_price').on('keyup', function(e) {
    e.preventDefault();
    var price = $(this).val();
    var first = `<span>-</span>`
    if (price == 0){
      $('.form-group__line.none span').last().hide()
      $('.form-group__line.bold span').last().hide()
      $('.form-group__line.none').append(first);
      $('.form-group__line.bold').append(first);
      }
    else {
      var fee = (price * 0.1).toFixed(0)
      var profit = (price * 0.9).toFixed(0)
      $('.form-group__line.none span').last().hide()
      $('.form-group__line.bold span').last().hide()
      var feeline = `<span>¥${fee}</span>`
      var profitline = `<span>¥${profit}</span>`
      $('.form-group__line.none').append(feeline);
      $('.form-group__line.bold').append(profitline);
      $('.form-group__line.bold span').last().css('font-size', '34px')
    }
  });

  $('.btn-delete.edit').click(function(){
    // $(this).css('color','red'); //ok
    var already_image = $(this).parent().parent();
    already_image.remove(); //ok
  });

  if (box.length >= 1) {
    box.nextAll().css('display','none');
    $('.img_view').css('height','0px');
    //一番目以降のボックスを非表示
  }
  var otheritem = $('.item-box__image--height')
    otheritem.nextAll().remove();
    // otheritem.css('height','0px');
    //一番目以降のボックスを非表示

  $(document).on('click', '.btn-delete', function() {
    var target_image = $(this).parent().parent();
    var data_image = target_image.data('image');
    var img_view = target_image.find('img').attr('id')
    $.each(inputs, function(index, input){
      if ( img_view == target_image.data('image')){
        target_image.attr('data-image', index).remove();
        var num = img_view;
        images.splice(num, 1);
        input.splice(num, 1);
      }
      if (img_view > target_image.data('image')|| img_view < target_image.data('image')){
        target_image.find('img').attr('id', data_image);
      }
    })
    $('input[type= "file"].upload-image:first').attr({
      'data-image': inputs.length
    })
    $.each(inputs, function(index, input) {
      var input = $(this)
      input.attr({
        'data-image': index
      })
      $('input[type= "file"].upload-image:first').after(input)
    })
    if (images.length >= 5) {
      dropzone2.css({
        'display': 'block'
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview2.append(image);
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
        'width': `calc(622px - (135px * ${images.length}))`,
        'left': `calc(-62px + (13px * ${images.length}))`
      })
      if(images.length == 9) {
        dropzone2.find('p').replaceWith('<i class="fa fa-camera"></i>')
      }
      if(images.length == 8) {
        dropzone2.find('i').replaceWith('<p>ココをクリックしてください</p>')
      }
    } else {
      if (images.length <= 4){
        $('#preview').empty();
        $.each(images, function(index, image) {
          image.attr('data-image', index);
          preview.append(image);
        })
        $('.sell-form__upload').css({'height':'218px'});
        $('#preview').css('top', '0');
        box.css('top','0');
        upload.css ({
          'width': `calc(622px - (135px * ${images.length}))`,
          'left': `calc(-62px + (13px * ${images.length}))`
        })
      }
      box.css({
        'width': `calc(100% - (130px * ${images.length}))`,
        'left': `calc(130px * ${images.length})` 
      })
      preview.css ({
        'left': `calc(-160px * ${images.length})`,
        'marginLeft': `calc(35px * ${images.length - 1})`
      })
      upload.css ({
        'width': `calc(622px - (135px * ${images.length}))`,
        'left': `calc(-62px + (13px * ${images.length}))`
      })
      $.each(images, function(index, image) {
        image.attr('data-image', index);
        preview.append(image);
      })
    }
  })
});