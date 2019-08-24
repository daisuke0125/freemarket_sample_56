class CardController < ApplicationController

  def show
    @card = Card.new
  end
  
  def destroy
    # @cards = Card.new
    @cards = current_user.cards
  end
  
  def create
    @card = Card.new(card_number: card_params[:card_number], exp_month: card_params[:exp_month], exp_year: card_params[:exp_year], cvc: card_params[:cvc], user_id: current_user.id)
    if @card.save
      redirect_to card_registration_items_path 
    else
      redirect_to card_edit_path
    end
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
        :cvc,
    )
  end
end

