class CleanersController < ApplicationController
  def new
    @cleaner = Cleaner.new
  end

  def create

  end

  private

  def cleaner_params
    params.require(:cleaner).permit()
  end
end
