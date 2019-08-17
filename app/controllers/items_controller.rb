class ItemsController < ApplicationController

    def index
    end

    def mypage
      user = User.where(user_id: current_user.id)
      @nickname = user.name
  
    end

    def edit
    end
    
    def logout
    end
    
    def card_registration
    end
    
    def add_card_registration
    end

    def identification
    end



    def buy
    end
    
    def sell
    end
    
    def detail
    end
    
    def card_edit
        @card = Card.new
    end

end
