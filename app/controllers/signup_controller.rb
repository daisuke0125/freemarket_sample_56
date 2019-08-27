class SignupController < ApplicationController

    require "payjp"

    def step0_1
        @user = User.new
    end

    def step0_2
        session[:nickname] = user_params[:nickname]
        session[:email] = user_params[:email]
        session[:password] = user_params[:password]
        session[:password_confirmation] = user_params[:password_confirmation]
        session[:first_name] = user_params[:first_name]
        session[:last_name] = user_params[:last_name]
        session[:first_name_kana] = user_params[:first_name_kana]
        session[:last_name_kana] = user_params[:last_name_kana]
        session[:birth_year] = user_params[:birth_year]
        session[:birth_month] = user_params[:birth_month]
        session[:birth_day] = user_params[:birth_day]
        session[:uid] = user_params[:uid]
        session[:provider] = user_params[:provider]

        @user = User.new
    end

    def step1
        @user = User.new
    end

    def step2
        session[:nickname] = user_params[:nickname]
        session[:email] = user_params[:email]
        session[:password] = user_params[:password]
        session[:password_confirmation] = user_params[:password_confirmation]
        session[:first_name] = user_params[:first_name]
        session[:last_name] = user_params[:last_name]
        session[:first_name_kana] = user_params[:first_name_kana]
        session[:last_name_kana] = user_params[:last_name_kana]
        session[:birth_year] = user_params[:birth_year]
        session[:birth_month] = user_params[:birth_month]
        session[:birth_day] = user_params[:birth_day]

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
    end

    def create
        @user = User.new(
            nickname: session[:nickname],
            email: session[:email],
            password: session[:password],
            password_confirmation: session[:password_confirmation],
            last_name: session[:last_name],
            first_name: session[:first_name],
            last_name_kana: session[:last_name_kana],
            first_name_kana: session[:first_name_kana],
            birth_year: session[:birth_year],
            birth_month: session[:birth_month],
            birth_day: session[:birth_day],
            number: session[:number],
            postcode: session[:postcode],
            prefectures: session[:prefectures],
            city: session[:city],
            streetNumber: session[:streetNumber],
            building: session[:building],
            cordNumber: session[:cordNumber],
            provider: session[:provider],
            uid: session[:uid]
        )



        if @user.save
            # binding.pry
            Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
            if params['payjp-token'].blank?
            # redirect_to action: "new"
            else
            customer = Payjp::Customer.create(
            # description: '登録テスト', 
            # email: current_user.email,
            card: params['payjp-token'],
            # metadata: {user_id: current_user.id}
            ) 
            end
            @sns = SnsCredential.where(uid: @user.uid)
            if @sns
                @sns.update(user_id: @user.id)
            end
            session[:id] = @user.id
            @card = Card.create(
                user_id: session[:id], 
                customer_id: customer.id, 
                card_id: customer.default_card,
            )
            # Card.create(card_number: card_params[:card_number], exp_month: card_params[:exp_month], exp_year: card_params[:exp_year], cvc: card_params[:cvc], user_id: session[:id])
            redirect_to done_signup_index_path
        else
            redirect_to step1_signup_index_path
        end
    end

    def done
        sign_in User.find(session[:id]) unless user_signed_in?
    end
    
    private

    def user_params
        params.require(:user).permit(
            :nickname,
            :email,
            :password,
            :password_confirmation,
            :first_name,
            :last_name,
            :birth_day, 
            :birth_month, 
            :birth_year, 
            :number,
            :postcode,
            :prefectures,
            :city,
            :streetNumber,
            :building,
            :last_name_kana,
            :first_name_kana,
            :cordNumber,
            :provider,
            :uid
        )
    end

    def card_params
        params.require(:card).permit(
            :user_id, 
            :customer_id, 
            :card_id,
        )
    end

end
