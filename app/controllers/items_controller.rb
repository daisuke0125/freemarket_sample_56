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
        2.times{@item.images.build}
        
        # @category_parent_array = []
        # #データベースから、親カテゴリーのみ抽出し、配列化
        # Category.where(ancestry: nil).each_with_index do |parent, i|
        #     @category_box << parent.name
        #     @catagory_box << i
        #     @category_parent_array.push(@category_box)
        # end
        @category_parent_array = ["---"]
        Category.where(ancestry: nil).each do |parent|
         @category_parent_array << parent.name
        #  @category_parent_array.values_at << parent.id
        #  @category_parent_value << i
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
        @item = Item.new(name: item_params[:name], detail: item_params[:detail], brand: item_params[:brand], condition: item_params[:condition], delivery: item_params[:delivery], area: item_params[:area], days: item_params[:days], price: item_params[:price], user_id: current_user.id, category_id: item_params[:category_id])
        if @item.save
            # binding.pry
            # params[:images]['images'].each do |a|
            #     @image = @item.images.create!(images: a)
            # end
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
        params.require(:item).permit(:name, :detail, :category_id, :brand, :condition, :delivery, :days, :area, :price, images_attributes: [:images])
    end

    def image_params
        params.require(:image).permit(:image)
    end

end
