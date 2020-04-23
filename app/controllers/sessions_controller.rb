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

  def omniauthgoogle
    if user = User.from_omniauth(auth)
      session[:user_id] = user.id
      redirect_to user_path(current_user)
    else
      redirect_to new_user_path(email: auth.info.email)
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
