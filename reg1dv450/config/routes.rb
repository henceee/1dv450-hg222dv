Rails.application.routes.draw do
  
  namespace :api, defaults: {format: 'json'} do
    
    resources :shows,   only:[:index,:create, :show, :update, :destroy] 
    resources :artists, only:[:index,:create, :show, :update, :destroy] 
    resources :venues,  only:[:index,:create, :show, :update, :destroy] 
    
    resources :shows do
      resources :shows
    end
  end
  
  root 'users#index'
  
  get 'users'                => 'users#index'
  get 'users/new'            => 'users#new',       as: :new_user
  post 'users'               => 'users#create'

  
  get 'apikeys'              => 'apikeys#show',    as: :apikey
  get 'apikeys/new'          => 'apikeys#new_app', as: :new_api
  post 'apikeys/new'         =>  'apikeys#create', as: :create_api
  get 'apikeysadmin'         => 'apikeys#admin',   as: :apikeyadmin
  get 'apikeys/:id'          => 'apikeys#show_app',as: :showapp
  get 'apikeys/delete/:id'   => 'apikeys#destroy', as: :destroyapp
  
  post 'login'    => 'session#login', as: :login
  get  'logout'   => 'session#logout', as: :logout
  
  
end
