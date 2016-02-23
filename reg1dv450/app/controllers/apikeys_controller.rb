class ApikeysController < ApplicationController
    
    include SessionHelper
    
    before_action :require_login
    before_action :require_admin, only: [:admin]
    
    def show_app
        @app = Application.find_by_id(params[:id])
        if(@app == nil)
            redirect_to apikey_path
        end
    end
    
    def new_app
        @app = Application.new
    end
    
    
    def create
        
        @app = Application.new(app_params)
        if @app.save
            @current_user.applications << @app
            redirect_to apikey_path, notice: "Application saved"
        else
            render :action=>'new_app'
        end
    end
    
    def app_params
     params.require(:application).permit(:user_id,:name,:key)
    end
    
    def show
        @user = current_user
    end
    
    def destroy
        @app = Application.find_by_id(params[:id]).destroy

       redirect_to apikeyadmin_path, notice: "App deleted"

    end
    
    def admin
        @users = User.all
    end
    
    
   
    
end
