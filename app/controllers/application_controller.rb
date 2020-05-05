class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :set_parents
  
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == Rails.application.credentials[:basic_auth][:user] &&
      password == Rails.application.credentials[:basic_auth][:pass]
    end
  end

  def production?
    Rails.env.production?
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :email, :password, :last_name, :first_name, :ruby_last_name, :ruby_first_name, :birthdate ])
    #ここに記載しておけば、regstrations_controllerには記載しなくてよし。
  end

  def set_parents
    @category_parent = Category.where(ancestry: nil)  # データベースから、親カテゴリーのみ抽出し、配列化
  end


  

end