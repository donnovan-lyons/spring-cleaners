class CleanersController < ApplicationController
  skip_before_action :require_login

  def new
    @cleaner = Cleaner.new
  end

  def index
    redirect_to new_cleaner_path
  end

  def create
    @institution = Institution.find_or_create_by(name: params[:cleaner][:institution_name])
    @cleaner = current_user.build_cleaner(cleaner_params)
    @cleaner.institution_id = @institution.id
    if @cleaner.save
      flash[:notice] = "Thanks for signing up!"
      redirect_to cleaner_path(@cleaner)
    else
      render :new
      flash[:alert] = "Your registration could not be completed"
    end
  end

  def show
    @cleaner = Cleaner.find(params[:id])
  end

  private

  def cleaner_params
    params.require(:cleaner).permit(:first_name, :last_name, :phone, :whatsapp, address: [:neighborhood, :city])
  end

end
