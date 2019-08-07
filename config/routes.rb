Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks =>  "users/omniauth_callbacks",
    :registrations => "users/registrations"
  }
  root "items#index"
  
  resource :items, only: [:index, :show, :edit] 
end
