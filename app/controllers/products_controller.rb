class ProductsController < ApplicationController
  before_action :move_to_index, except: [:show]

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
      flash[:alert] = '投稿に失敗しました'
      redirect_to action: 'new'
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
    product = Product.find(params[:id])
    if product.user_id == current_user.id
      if product.update(product_params)
        redirect_to product_path(product.id)
      else
        flash[:alert] = '投稿に失敗しました'
        redirect_to action: 'edit'
      end
    else
      render product_path(@product.id)
    end
  end

  def destroy
    product = Product.find(params[:id])
    if product.destroy
      redirect_to root_path, notice: '削除しました'
    else
      render :edit
    end
  end

  def buy
#商品/ユーザー/クレジットカードの変数設定
    @user = current_user
    @creditcard = CreditCard.where(user_id: current_user.id).first
    @address = ShipAddress.where(user_id: current_user.id).first
    @product = Product.find(params[:id])
#Payjpの秘密鍵を取得
    Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
#Payjpから顧客情報を取得し表示
    customer = Payjp::Customer.retrieve(@creditcard.customer_id)
    @creditcard_information = customer.cards.retrieve(@creditcard.card_id)
    @card_brand = @creditcard_information.brand 
    case @card_brand
    when "Visa"
      @card_src = "visa.svg"
    when "JCB"
      @card_src = "jcb.svg"
    when "MasterCard"
      @card_src = "master-card.svg"
    when "American Express"
      @card_src = "american_express.svg"
    when "Diners Club"
      @card_src = "dinersclub.svg"
    when "Discover"
      @card_src = "discover.svg"
    end
  end

  def purchase
#クレジットカードと製品の変数を設定
    @creditcard = CreditCard.where(user_id: current_user.id).first
    @product = Product.find(params[:id])
#Payjpの秘密鍵を取得
    Payjp.api_key= ENV["PAYJP_PRIVATE_KEY"]
#payjp経由で支払いを実行
    charge = Payjp::Charge.create(
      amount: @product.price,
      customer: Payjp::Customer.retrieve(@creditcard.customer_id),
      currency: 'jpy'
    )
#製品のbuyer_idを付与
    @product_buyer= Product.find(params[:id])
    @product_buyer.update( buyer_id: current_user.id)
    redirect_to root_path, notice: '購入しました'
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  private
  def product_params
    params.require(:product).permit(:name, :detail,:condition,:category_id,:delivery_fee,:shipping_area,:shipping_days,:price,product_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to root_path unless user_signed_in?
  end

end