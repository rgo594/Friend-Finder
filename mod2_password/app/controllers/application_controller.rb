class ApplicationController < ActionController::Base
  helper_method :current_user
  helper_method :current_user2

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def current_user2
    User.find(session[:user_id])
  end
end
