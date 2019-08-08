class SignupController < ApplicationController

    def step1
        @user = User.new
    end

    def step2
        session[:nickname] = user_params[:nickname]
        session[:email] = user_params[:email]
        session[:password] = user_params[:password]
        session[:password_confirmation] = user_params[:password_confirmation]
        session[:firstname] = user_params[:firstname]
        session[:last_name] = user_params[:last_name]
        session[:first_name_kana] = user_params[:first_name_kana]
        session[:last_name_kana] = user_params[:last_name_kana]
        session[:birthday] = user_params[:birthday]
        @user = User.new
    end

    def step3
        session[:number] = user_params[:number]
        @user = User.new
    end

    def step4
        @user = User.new
    end

    def step5
        session[:postcode] = user_params[:postcode]
        session[:prefectures] = user_params[:prefectures]
        session[:city] = user_params[:city]
        session[:streetNumber] = user_params[:streetNumber]
        session[:building] = user_params[:building]
        session[:cordNumber] = user_params[:cordNumber]
        @card = Card.new
    end

    # def create
    #     @user = User.new(
    #         nickname: session[:nickname],
    #         email: session[:email],
    #         password: session[:password],
    #         password_confirmation: session[:password_confirmation],
    #         last_name: session[:last_name],
    #         first_name: session[:first_name],
    #         last_name_kana: session[:last_name_kana],
    #         first_name_kana: session[:first_name_kana],
    #         birthday: session[:birthday],
    #         postcode: session[:postcode],
    #         prefectures: session[:prefectures],
    #         city: session[:city],
    #         streetNumber: session[:streetNumber],
    #         building: session[:building],
    #         cordNumber: session[:cordNumber]
    #     )
    #     if @user.save
    #         session[:id] = @user.id
    #         redirect_to done_signup_index_path
    #     else
    #         render '/signup/registration'
    #     end
    # end

    # def done
    #     sign_in User.find(session[:id]) unless user_signed_in?
    # end
    def done
    end

    private

    def user_params
        params.require(:user).permit(
            :nickname,
            :email,
            :password,
            :password_confirmation,
            :firstname,
            :last_name,
            :birthday, 
            :number,
            :postcode,
            :prefectures,
            :city,
            :streetNumber,
            :building,
            :cordNumber
        )
    end

    def card_params
        params.require(:card).permit(
            :card_number,
            :exp_month,
            :exp_year,
            :cvc
        )
    end

end
