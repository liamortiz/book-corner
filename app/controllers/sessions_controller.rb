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

    def clear_session
        
            session[:count_it_out] = 0
            redirect_back fallback_location: books_path
        end

       
    
end
