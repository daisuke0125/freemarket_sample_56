Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks =>  "users/omniauth_callbacks",
    :registrations => "users/registrations"
  }
  root "items#index"
  
  get "items/index" => "items#index"
  get "items/edit" => "items#edit"
  get "items/show" => "items#show"
end
