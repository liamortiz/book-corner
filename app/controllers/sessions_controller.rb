class SessionsController < ApplicationController

    # def login 
    # end 

    def create
        # byebug
        user = User.find_by(email: params[:session][:email])
    
        if user.authenticate(params[:session][:password])
          session[:user_id] = user.id
          redirect_to user_path(user.id)
        else  
          redirect_to new_login_path
        end 
    end


    def logout
        session.delete(:user_id)
        redirect_to '/'
    end

       
    
end
