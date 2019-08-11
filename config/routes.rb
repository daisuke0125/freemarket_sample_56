Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks =>  "users/omniauth_callbacks",
    :registrations => "users/registrations"
  }

  root "items#index"
  


resource :items, only: [:index, :show, :edit,] 
  get   'items/identification'   =>  'items#identification' 
  get   "items/logout" => "items#logout"
  get "items/card_registration" => "items#card_registration"
  get   "items/buy" => "items#buy"
end
