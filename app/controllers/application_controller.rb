class ApplicationController < ActionController::Base
    def current_user
      @current_user ||= User.find_by(username: session[:username]) if session[:username]
    end
  
    def logged_in?
      !current_user.nil?
    end
  
    def authenticate_user      
      return if logged_in?
      redirect_to login_path
    end
end
