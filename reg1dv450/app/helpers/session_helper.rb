module SessionHelper
    
    # Returns true if the user is logged in, false otherwise.
    def require_login
        unless logged_in?
          redirect_to root_path 
        end
    end
    
    # Returns the current logged-in user (if any).
    def current_user
        @current_user ||= User.find_by_id(session[:userid])  if session[:userid]
    end
    
    # Returns true if the user is logged in, false otherwise.
    def logged_in?
        !current_user.nil?
    end
    
    # Returns true if the user is logged in as admin, false otherwise.
    def admin?
         #warning: ADMIN must have id 0, rake db:seed to get admin and sample user
        logged_in? &&  current_user.admin
    end
    #
    def require_admin
        unless admin?
          redirect_to apikey_path
        end
    end
  
end
