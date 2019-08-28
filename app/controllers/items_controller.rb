class ItemsController < ApplicationController

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
    user = User.find(params[:id])
    @nickname = user.nickname
  end

  def edit 
  end
      
  def card_registration
    @user = User.find(params[:id])
    @card = @user.card
  
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)

      # 《＋α》 登録しているカード会社のブランドアイコンを表示するためのコードです。---------
      @card_brand = @card_information.brand      
      case @card_brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.svg"
      when "MasterCard"
        @card_src = "master-card.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
      end
    else
      redirect_to add_card_registration_item_path
      # ---------------------------------------------------------------
    end
  end

  def destroy #PayjpとCardのデータベースを削除
    @card = Card.find(params[:id])
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(@card.customer_id)
    customer.delete
    if @card.destroy #削除に成功した時にポップアップを表示します。
      redirect_to action: "index", notice: "削除しました"
    else #削除に失敗した時にアラートを表示します。
      redirect_to action: "index", alert: "削除できませんでした"
    end
  end

  def add_card_registration
    @user = User.find(params[:id])
    @card = @user.card
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      customer.delete
      @card.destroy #削除に成功した時にポップアップを表示します。
    else
    end
  end

  def card_information
  end

  def identification
    @user = User.find(params[:id])
    birth_year = @user.birth_year.to_s
    birth_month = @user.birth_month.to_s
    birth_day = @user.birth_day.to_s
    @birth= birth_year + "/" + birth_month + "/" + birth_day
  end

  def buy
    @item = Item.find(params[:id])
    @image = @item.images
    @user = current_user
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
      end
      redirect_to root_path
    else
      redirect_to sell_items_path
    end
  end

  def detail
    @item = Item.find(params[:id])

    @land_item = Item.where( 'id >= ?', rand(Item.count) + 1 ).sample
    @land_item2 = Item.where( 'id >= ?', rand(Item.count) + 1 ).sample

    @image= @item.images
  end
  
  

  # def card_upload
  #   @card = Card.create(card_params)
  # end

  private

  def item_params
    params.require(:item).permit(:name, :detail, :category_id, :brand, :condition, :delivery, :days, :area, :price, images_attributes: [:photo]).merge(user_id: current_user.id)
  end

  def image_params
    params.require(:image).permit(:photo)
  end

  # def card_params
  #   params.require(:card).permit(:card_number, :exp_month, :exp_year, :cvc).merge(user_id: current_user.id)
  # end

end
