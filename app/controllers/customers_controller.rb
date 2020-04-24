class CustomersController < ApplicationController
  skip_before_action :require_login

  def new
    @customer = Customer.new
  end

  def index
    redirect_to new_customer_path
  end

  def create
    @customer = current_user.build_customer(customer_params)
    if @customer.save
      flash[:notice] = "Welcome to Spring Cleaners."
      redirect_to customer_path(@customer)
    else
      render :new
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone, :whatsapp, address: [:street_address, :neighborhood, :city])
  end
end
