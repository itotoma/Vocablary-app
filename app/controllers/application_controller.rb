class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
 
 def after_sign_in_path_for(resource)
    '/home/index'
 end
 
 private
  def get_sign_in_user
        #utilize devise helper 
        @current_user = current_user
  end
    
end
