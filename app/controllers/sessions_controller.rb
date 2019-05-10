class SessionsController < ApplicationController

    def new
      redirect_to(posts_path)
    end
  
    def create
      user = User.find_by(email: params[:email])
      if user && user.authenticate(params[:password])
       session[:user_id] = user.id
       flash[:success] = "Successfully Logged In!"
       redirect_back(fallback_location: posts_path)
      else
       flash[:warning] = "Incorrect username or password"
       redirect_back(fallback_location: posts_path)
      end
    end
  
    def destroy
       session[:user_id] = nil
       flash[:success] = "You have successfully logged out."
       redirect_back(fallback_location: posts_path)
    end
  
end
  