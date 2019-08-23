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
        @item.images.build
        @category_parent_array = ["---"]
        Category.where(ancestry: nil).each do |parent|
         @category_parent_array << parent.name
        end
    end

    def get_category_children
        #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
        @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
     end
  
     # 子カテゴリーが選択された後に動くアクション
    def get_category_grandchildren
        #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
        @category_grandchildren = Category.find( "#{params[:child_id]}").children
    end


    def create
        @item = Item.new(item_params)
        if @item.save
            binding.pry
            params[:images][:photo].each do |photo|
                @item.images.create(photo: photo.original_filename, item_id: @item.id)
            end
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
        params.require(:item).permit(:name, :detail, :category_id, :brand, :condition, :delivery, :days, :area, :price, images_attributes: [:photo]).merge(user_id: current_user.id)
    end

    def image_params
        params.require(:image).permit(:photo)
    end

end
