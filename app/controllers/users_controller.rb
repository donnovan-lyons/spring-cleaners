class UsersController < ApplicationController
  skip_before_action :require_login, except: [:show]

  def index
    redirect_to new_user_path
  end
  
  def new
    @user = User.new
    render :layout => "beforelogin"
  end

  def create
    byebug
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      if @user.sub_class == "Cleaner"
        redirect_to new_cleaner_path
      else
        redirect_to new_customer_path
      end
    else
      render :new, :layout => "beforelogin"
      flash[:alert] = "Your registration could not be completed"
    end
  end

  def show
    if current_user.sub_class == "Cleaner"
      redirect_to cleaner_path(current_user.cleaner)
    else
      redirect_to customer_path(current_user.customer)
    end
  end

  def my_account
    
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :sub_class)
  end
end
