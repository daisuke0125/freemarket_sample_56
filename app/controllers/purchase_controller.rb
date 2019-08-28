class PurchaseController < ApplicationController

  require 'payjp'

  def index

    @item = Item.find(params[:id])
    @image = @item.images
    @user = current_user

    card = Card.where(user_id: current_user.id).first
    if card.blank?
      redirect_to new_card_path
    else
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

  def pay

    @item = Item.find(params[:id])
    @image = @item.images
    @user = current_user

    card = Card.where(user_id: current_user.id).first
    Payjp.api_key = ENV['PAYJP_PRIVATE_KEY']
    Payjp::Charge.create(
    :amount => @item.price,
    :customer => card.customer_id, 
    :currency => 'jpy',
  )
  @item.update(soldout: "sold")
  redirect_to action: 'done'
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
