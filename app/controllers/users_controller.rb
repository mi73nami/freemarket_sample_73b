class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    User.create(user_params)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  private
  def user_params
    params.require(:user).permit(:image, :text).merge(user_id: current_user.id)
  end

end
