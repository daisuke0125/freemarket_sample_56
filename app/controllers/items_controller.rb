class ItemsController < ApplicationController

    def index
    end

    def show
    end

    def edit
    end
    
    def logout
    end
    
    def card_registration
    end
    
    def identification
    end

    def buy
    end
    
    def sell
        @item = Item.new
    end
    
    def detail
    end
    
    def card_edit
        @card = Card.new
    end

end
