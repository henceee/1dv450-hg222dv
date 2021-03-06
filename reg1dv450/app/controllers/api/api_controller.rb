module Api
    class ApiController < ApplicationController
        
        ### FOR TESTING PURPOSES ONLY! ####
        skip_before_filter :verify_authenticity_token
        ###################################
        
        respond_to :json, :xml
        protect_from_forgery with: :null_session
        before_filter :restrict_access
        include SessionHelper
        
        OFFSET = 0
        LIMIT = 15
        
        def offset_params
        @offset = params[:offset].to_i if params[:offset].present?
        @limit = params[:limit].to_i if params[:limit].present?
        end
       
        def current_creator
           @current_creator ||= Creator.find_by_id(session[:creatorid])  if session[:creatorid]
        end
     
        
        def restrict_access
            if params[:key].present?
                appkey = Application.find_by(key: params[:key])
                if(appkey.nil?)
                    render status: 401, json: { message: "Incorrect credentials, check your key." }
                else
                    #If the user is a creator, set session to assign current_user
                    if Creator.find_by_id(appkey.user_id)
                        session[:creatorid] = appkey.user_id
                    end
                end
            else
                 render status: 401, json: { message: "Incorrect credentials, please add key." }
            end
        end

        def offset_limit_params
            if params[:offset].present?
              @offset = params[:offset].to_i
            end
            if params[:limit].present?
              @limit = params[:limit].to_i
            end
            @offset ||= OFFSET
            @limit  ||= LIMIT
        end
    end
    
    def creator?
        current_creator.present?
    end
end