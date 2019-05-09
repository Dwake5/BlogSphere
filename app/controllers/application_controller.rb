class ApplicationController < ActionController::Base
    helper_method :current_user, :user_signed_in?, :authenticate_user, :signif

    def current_user
        @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
    end

    def authenticate_user!
        redirect_to login_path unless current_user
    end

    def user_signed_in?
      !!session[:user_id]
    end

    def signif(signs)
      Float("%.#{signs}g" % self)
    end
end
