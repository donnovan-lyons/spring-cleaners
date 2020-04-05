class CleanersController < ApplicationController
  before_action :require_login

  def new
    # raise current_user.inspect
    @cleaner = Cleaner.new
  end

  def create
    @cleaner = current_user.cleaner.build(cleaner_params)
    if @cleaner.save
      flash[:notice] = "Thanks for signing up!"
      redirect_to cleaner_path(@cleaner)
    else
      render :new
      flash[:alert] = "Your registration could not be completed"
    end
  end

  private

  def cleaner_params
    params.require(:cleaner).permit(:first_name, :last_name, :phone, :whatsapp, address: [:neighborhood, :city])
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
