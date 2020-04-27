class HomeController < ApplicationController
  def index
    @products = Product.includes(:product_images).order('created_at DESC').limit(3)
    @category_parent = Category.where(ancestry: nil)
    @category = Category.where(ancestry: params[:id])

    
  
  end
end

  