class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def new
  end

  def create
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

end

private
def product_params
  params.require(:product).permit(:name, :detail,:condition,:delivery_fee,:shipping_area,:shipping_days,:price,:existence,:created_at,:updated_at)
end