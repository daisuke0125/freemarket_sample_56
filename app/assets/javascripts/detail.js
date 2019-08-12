$(document).on('turbolinks:load',function(){
  $('.thumbnail').slick({
    infinite: true,
    arrows: false,
    draggable: false,
    // variableWidth: true,
    swipeToSlide: false,
    // cssEase: 'linear',
    initialSlide: 0,
  });
  // $('.thumbnail-thumb').slick({
  //   infinite: true,
  //   slidesToShow: 3,
  //   focusOnSelect: true,
  //   asNavFor: '.thumbnail',
  //   variableWidth: true,
  //   pauseOnFocus: false,
  //   touchMove: false,
  // });
  $('.thumbnail-thumb').slick({
    infinite: true,
    slidesToShow: 3,
    focusOnSelect: true,
    asNavFor: '.thumbnail',
    variableWidth: true,
    pauseOnFocus: false,
  });
  // $('.thumbnail-thumb__photo').on('mouseover', function(){
  //   var photo = $(this).attr('src');
  //   var distance = $('.thumbnail-thumb__photo').index(this);
  //   var ml = $(this).offset();
  //   console.log(ml.left);
  //   var topDistance = $('.thumbnail-image').attr('src', photo );
  //   console.log(topDistance);
  //   var topLeft = topDistance.offset();
  //   topDistance.animate({left: topLeft.left},200);
  //   $(this).css('opacity', '1.0');
  //   $('.thumbnail-thumb__photo').not(this).css('opacity','0.5');
  // });
  $('.thumbnail-thumb__photo').on('mouseover', function(){
    var photo = $(this).attr('src');
    var topPhoto = $('.thumbnail-image').attr(photo);
    var distance = $('.thumbnail-thumb__photo').index(this);
    var ml = $(this).offset();
    // console.log(slick.$slides.eq(index).find('img').attr('src'));
    // console.log()
    // var topDistance = $('.thumbnail-image').attr('src',photo);
    // $('.thumbnail-image').css('transform', 'translate(photo.left,0px)');
    // $('.thumbnail-image').stop().animate({'marginLeft': });
    // console.log(topDistance);
    // var topLeft = topDistance.offset();
    // $('.thumbnail-image').attr('src', photo);
    if (photo == "https://www.asahicom.jp/articles/images/AS20190719000785_commL.jpg") {
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-300px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "https://www.1242.com/lf/asset/uploads/2018/01/dog-3045116_1280a.jpg") {
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-600px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "https://dol.ismcdn.jp/mwimgs/7/1/670m/img_71c53c1d81500a1cf73a4f543e72413f27838.jpg") {
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-900px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    }
    $(this).css('opacity', '1.0');
    $('.thumbnail-thumb__photo').not(this).css('opacity','0.5');
    console.log(photo);
  });
});