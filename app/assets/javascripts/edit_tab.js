$(function() {
    
    var click_color = {
      'background-color' : 'rgb(250, 250, 250',
      'border-top' : 'solid 1.5px red'
    }
    var vanish_color = {
      'background-color' : '#eee',
      'border-top' : 'solid 1.5px #eee'
    }
    $('.tab.have').css(click_color);
    
      $('.tab.now').on("click", function() {
        $('.tab.now').css(click_color);
        $('.tab.have').css(vanish_color);
        $('.tab.none').css(vanish_color);
        $('.tab-content__list.have').remove();
        $('.tab-content__list.now').remove();
        $('.tab-content__list.none').remove();
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
          $('.tab-content__list.have').remove();
          $('.tab-content__list.now').remove();
          $('.tab-content__list.none').remove();
          var html2 = `<ul class="tab-content__list none">
                          <div class="mypage-sub__content--icon">
                            <img alt="" height="90" width="90" class="single-footer-logo" src="//www.mercari.com/jp/assets/img/common/common/logo-gray-icon.svg?1355409">
                              <div class="mypage-sub__content--notfound">取引中の商品がありません</div>
                          </div>
                       </ul>
                      `
            $('.mypage-sub__content').append(html2);
          });
  
      $('.tab.have').on("click", function() {
        $('.tab.have').css(click_color);
        $('.tab.now').css(vanish_color);
        $('.tab.none').css(vanish_color);
        $('.tab-content__list.have').remove();
        $('.tab-content__list.none').remove();
        $('.tab-content__list.now').remove();
        var html3 = `<ul class="tab-content__list have">
                      <div class="mypage-sub__content--icon">
                        <img alt="" height="90" width="90" class="single-footer-logo" src="//www.mercari.com/jp/assets/img/common/common/logo-gray-icon.svg?1355409">
                          <div class="mypage-sub__content--notfound">取引中の商品がありません</div>
                      </div>
                     </ul>
                    `
        $('.mypage-sub__content').append(html3);
      });
});