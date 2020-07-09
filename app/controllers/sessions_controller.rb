class SessionsController < ApplicationController
    def create
        user = User.find_by(email: params[:session][:email])
        if user && user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          redirect_to user_path(user)
        else
          flash[:errors] = "Wrong email and/or password"
          redirect_to sign_in_path
        end
    end

    def logout
        session.delete(:user_id)
        redirect_to '/'
    end



end
