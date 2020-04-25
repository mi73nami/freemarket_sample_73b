class HomeController < ApplicationController
  def index
    @products = Product.all
    @parents = Category.where(ancestry: nil)
    @categories = Category.where(ancestry: params[:id])
  end

end
