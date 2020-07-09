class UsersController < ApplicationController
  $avatar_array = ["avatar_1.jpg","avatar_2.jpg","avatar_3.jpg"]

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # byebug
    @user = User.create(user_params)
    @user.update(avatar_url: $avatar_array.sample)

    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to '/'
    end
  end

  def sign_in
  end

  def register
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
