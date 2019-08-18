class CardController < ApplicationController

  def new
  end

  def create
    Card.create(card_number: card_params[:card_number], exp_month: card_params[:exp_month], exp_year: card_params[:exp_year], cvc: card_params[:cvc], user_id: current_user.id)
    redirect_to card_registration_items_path
  end


  def edit
    @card = Card.new
  end
  
  private
  def card_params
    params.require(:card).permit(
        :card_number,
        :exp_month,
        :exp_year,
        :cvc
    )
  end
end

