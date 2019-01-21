class ItemsController < ApplicationController
  def index
    @items = Item.all.limit(3).includes(:item_images)
  end

  def show
  end

  def sell
  end
end
