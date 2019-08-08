class SignupController < ApplicationController

    def step1
        @user = User.new
    end

    def step2
        @user = User.new
    end

    def step3
        @user = User.new
    end

    def step4
        @user = User.new
    end

    def step5
        @card = Card.new
    end

    def done

    end

    private

    def user_params

    end


end
