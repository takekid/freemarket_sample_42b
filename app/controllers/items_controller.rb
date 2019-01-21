class ItemsController < ApplicationController
  def index
    @items = Item.all.limit(3)
  end

  def show
  end

  def sell
  end
end
