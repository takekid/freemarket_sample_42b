class ItemsController < ApplicationController
  def index
    @ladys_category = Item.includes(:category).where(category_id: 1).limit(3).newest
    @mens_category  = Item.includes(:category).where(category_id: 2).limit(3).newest
    @kids_category  = Item.includes(:category).where(category_id: 3).limit(3).newest
    @chanel_brand   = Item.includes(:brand).where(brand_id: 8).limit(3).newest
    @nike_brand     = Item.includes(:brand).where(brand_id: 1).limit(3).newest
    @adidas_brand   = Item.includes(:brand).where(brand_id: 2).limit(3).newest
  end

  def show
    @item  = Item.includes(:category, :item_images, :brand, :size, :seller).find(params[:id])
    @nike_brand     = Item.includes(:brand).where(brand_id: 1).limit(6).newest
    @adidas_brand   = Item.includes(:brand).where(brand_id: 2).limit(6).newest
  end

  def sell
  end
end
