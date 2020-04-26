class HomeController < ApplicationController
  def index
    @products = Product.all
    @category_parent = Category.where(ancestry: nil)
    @category = Category.where(ancestry: params[:id])

    
  
  end
end

  