class HomeController < ApplicationController
  def index
    @products = Product.all
    @parents = Category.where(ancestry: nil)
    @categories = Category.where(ancestry: params[:id])

    @main_categories = Category.where(sub: '0')
    @sub_categories = Category.where(sub: params[:parent], sub_sub: '0')
    @sub_sub_categories = Category.where(sub: params[:child], sub_sub: params[:grandChild])
    respond_to do |format|
      format.html
      format.json
    end
  
  end

end
