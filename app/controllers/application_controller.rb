class ApplicationController < ActionController::Base
    add_flash_types :success, :error, :warning, :info
    include ApplicationHelper
    
    def redirect_if_not_logged_in
        redirect_to signup_path if !logged_in?
    end

  
    def redirect_if_logged_in
        redirect_to user_path(current_user) if logged_in?
    end
    def logged_in?
        !!session[:user_id]
    end
    def current_user
        @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

end
