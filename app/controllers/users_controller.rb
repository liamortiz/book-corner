class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    byebug
  end

  def sign_in
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
