class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
    @product_image = Product_image.new
  end

  def create
    Product.create(product_params)
    redirect_to root_path

    # Product_image.create(product_image_params)
    # redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(:name, :detail,:condition,:delivery_fee,:shipping_area,:shipping_days,:price,:existence).merge(user_id: current_user.id)
  end

  def product_image_params
    params.require(:product_image).permit(:image).merge(:product_id)
  end
end




