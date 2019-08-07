Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks =>  "users/omniauth_callbacks",
    :registrations => "users/registrations"
  }

  root "items#index"

  get   'items/identification'   =>  'items#identification'
  get   'items/index'   =>  'items#index'
  get   'items/show'   =>  'items#show'

end
