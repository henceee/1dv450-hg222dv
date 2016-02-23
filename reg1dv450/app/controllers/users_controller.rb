class UsersController < ApplicationController
   
    def index
        #DEL, DO SOMEETHING ELSE HERE.
        @users = User.all
        #render:json => @users
    end
    
    
    def new
        @user = User.new
    end
    
    
    def create
        @user = User.new(user_params)
         # No admin page for handling users yet
        @user.admin = false
        if @user.save
            redirect_to root_path
        else
           render :action=>'new'
        end
    end
    
    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
end


