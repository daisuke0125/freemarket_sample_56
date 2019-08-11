$(document).on('turbolinks:load',function(){
  $('.main-visual__top').slick({
    autoplay: false,
    autoplaySpeed: 500,
    prevArrow: '<span class="prev-arrow">&lt;</span>',
    nextArrow: '<span class="next-arrow">&gt;</span>',
    dots: true,
    centerpadding: 20,
  });
  // $('.prev-arrow').on('click', function() {
  //   $('.main-visual__inner').hide("slide", { direction: "left" }, 1000);
  // });
  // $('.next-arrow').on('click', function() {
  //   $('.main-visual__inner').fadeIn("slide", { direction: "left" }, 1000);
  // });
  var cancelFlag = 0;
  $('.prev-arrow').click(function(){
    var cssProperties = { marginLeft: '-100%' }
    if (cancelFlag == 0){
    cancelFlag =1;
    $('.main-visual__inner').animate({"margin-lef":"toggle"});
    // $('.main-visual__inner').toggle('slide', {direction: 'right'});
    setTimeout(function(){
      cancelFlag = 0;
    },500);
    }
  });
  $('.next-arrow').click(function(){
    var cssProperties = { marginLeft: '-100%' }
    if (cancelFlag == 0){
    cancelFlag = 1;
    $('.main-visual__inner').animate({"marginRight": "toggle"});

    setTimeout(function(){
      cancelFlag = 0;
    },500);
    }
  });
});