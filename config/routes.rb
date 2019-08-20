Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks =>  "users/omniauth_callbacks",
    :registrations => "users/registrations",
    sessions: 'users/sessions'
  }

  root "items#index"
  
  resources :signup do
    collection do
      get 'step0'
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end


  resources :items do
    collection do
      get 'buy'
      get 'identification'
      get 'logout'
      get 'card_registration'
      get 'add_card_registration'
      get 'sell'
      get 'edit'
      get 'detail'
      get 'card_edit'
    end
    member do
      get 'mypage'
    end  
  end

  #idが必要な場合はmemberへ、必要ない場合はcollectionへ


  get   "category" => "categories#index"

end
