class UsersController < ApplicationController
    before_action :set_user, only: [:show, :details]

    def index
        @users = User.all
    end

    def show
    end

    def details
      if !session[:user_id]
        redirect_to(posts_path)
      end
    end

    def new
        @user = User.new
    end

    def create
      user = User.new(user_params)

      if user.save
        session[:user_id] = user.id
        flash[:success] = "You have successfully logged in."
        redirect_to user_path(user.id)
      else
        flash[:warning] = "Incorrect email or password"
        redirect_to '/signup'
      end

    end

    private

    def set_user
        @user = User.find(params[:id])
    end

    def user_params
        params.require(:user).permit(:name, :email, :img_url, :password, :password_confirmation, :bio)
    end


end