class SessionsController < ApplicationController
  skip_before_action :require_login

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
      render :new, :layout => "beforelogin"
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end

  def omniauth
    if user = User.from_omniauth(auth)
      session[:user_id] = user.id
      redirect_to user_path(current_user)
    else
      redirect_to new_with_omniauth_path(email: auth.info.email, name: auth.info.name)
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
