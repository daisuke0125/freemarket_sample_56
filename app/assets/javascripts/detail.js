$(document).on('turbolinks:load',function(){
  $('.thumbnail').slick({
    infinite: true,
    arrows: false,
    draggable: false,
    // variableWidth: true,
    swipeToSlide: false,
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
  $('.thumbnail-thumb__photo').on('mouseover', function(){
    var photo = $(this).attr('src');
    $('.thumbnail-image').attr('src', photo );
    $(this).css('opacity', '1.0');
  });
});