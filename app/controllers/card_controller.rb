class CardController < ApplicationController

  require "payjp"

  def new
    card = Card.new

  end

  # def edit
  #   card = Card.where(user_id: current_user.id)
  #   redirect_to action: "show" if card.exists?
  # end

  def pay 
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', #なくてもOK
      # email: current_user.email, #なくてもOK
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Card.new(
        user_id: current_user.id, 
        customer_id: customer.id, 
        card_id: customer.default_card,
      )
      if @card.save
        redirect_to action: "show"
      else
        redirect_to action: "pay"
      end
    end
  end

  def delete #PayjpとCardデータベースを削除します
    card = Card.where(user_id: current_user.id).first
    if card.blank?
    else
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "new"
  end

  def show 
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録テスト', 
      card: params['payjp-token'],
      metadata: {user_id: current_user.id}
      ) #念の為metadataにuser_idを入れましたがなくてもOK
      @card = Card.create(
        user_id: current_user.id, 
        customer_id: customer.id, 
        card_id: customer.default_card,
      )
      redirect_to mypage_item_path(current_user)
  end
end


  private
  def card_params
    params.require(:card).permit(
        :user_id,
        :customer_id,
        :card_id,
    )
  end
end