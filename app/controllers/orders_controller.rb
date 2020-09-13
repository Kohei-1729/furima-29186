class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @address = Address.new(address_params)
    if @address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.require(:address).permit(:zip_code, :prefecture_id, :city, :street_id, :building_name, :phone_number) .merge(user_id: current_user.id)
  end
end
