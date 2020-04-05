class ApplicationController < ActionController::Base
    helper_method :current_user
    helper_method :logged_in?
    # helper_method :authorized?(id)

  def logged_in?
    !!session[:user_id]
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end

  def authorized?(id)
    current_user.id == id
  end 
end
