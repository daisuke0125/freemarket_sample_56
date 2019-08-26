class GoodsController < ApplicationController

  def create
    @good = current_user.goods.create(item_id: params[:item_id])
    @good.save
    # redirect_to controller: :items, action: :index
  end

  def destroy
    @good = Good.find_by(item_id: params[:item_id], user_id: current_user.id)
    @good.destroy
    # redirect_to controller: :items, action: :index
    # redirect_to("/posts/#{params[:post_id]}")
  end

end
