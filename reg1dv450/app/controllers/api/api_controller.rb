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
                authenticate_or_request_with_http_token do |token, options|
                appkey = Application.find_by(key: token)
                if(appkey.nil?)
                    render status: 401, json: { message: "Incorrect credentials, check your key." }
                else
                    #If the user is a creator, set session to assign current_user
                    if Creator.find_by_id(appkey.user_id)
                        session[:creatorid] = appkey.user_id
                    end
                end
            end
        end

        def offset_limit_params
            @offset = params[:offset].to_i  if params[:offset].present?
            @limit  = params[:limit].to_i   if params[:limit].present?
        end
    end
end