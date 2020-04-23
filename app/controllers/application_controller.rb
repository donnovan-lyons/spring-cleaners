class ApplicationController < ActionController::Base
    before_action :require_login

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    if session.include? :user_id
      user = User.find(session[:user_id])
      if !(user.cleaner) && !(user.customer)
        if user.sub_class == "Cleaner"
          redirect_to new_cleaner_path
        else
          redirect_to new_customer_path
        end
      end
    else
      redirect_to root_path, notice: "You must be signed in to do that!"
    end
  end

  helper_method :current_user

end
