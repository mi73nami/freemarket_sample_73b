class ApplicationController < ActionController::Base
  before_action :basic_auth, if: :production?
  before_action :set_ancestry
  before_action :set_categories
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
  end

  def set_ancestry
    @parents = Category.where(ancestry: nil)
  end

  def set_categories
    @main_categories = Category.where(sub: '0')
    @sub_categories = Category.where(sub: params[:parent], sub_sub: '0')
    @sub_sub_categories = Category.where(sub: params[:child], sub_sub: params[:grandChild])
    respond_to do |format|
      format.html
      format.json
    end
  end

end