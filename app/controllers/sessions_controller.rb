class SessionsController < ApplicationController

    # def login 
    # end 

    # def create
    #     user = User.find_by(name: params[:session][:name])
    
    #     if user.authenticate(params[:session][:password])
    #       session[:user_id] = user.id
    #       redirect_to user
    #     else  
    #       redirect_to new_login_path
    #     end 
    # end

    # def logout
    #     # session[:user_id] = nil
    #     session.delete(:user_id)
    
    #     redirect_to users_path
    #   end 

    def logout
        session.delete(:user_id)
        redirect_to '/'
    end

       
    
end
