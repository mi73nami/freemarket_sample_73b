class ProductsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]

  def index
    @products = Product.includes(:product_images).order('created_at DESC').all
  end

  def new
    @product = Product.new
    @product.product_images.new
    @category_parent_array = ["選択してください"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      @product.product_images.new
      @category_parent_array = ["選択してください"]
      Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
      end
      render :new
    end
  end

  def show
    @product = Product.includes(:product_images).order('created_at DESC').find(params[:id])
    @categorys = Category.all
    @prefectures = Prefecture.all
  end

  def edit
    @product = Product.includes(:product_images).order('created_at DESC').find(params[:id])
    
    grandchild_category = @product.category
    child_category = grandchild_category.parent

    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
  end

  def update
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
      redirect_to root_path, notice: '削除しました'
    else
      render :edit
    end
  end

  def purchase
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private
  def product_params
    params.require(:product).permit(:name, :detail,:condition,:category_id,:delivery_fee,:shipping_area,:shipping_days,:price,product_images_attributes: [:src, :_destroy, :id, :product_id, :image]).merge(user_id: current_user.id, seller_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

end