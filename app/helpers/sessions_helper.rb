module SessionsHelper
    def current_user
        @current_user ||= User.find_by(username: session[:username]) if session[:username]
      end
    
      def logged_in?
        !current_user.nil?
      end
    
      def autheticate_user      
        if logged_in?
         flash[:alert] = 'You need to be logged in.'
          redirect_to login_path
        else
          return_to login_path
        end
    end
end
