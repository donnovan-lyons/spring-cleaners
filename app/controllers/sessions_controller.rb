class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]

  def new
    render :layout => "beforelogin"
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(current_user)
    else
      flash[:alert] = "Username/password combination is invalid"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def registration_check
    if session.include? :user_id
      user = User.find(:user_id)
      if !(user.cleaner) || !(user.customer)
        redirect_to users_path
      end
    end
  end
end
