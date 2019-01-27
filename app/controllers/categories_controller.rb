class CategoriesController < ApplicationController
  def index
    @categories = Category.where("perent_id IS NULL")
    @category = Category.new
  end

  def show
    @category = Category.find(params[:id])
    @categories = @category.subcategories
    render :action => :index
  end

  def get_subscategories
    @subscategories = Category.where(:parent_id => params[:perent_id])
    render :partial => "subscategories", :object => @subscategories
  end

  def new
    @category = Category.new
  end
end
