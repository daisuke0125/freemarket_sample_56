Rails.application.routes.draw do
  devise_for :users, :controllers => {
    :omniauth_callbacks =>  "users/omniauth_callbacks",
    :registrations => "users/registrations"
  }
  root "items#index"
  get 'items/new2' => 'items#new2'
  get 'items.new3' => 'items#new3'
end
