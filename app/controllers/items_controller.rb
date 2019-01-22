class ItemsController < ApplicationController
  def index
    @items = Item.includes(:item_images,:category).order("updated_at DESC").all.limit(3)
  end

  def show
  end


  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:name,:category_id,:introduction,:condition,:shippingfee,:shipfrom,:shipping_date,:price,:status,:size_id,:brand_id,:seller_id,:buyer_id)
  end
end
