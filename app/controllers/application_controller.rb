class ApplicationController < ActionController::Base
  before_action :store_location
  protect_from_forgery with: :exception

  def store_location
    # if request.fullpath != "/users/sign_in" &&
    #     request.fullpath != "/users/sign_up" &&
    #     request.fullpath !~ Regexp.new("\\A/users/password.*\\z") &&
    #     !request.xhr? # don't store ajax calls
    #   session[:previous_url] = request.fullpath
    # end
  end
  def after_sign_in_path_for(resource)
    session[:previous_url] || root_path
  end

  def after_sign_out_path_for(resource)
    session[:previous_url] || root_path
  end

  # def current_user
  #   # @current_user = current_user
  # end

  # def logged_in?
  #   !!session[:user_id]
  # end
  #
  # def authenticate
  #   return if logged_in?
  #   redirect_to root_path, alert: 'ログインしてください'
  # end

end
