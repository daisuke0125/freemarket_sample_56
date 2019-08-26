Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks =>  "users/omniauth_callbacks",
    :registrations => "users/registrations",
    sessions: 'users/sessions'
  }

  root "items#index"
  
  resources :signup do
    collection do
      get 'step0_1'
      get 'step0_2'
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4'
      get 'step5' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end


  resources :items do
    resources :goods, only: [:create, :destroy]
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'buy'
      get 'card_information'
      get 'sell'
      get 'edit'
    end
    member do
      get 'listing'
      get 'detail'
      get 'mypage'
      get 'identification'
      get 'card_registration'
      get 'add_card_registration'
      get 'card_edit'
      get 'logout'
    end  
  end

  # resources :cards, only:[:show,:create,:destroy]
  resources :categories, only:[:index]

  # get   "card/edit" => "card#edit"
  # post   "card" => "card#create"

end
