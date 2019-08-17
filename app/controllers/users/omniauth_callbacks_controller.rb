# class Users::OmniauthCallbacksController < ApplicationController
#   def facebook
#     callback_for(:facebook)
#   end

#   def google_oauth2
#     callback_for(:google)
#   end


#   def callback_for(provider)
#     info = User.find_oauth(request.env["omniauth.auth"]) 
#     @user = info[:user]
#     sns_id = info[:sns_id]
#     if @user.persisted? 
#       sign_in_and_redirect @user, event: :authentication
#       set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
#     else 
#       session["devise.sns_id"] = sns_id 
#       render template: "devise/registrations/new"
#     end
#   end

#   def failure
#     redirect_to root_path and return
#   end
# end

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def facebook
    # You need to implement the method below in your model (e.g. app/models/user.rb)
    @user = User.from_omniauth(request.env["omniauth.auth"])

    if @user.persisted?#persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:notice, :success, :kind => "Facebook") if is_navigational_format?
    else
      session["devise.facebook_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end


  def failure
    redirect_to root_path
  end
end

