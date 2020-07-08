class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    if @user.valid?
      redirect_to '/'
    else
      byebug
      flash[:errors] = @user.errors.full_messages
    end
  end

  def sign_in
  end

  def handle_sign_in
    byebug
    # @user = User.find_by(email: params[:user][:email])
    # @user.password ==
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
