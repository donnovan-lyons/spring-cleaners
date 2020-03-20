class CleanersController < ApplicationController
  def new
    @cleaner = Cleaner.new
  end

  def create
    @cleaner = Cleaner.new(cleaner_params)
    if @cleaner.save
      session[:cleaner_id] = @cleaner.id
      flash[:notice] = "Thanks for signing up!"
      redirect_to cleaner_path(cleaner)
    else
      render :new
      flash[:alert] = "Your registration could not be completed"
    end
  end

  private

  def cleaner_params
    params.require(:cleaner).permit(:first_name, :last_name, :yeshiva, :email, :password, :password_confirmation, :phone_number, :whatsapp)
  end
end
