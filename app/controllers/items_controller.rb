class ItemsController < ApplicationController
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    item = Item.find(params[:id])
    @name = item.name
    @image = item.image
    @price = item.price
    @description = item.description
    @nickname = item.user.nickname
    @category = item.category.name
    @condition = item.condition.name
    @postage_payer = item.postage_payer.name
    @prefecture = item.prefecture.name
    @handling_time = item.handling_time.name
    
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :postage_payer_id, :prefecture_id, :handling_time_id, :price) .merge(user_id: current_user.id)
  end
end
