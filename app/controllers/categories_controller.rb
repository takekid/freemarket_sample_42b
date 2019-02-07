class CategoriesController < ApplicationController

  def index
    @categories = Category.new
    @category = Category.children.build
    @categories = Category.where(parent_id: nil)
  end

  def show
    @mens_category  = Item.includes(:category).where(category_id: self.category_params)
    @category = Category.includes(:items).find(params[:id])
    @search = Item.ransack(params[:q])
  end

  def new
    @category = Category.new
  end

  def category_params
    @category = Category.includes(:items).find(params[:id])
  end

  def parent
    @child = my_cat.children
  end

end
