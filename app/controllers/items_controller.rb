class ItemsController < ApplicationController

    def index
    end

    def mypage
      user = User.find(params[:id])
      @nickname = user.nickname
  
    end

    def edit
    end
    
    def logout
    end
    
    def card_registration
      @cards = current_user.cards
        
    end
    
    def add_card_registration
    end

    def card_information
    end

    def identification
    end


    def buy
    end
    
    def sell
        @item = Item.new
        @image = Image.new
    end

    def create
        @item = Item.new(name: item_params[:name], detail: item_params[:detail], category_id: item_params[:category_id], brand: item_params[:brand], condition: item_params[:condition], delivery: item_params[:delivery], area: item_params[:area], days: item_params[:days], price: item_params[:price], images_attributes:[:id, :image, :item_id])
        if @item.save
            redirect_to root_path
        else
            redirect_to sell_items_path
        end
    end
    
    def detail
    end
    
    def card_edit
        @card = Card.new
        
    end

    private

    def item_params
        params.require(:item).permit(:name, :detail, :image, :category_id, :brand, :condition, :delivery, :days, :area, :price)
    end

    def image_params
        params.require(:image).permit(:image)
    end

end
