class GoodsController < ApplicationController

  def create
    @good = current_user.goods.create(item_id: params[:item_id])
    @good.save
    # redirect_to controller: :items, action: :detail
    redirect_back(fallback_location: detail_item_path)
  end

  def destroy
    @good = Good.find_by(item_id: params[:item_id], user_id: current_user.id)
    @good.destroy
    redirect_back(fallback_location: detail_item_path)
  end

end
