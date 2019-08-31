$(document).on('turbolinks:load' , function() {
    
  var click_color = {
    'background-color' : 'rgb(250, 250, 250',
    'border-top' : 'solid 1.5px red'
  }
  var vanish_color = {
    'background-color' : '#eee',
    'border-top' : 'solid 1.5px #eee'
  }
  $('.tab.have').css(click_color);
  $('.tab-content__list.none').hide();

    $('.tab.now').on("click", function() {
      $('.tab.now').css(click_color);
      $('.tab.have').css(vanish_color);
      $('.tab.none').css(vanish_color);
      $('.tab-content__list.have').hide();
      $('.tab-content__list.now').remove();
      $('.tab-content__list.none').hide();
      var html = `<ul class="tab-content__list now">
                      <div class="mypage-sub__content--icon">
                        <img alt="" height="90" width="90" class="single-footer-logo" src="//www.mercari.com/jp/assets/img/common/common/logo-gray-icon.svg?1355409">
                        <div class="mypage-sub__content--notfound">取引中の商品がありません</div>
                      </div>
                  </ul>
                 `
      $('.mypage-sub__content').append(html);
    });

      $('.tab.none').on("click", function() {
      $('.tab.none').css(click_color);
      $('.tab.now').css(vanish_color);
      $('.tab.have').css(vanish_color);
        $('.tab-content__list.have').hide();
        $('.tab-content__list.now').remove();
        $('.tab-content__list.none').show();
 
        });

    $('.tab.have').on("click", function() {
      $('.tab.have').css(click_color);
      $('.tab.now').css(vanish_color);
      $('.tab.none').css(vanish_color);
      $('.tab-content__list.have').show();
      $('.tab-content__list.none').hide();
      $('.tab-content__list.now').remove();
    });
  });