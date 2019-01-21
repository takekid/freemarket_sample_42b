class ItemsController < ApplicationController
  def index
    @items = Item.includes(:item_images,:category,:brand).order("created_at DESC")
  end

  def show
  end

  def sell
  end
end
