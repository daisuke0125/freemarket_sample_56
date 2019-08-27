class ItemsController < ApplicationController

  before_action :set_item, only: [:edit, :update, :destroy, :detail]
  before_action :set_user, only: [:mypage, :edit_select, :identification]

  def index
    @items = Item.all
    @image = []
    @items.each do |item|
      item.images.each_with_index do |p,index|
        @image << p
      end
    end
    @images = @image
  end

  def mypage
    @nickname = @user.nickname
  end


  def edit 
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def update
    @item.update(item_params) if @item.user_id == current_user.id
  end

  def destroy
    @item.destroy  if @item.user_id == current_user.id      
      redirect_to "/items/#{@item.user.id}/mypage"
  end

  def edit_select
    @items = @user.items
  end

  def card_registration
    @card = Card.find(params[:id])
  end

  def add_card_registration
  end

  def card_information
  end

  def identification
    birth_year = @user.birth_year.to_s
    birth_month = @user.birth_month.to_s
    birth_day = @user.birth_day.to_s
    @birth= birth_year + "/" + birth_month + "/" + birth_day
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
      params[:images][:photo].each do |photo|
        @item.images.create(photo: photo, item_id: @item.id)
        # binding.pry @item.imagesでphoto取得
      end
      redirect_to root_path
    else
      redirect_to sell_items_path
    end
  end

  def detail
    @land_item = Item.where( 'id >= ?', rand(Item.count) + 1 ).sample
    @land_item2 = Item.where( 'id >= ?', rand(Item.count) + 1 ).sample

    @image = @item.images
    @goods =@item.goods.count 
  end
  
  def card_edit
    @card = Card.new
  end

  def card_upload
    @card = Card.create(card_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :brand, :condition, :delivery, :days, :area, :price, images_attributes: [:photo]).merge(user_id: current_user.id)
  end

  def image_params
    params.require(:image).permit(:photo)
  end

  def card_params
    params.require(:card).permit(:card_number, :exp_month, :exp_year, :cvc).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    @user = User.find(params[:id])
  end

end
