class CategoriesController < ApplicationController
  def index
    @categories = Category.new
    @category = Category.children.build
  end

  def show
    @category = Category.find(params[:id])
    @categories = @category.subcategories
    render :action => :index
  end

  def new
    @category = Category.new
  end

  def category_params
    params.require(:category).permit(:name, :parent_id)
  end

  def parent
    @child = my_cat.children
  end
end
