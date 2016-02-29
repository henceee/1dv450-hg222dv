class SessionController < ApplicationController
    include SessionHelper
    
    def login
        u = User.find_by_email(params[:email])
        if u && u.authenticate(params[:password])
              session[:userid] = u.id
              if(admin?)
                  redirect_to apikeyadmin_path
              else
                  redirect_to apikey_path
              end
        else      
            flash[:notice] = "Incorrect login details."
            redirect_to root_path
        end
    end
    
    def logout
        session[:userid] = nil
        redirect_to root_path, notice: "You've been logged out"
    end
end
