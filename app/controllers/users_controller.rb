class UsersController < ApplicationController
  # skip_before_action :auth_user, only: [:new, :create, :sign_in, :register]

  def index
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
   
    @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
     
      flash[:errors] = @user.errors.full_messages
    end
  end

  def sign_in
  end

  

  def register
    @user = User.new
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
