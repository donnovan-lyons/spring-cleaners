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

  # def create_with_facebook
  #   @user = User.find_or_create_by(uid: auth['uid']) do |u|
  #     u.name = auth['info']['name']
  #     u.email = auth['info']['email']
  #     u.image = auth['info']['image']
  #   end
 
  #   session[:user_id] = @user.id
 
  #   render 'welcome/home'
  # end

  def destroy
    session.clear
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
