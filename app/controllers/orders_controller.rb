class OrdersController < ApplicationController
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
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def address_params
    params.permit(:user_id, :item_id, :zip_code, :prefecture_id, :city, :street_number, :building_name, :phone_number) .merge(user_id: current_user.id)
  end

  def order_params
    params.permit(:price, :token)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end
end
