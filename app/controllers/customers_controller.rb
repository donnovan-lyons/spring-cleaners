class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    
  end

  private

  def customer_params
    params.require(:customer).permit()
  end
end