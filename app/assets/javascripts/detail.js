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
    $('.thumbnail-image').animate({marginLeft : '300px' },200);
    $(this).css('opacity', '1.0');
    $('.thumbnail-thumb__photo').not(this).css('opacity','0.5');
    console.log($(this).scrollLeft());
  });
});