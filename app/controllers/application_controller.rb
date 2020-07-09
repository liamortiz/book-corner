class ApplicationController < ActionController::Base
   before_action :auth_user

    def auth_user
      redirect_to '/' unless set_user
    end

    def set_user
      @current_user = User.find_by(id: session[:user_id])
    end
end
