class PurchaseController < ApplicationController

  require 'payjp'

  def index

    @item = Item.find(params[:id])
    @image = @item.images
    @user = current_user
    
    card = Card.where(user_id: current_user.id).first
    #Cardテーブルは前回記事で作成、テーブルからpayjpの顧客IDを検索
    if card.blank?
      #登録された情報がない場合にカード登録画面に移動
      redirect_to controller: "card", action: "new"
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      #保管した顧客IDでpayjpから情報取得
      customer = Payjp::Customer.retrieve(card.customer_id)
      #保管したカードIDでpayjpから情報取得、カード情報表示のためインスタンス変数に代入
      @default_card_information = customer.cards.retrieve(card.card_id)
      @card_brand = @default_card_information.brand      
      case @card_brand
      when "Visa"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/visa.svg?917505326"
      when "JCB"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/jcb.svg?917505326"
      when "MasterCard"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/master-card.svg?917505326"
      when "American Express"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/american_express.svg?917505326"
      when "Diners Club"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/dinersclub.svg?917505326"
      when "Discover"
        @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/discover.svg?917505326"
      end
    end
  end

  def pay
    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => 13500, #支払金額を入力（itemテーブル等に紐づけても良い）
    :customer => card.customer_id, #顧客ID
    :currency => 'jpy', #日本円
  )
  redirect_to action: 'done' #完了画面に移動
  end



  def done
    
    @item = Item.find(params[:id])
    @image = @item.images
    @user = current_user

    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    customer = Payjp::Customer.retrieve(card.customer_id)
    @default_card_information = customer.cards.retrieve(card.card_id)
   
    @card_brand = @default_card_information.brand      
    case @card_brand
    when "Visa"
      @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/visa.svg?917505326"
    when "JCB"
      @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/jcb.svg?917505326"
    when "MasterCard"
      @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/master-card.svg?917505326"
    when "American Express"
      @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/american_express.svg?917505326"
    when "Diners Club"
      @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/dinersclub.svg?917505326"
    when "Discover"
      @card_src = "//www-mercari-jp.akamaized.net/assets/img/card/discover.svg?917505326"
    end
  end
end
