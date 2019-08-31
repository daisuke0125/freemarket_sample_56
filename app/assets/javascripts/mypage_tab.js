$(document).on('turbolinks:load', function(){

  var click_color = {
    'background-color' : 'rgb(250, 250, 250',
    'border-top' : 'solid 1.5px red'
  }
  var vanish_color = {
    'background-color' : '#eee',
    'border-top' : 'solid 1.5px #eee'
  }
  $('.tab-content__list.done').hide();

    $('.tab.to_do').on("click", function() {
      $('.tab.to_do').css(click_color);
      $('.tab.knowledge').css(vanish_color);
      $('.tab-content__list.to_do').remove();
      $('.tab-content__list.knowledge').remove();
      var html = `<ul class="tab-content__list to_do">
                    <div class="mypage-sub__content">
                      <div class="mypage-sub__content--icon">
                        <img alt="" height="90" width="90" class="single-footer-logo" src="//www.mercari.com/jp/assets/img/common/common/logo-gray-icon.svg?1355409">
                        <div class="mypage-sub__content--notfound">取引中の商品がありません</div>
                      </div>
                    </div>
                  </ul>
                `
      $('.tab-content').append(html);

      $('.tab.knowledge').on('click', function() {
      $('.tab.knowledge').css(click_color);
      $('.tab.to_do').css(vanish_color);
        $('.tab-content__list.to_do').remove();
        $('.tab-content__list.knowledge').remove();
        var html2 = `<ul class="tab-content__list knowledge">
                      <li>
                      <div class="figure">
                      <a href="https://www.mercari.com/jp/mypage/news/"><div class="tab-content__list__image">
                      <img alt="" height="48" width="48" src="https://static.mercdn.net/images/mercari_profile.png">
                      </div>
                      <div class="tab-content__list__body">
                      <div class="tab-content__list__body--text">事務局から個人メッセージ「ログイン通知」</div>
                      <div class="tab-content__list__body--time">
                      <i class="fa fa-search"></i>
                      <span>1日前</span>
                      </div>
                      </div>
                      <i class="fa fa-angle-right tab-icon"></i>
                      </a></div>
                      </li>
                      <li>
                      <div class="figure">
                      <a href="https://www.mercari.com/jp/mypage/news/"><div class="tab-content__list__image">
                      <img alt="" height="48" width="48" src="https://static.mercdn.net/images/mercari_profile.png">
                      </div>
                      <div class="tab-content__list__body">
                      <div class="tab-content__list__body--text">事務局から個人メッセージ「ログイン通知」</div>
                      <div class="tab-content__list__body--time">
                      <i class="fa fa-search"></i>
                      <span>1日前</span>
                      </div>
                      </div>
                      <i class="fa fa-angle-right tab-icon"></i>
                      </a></div>
                      </li>
                      <li>
                      <div class="tab-content__look">
                      <a href="/jp/mypage/notification/">一覧を見る</a>
                      </div>
                      </li>
                      </ul>
                    `
          $('.tab-content').append(html2);
        });
    });

    $('.tab.done').on('click', function() {
      $('.tab.done').css(click_color);
      $('.tab.doing').css(vanish_color);
      $('.tab-content__list.doing').hide();
      $('.tab-content__list.done').show();
    
      $('.tab.doing').on('click', function() {
        $('.tab.doing').css(click_color);
        $('.tab.done').css(vanish_color);
        $('.tab-content__list.doing').show();
        $('.tab-content__list.done').hide();
      });
    });
});