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
    @nike_brand     = Item.includes(:brand).where(brand_id: NIKE_BRAND_ID).limit(6).newest
    @adidas_brand   = Item.includes(:brand).where(brand_id: ADIDAS_BRAND_ID).limit(6).newest
  end

  def sell
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    # if item.seller_id == current_user.id ログイン実装完了後に指定
    item.update(item_params)

    redirect_to item_path
    # end ログイン実装完了後に指定
  end

  private
  def item_params
  params.require(:item).permit(:name,:category_id,:introduction,:condition,:shippingfee,:shipfrom,:shipping_date,:price,:status,:size_id,:brand_id,:seller_id,:buyer_id)
  end

end
