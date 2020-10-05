class FavoritesController < ApplicationController
  before_action :set_favorite

  def create
    @favorite = Favorite.create(user_id: current_user.id, item_id: @item.id)
  end

  def destroy
    @favorite = current_user.favorite.find_by(item_id: @item.id)
    @favorite.destroy
  end

  private
  def set_favorite
    @item = Item.find(params[:item_id])
  end
end
