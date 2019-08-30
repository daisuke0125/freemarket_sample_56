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
  // var dropzone = $(".item__img__dropzone__input");
  // var dropzone2 = $(".item__img__dropzone2__input2");
  // var appendzone = $(".item__img__dropzone2")
  // var input_area = $(".input-area");
  var preview = $("#preview");
  var preview2 = $("#preview2");

  // 登録済画像と新規追加画像を全て格納する配列（ビュー用）
  var images = [];
  // 登録済画像データだけの配列（DB用）
  var registered_images_ids =[]
  // 新規追加画像データだけの配列（DB用）
  var new_image_files = [];


  // 登録済画像のプレビュー表示
  gon.images.forEach(function(image, index){
    var img = $(`<div class= "add_img"><div class="img_area"><img class="image"></div></div>`);

    // カスタムデータ属性を付与
    img.data("image", index)

    var btn_wrapper = $('<div class="btn_wrapper"><a class="btn_edit">編集</a><a class="btn_delete">削除</a></div>');

    // 画像に編集・削除ボタンをつける
    img.append(btn_wrapper);

    binary_data = gon.images_binary_datas[index]

    // 表示するビューにバイナリーデータを付与
    img.find("img").attr({
      src: "data:image/jpeg;base64," + binary_data
    });

    // 登録済画像のビューをimagesに格納
    images.push(img)
    registered_images_ids.push(image.id)
  })

  // 画像が４枚以下のとき
  if (images.length <= 4) {
    $('#preview').empty();
    $.each(images, function(index, image) {
      image.data('image', index);
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

    // 画像が５枚のとき１段目の枠を消し、２段目の枠を出す
  } else if (images.length == 5) {
    $("#preview").empty();
    $.each(images, function(index, image) {
      image.data("image", index);
      preview.append(image);
    });
    appendzone.css({
      display: "block"
    });
    dropzone.css({
      display: "none"
    });
    preview2.empty();

    // 画像が６枚以上のとき
  } else if (images.length >= 6) {
    // １〜５枚目の画像を抽出
    var pickup_images1 = images.slice(0, 5);

    // １〜５枚目を１段目に表示
    $('#preview').empty();
    $.each(pickup_images1, function(index, image) {
      image.data('image', index);
      preview.append(image);
    })

    // ６枚目以降の画像を抽出
    var pickup_images2 = images.slice(5);

    // ６枚目以降を２段目に表示
    $.each(pickup_images2, function(index, image) {
      image.data('image', index + 5);
      preview2.append(image);
    })

    dropzone.css({
      'display': 'none'
    })
    appendzone.css({
      'display': 'block'
    })
    dropzone2.css({
      'display': 'block',
      'width': `calc(100% - (20% * ${images.length - 5}))`
    })

    // 画像が１０枚になったら枠を消す
    if (images.length == 10) {
      dropzone2.css({
        display: "none"
      });
    }
  }

  var new_image = $(
    `<input multiple= "multiple" name="item_images[image][]" class="upload-image" data-image= ${images.length} type="file" id="upload-image">`
  );
  input_area.append(new_image);


  // var box_first = $("box:nth-child(1)");

  // var already = $('.already-image');
  // var already_src = $('.already-image').attr('src');
  // var img = $(`<div class= "img_view"><img></div>`);
  // images.push(img);
  // var btn_wrapper = $('<div class="btn_wrapper-image"><div class="btn-edit">編集</div><div class="btn-delete">削除</div></div>');
  //   img.append(btn_wrapper);
  //   img.find('img').attr({
  //     src: already_src
  //   })
  // // $('#preview').push(img);
  // if (already.length <= 4){
  //   $('#preview').empty();
  //   $.each(images, function(index, image) {
  //     image.attr('data-image', index);
  //     preview.append(image);
  //     image.find('img').attr('id', index);
  //   })
  //   box.css({
  //     'width': `calc(100% - (130px * ${images.length}))`,
  //     'left': `calc(130px * ${images.length})` 
  //   })
  //   preview.css ({
  //     'left': `calc(-160px * ${images.length})`,
  //     'marginLeft': `calc(35px * ${images.length - 1})`
  //   })
  //   upload.css ({
  //     'width': `calc(622px - (130px * ${images.length}))`,
  //     'left': `calc(-62px + (13px * ${images.length}))`
  //   })
  // }
  // $(box).eq(1).css("display:none;");
  


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
      var fee = price * 0.1
      var profit = (price * 0.9)
      $('.form-group__line.none span').last().hide()
      $('.form-group__line.bold span').last().hide()
      var feeline = `<span>¥${fee}</span>`
      var profitline = `<span>¥${profit}</span>`
      $('.form-group__line.none').append(feeline);
      $('.form-group__line.bold').append(profitline);
      $('.form-group__line.bold span').last().css('font-size', '34px')
    }
  });


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