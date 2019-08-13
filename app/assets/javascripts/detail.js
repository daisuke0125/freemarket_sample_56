$(document).on('turbolinks:load',function(){
  $('.thumbnail').slick({
    asNavFor: '.thumnail-thumb',
    infinite: true,
    arrows: false,
    draggable: false,
    swipeToSlide: false,
    initialSlide: 0,
    lazyLoad: 'ondemand',
  });
  $('.thumbnail-thumb').slick({
    arrows: false,
    infinite: true,
    slidesToShow: 10,
    focusOnSelect: false,
    asNavFor: '.thumbnail',
    variableWidth: true,
    speed: 800,
    lazyLoad: 'ondemand',
  });
  $('.thumbnail-thumb__photo').on('mouseover', function(){
    var photo = $(this).attr('src');
    setTimeout(function(){
    if (photo == "https://www.asahicom.jp/articles/images/AS20190719000785_commL.jpg") {
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-300px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "https://www.1242.com/lf/asset/uploads/2018/01/dog-3045116_1280a.jpg") {
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-600px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "https://dol.ismcdn.jp/mwimgs/7/1/670m/img_71c53c1d81500a1cf73a4f543e72413f27838.jpg") {
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-900px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "https://cdn.mofmo.jp/v3/640/imeditor_storage/1/article/387788440.jpg"){
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-1200px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "http://teamhope-f.jp/content/images/cr/40212361sq.jpg"){
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-1500px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "https://amd.c.yimg.jp/im_sigg8iAANKtlktGWpKlpkSPTEQ---x400-y400-q90-exp3h-pril/amd/20190811-11000106-maidonans-000-16910812-view.jpg"){
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-1800px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "https://stat.ameba.jp/user_images/20190809/10/catpurr/f4/fd/j/o1280096014526886245.jpg?caw=800"){
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-2100px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "https://blogimg.goo.ne.jp/user_image/19/c6/e254690905f16e8176b628745bfb5baf.jpg"){
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-2400px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "https://amd.c.yimg.jp/im_siggoZfs3KTMhwzFIrDkqOW2.A---x400-y327-q90-exp3h-pril/amd/20190810-00000016-mai-000-2-view.jpg"){
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-2700px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } else if (photo == "https://break-time.net/wp-content/uploads/2019/08/1908_nekofloor_00.jpg"){
      $('.thumbnail .slick-list .slick-track').css({transform : 'translate(-3000px)'});
      $('.thumbnail .slick-list .slick-track').addClass('transition');
    } 
  },1000), function() {
    clearTimeout();
  }

  $(this).css('opacity', '1.0');
  $('.thumbnail-thumb__photo').not(this).css('opacity','0.5');
    
  });
});