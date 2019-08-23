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
    collection do
      get 'buy'
      get 'identification'
      get 'card_information'
      get 'sell'
      get 'edit'
      get 'detail'
    end
    member do
      get 'mypage'
      get 'card_registration'
      get 'add_card_registration'
      get 'card_edit'
      get 'logout'
    end  
  end

  resources :categories, only:[:index]

  # resources :cards, only:[:index]

  get   "card/edit" => "card#edit"
  post   "card" => "card#create"

end
