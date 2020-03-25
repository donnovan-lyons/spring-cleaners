class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create

  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :phone, :whatsapp, address: [:street_address, :apt_num, :neighborhood, :city])
  end
end