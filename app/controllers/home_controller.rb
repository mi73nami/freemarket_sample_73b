class HomeController < ApplicationController
  def index
    @products = Product.all
    @parents = Category.all.order("id ASC").limit(2)
  end
end
