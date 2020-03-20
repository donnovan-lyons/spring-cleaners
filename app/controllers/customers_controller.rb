class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      session[:customer_id] = @customer.id
      flash[:notice] = "Thanks for signing up!"
      redirect_to customer_path(customer)
    else
      render :new
      flash[:alert] = "Your registration could not be completed"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :email, :password, :password_confirmation, :street, :house_number, :apt_number, :neighborhood, :city, :phone)
  end
end