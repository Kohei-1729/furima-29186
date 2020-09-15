class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :block_exhibitor
  before_action :passby_soldout
  

  def index
    @address = PurchaseAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @address = PurchaseAddress.new(address_params)
    if @address.valid?
      pay_item
      @address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.permit(:price, :token, :user_id, :item_id, :zip_code, :prefecture_id, :city, :street_number, :building_name, :phone_number) .merge(user_id: current_user.id)
  end


  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price, 
      card: address_params[:token], 
      currency:'jpy' 
    )
  end

  def block_exhibitor
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def passby_soldout
    @item = Item.find(params[:item_id])
    if @item.id == purchase.item_id
      redirect_to root_path
    end
  end
end
