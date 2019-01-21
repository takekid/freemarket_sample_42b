class ItemsController < ApplicationController
  def index
    @items = Item.includes(:item_images,:category).order("updated_at DESC").all.limit(3)
  end

  def show
  end

  def sell
  end
end
