class CategoriesController < ApplicationController
  before_action :set_parents

  def index
  end

  def show
    @products = Product.joins(:categories).where(categories: {id: params[:id]})
    @category = Category.find(params[:id])
  end

  private
  def set_parents
    @category_parent = Category.where(ancestry: nil) 
  end

end

