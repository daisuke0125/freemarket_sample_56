Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks =>  "users/omniauth_callbacks",
    :registrations => "users/registrations"
  }

  root "items#index"

  resources :items do
    collection do
      get 'identification'
      get 'logout'
      get 'card_registration'
      get 'sell'
    end  
  end

  get 'users/detail' => 'items#detail'
end