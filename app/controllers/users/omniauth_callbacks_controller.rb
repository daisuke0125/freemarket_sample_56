class Users::OmniauthCallbacksController < ApplicationController
  # def facebook
  #   callback_from :facebook
  #   # callback_from(:facebook)
  #   # callback_for :facebook
  # end

  # def google_oauth2
  #   callback_from :google
  #   # callback_from(:google)
  #   # callback_for :google
  # end

  # def failure
  #   redirect_to root_path
  # end

  # private

  # # def callback_for(provider)
  # #   info = User.find_oauth(request.env["omniauth.auth"]) #usersモデルのメソッド
  # #   @user = info[:user]
  # #   sns_id = info[:sns_id]
  # #   # binding.pry
  # #   if @user.persisted? #userが存在したら
  # #     sign_in_and_redirect @user, event: :authentication
  # #     set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
  # #   else #userが存在しなかったら
  # #     session["devise.sns_id"] = sns_id #sns_credentialのid devise.他のアクションに持ち越せる(少し難)
  # #     render template: "devise/registrations/new" #redirect_to だと更新してしまうのでrenderで
  # #   end
  # # end

  

  # def callback_from(provider)
  #   provider = provider.to_s
  #   @user = User.find_for_oauth(request.env['omniauth.auth'])

  #   if @user.persisted?
  #     flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
  #     sign_in_and_redirect @user, event: :authentication
  #   else
  #     session[:nickname] = @user.nickname
  #     session[:email] = @user.email
  #     session[:password] = @user.password
  #     session[:provider] = @user.provider
  #     session[:uid] = @user.uid
  #     # redirect_to step1_signup_index_path
  #     redirect_to root_path
  #   end
  # end

  

  # private
  # def callback_from(provider)
  #   provider = provider.to_s

  #   # userモデルに定義したfinde_for_oauthメソッドを使用
  #   @user = User.find_for_oauth(request.env['omniauth.auth'])

  #   if @user.persisted?
  #     flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
  #     sign_in_and_redirect @user, event: :authentication
  #   else
  #     session["devise.#{provider}_data"] = request.env['omniauth.auth']
  #     redirect_to new_user_registration_url
  #   end
  # end

  def facebook
    callback_for(:facebook) #コールバック
  end

  def google_oauth2
    callback_for(:google)
  end


  def callback_for(provider)
    info = User.find_oauth(request.env["omniauth.auth"]) #usersモデルのメソッド
    @user = info[:user]
    sns_id = info[:sns_id]
    # binding.pry
    if @user.persisted? #userが存在したら
      sign_in_and_redirect @user, event: :authentication
      # set_flash_message(:notice, :success, kind: "#{provider}".capitalize) if is_navigational_format?
    else #userが存在しなかったら
      # session["devise.sns_id"] = sns_id #sns_credentialのid devise.他のアクションに持ち越せる(少し難)
      session["devise.#{provider}_data"] = request.env["omniauth.auth"].except("extra")
      render template: "signup/step0_1"#redirect_to だと更新してしまうのでrenderで
      # render template: "signup/step1"#redirect_to だと更新してしまうのでrenderで
      # sign_in_and_redirect @user, event: :authentication
      # render template: "items/index"#redirect_to だと更新してしまうのでrenderで
    end
  end

  # def failure
  #   redirect_to root_path and return
  # end

  # def facebook
  #   callback_from :facebook
  # end

  # def google_oauth2
  #   callback_from :google
  # end

  # def failure



  # private

  # def callback_from(provider)
  #   provider = provider.to_s
  #   @user = User.find_oauth(request.env['omniauth.auth'])

  #   if @user.persisted?
  #     flash[:notice] = I18n.t('devise.omniauth_callbacks.success', kind: provider.capitalize)
  #     sign_in_and_redirect @user, event: :authentication
  #   else
  #     session[:nickname] = @user.nickname
  #     session[:email] = @user.email
  #     session[:password] = @user.password
  #     session[:password_confirmation] = @user.password
  #     session[:provider] = @user.provider
  #     session[:uid] = @user.uid
  #     redirect_to step0_signup_path
  #   end
  # end


end
