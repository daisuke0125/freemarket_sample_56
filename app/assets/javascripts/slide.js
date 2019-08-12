// $(function() {
  
//   $('#slick').slick({
//     dots: true,
//     customPaging: function(slider, i) {
//       var thumbSrc = $(slider.$slides[i]).find('img').attr('src');
//       return '<img src="' + thumbSrc + '">';
//     }
//   });
  

//   $('img').mouseover(function(){
//     $('.slick-slide img').attr('src', $(this).attr('src'));
//   });


// });



$(document).on('turbolinks:load',function(){
  $('.thumbnail').slick({
    infinite: true,
    arrows: false,
    draggable: false,
    swipeToSlide: false,
    initialSlide: 0,    
  });
  $('.thumbnail-thumb').slick({
    infinite: true,
    slidesToShow: 10,
    focusOnSelect: true,
    asNavFor: '.thumbnail',
    variableWidth: true,
    pauseOnFocus: false,
    arrows:false,
    lazyLoad: 'ondemand',
  });
  $('.thumbnail-thumb__photo').on('mouseover', function(){
    var photo = $(this).attr('src');
    var topPhoto = $('.thumbnail-image').attr(photo);
    var distance = $('.thumbnail-thumb__photo').index(this);
    var ml = $(this).offset();

    if (photo == "https://www.asahicom.jp/articles/images/AS20190719000785_commL.jpg") {
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-300px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "https://www.1242.com/lf/asset/uploads/2018/01/dog-3045116_1280a.jpg") {
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-600px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "https://dol.ismcdn.jp/mwimgs/7/1/670m/img_71c53c1d81500a1cf73a4f543e72413f27838.jpg") {
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-900px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "https://cdn-ak.f.st-hatena.com/images/fotolife/h/haruharu5/20180813/20180813115403.jpg") {
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-1200px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "http://img06.shop-pro.jp/PA01137/802/product/84946209.jpg") {
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-1500px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "http://img06.shop-pro.jp/PA01137/802/product/84946209.jpg") {
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-1800px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "http://img06.shop-pro.jp/PA01137/802/product/84946209.jpg") {
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-2100px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "http://img06.shop-pro.jp/PA01137/802/product/84946209.jpg") {
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-2400px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "http://img06.shop-pro.jp/PA01137/802/product/84946209.jpg") {
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-2700px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "http://img06.shop-pro.jp/PA01137/802/product/84946209.jpg") {
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-3000px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    }
    $(this).css('opacity', '1.0');
    $('.thumbnail-thumb__photo').not(this).css('opacity','0.5');
  });
 });