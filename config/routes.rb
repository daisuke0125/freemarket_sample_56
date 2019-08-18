Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks =>  "users/omniauth_callbacks",
    :registrations => "users/registrations"
  }

  root "items#index"
  
  get   "items/buy" => "items#buy"
  resources :signup do
    collection do
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
      get 'card_information'
      get 'sell'
      get 'edit'
      get 'detail'
      get 'card_edit'
    end  
  end

  get   "category" => "categories#index"
  get   "card/edit" => "card#edit"
  post   "card" => "card#create"

end
