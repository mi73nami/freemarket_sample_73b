class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
    @product = Product.new
    @product.product_images.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @product = Product.find(1) #(@products.ids) #(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def purchase
  end

  private
  def product_params
    params.require(:product).permit(:name, :detail,:condition,:delivery_fee,:shipping_area,:shipping_days,:price,:existence,product_images_attributes: [:image]).merge(user_id: current_user.id)
  end

end