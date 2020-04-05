class CustomersController < ApplicationController
  def new
    @customer = Customer.new
  end

  def create
    @customer = current_user.customer.build(customer_params)
    if @customer.save
      flash[:notice] = "Thanks for signing up!"
      redirect_to customer_path(@customer)
    else
      render :new
      flash[:alert] = "Your registration could not be completed"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:first_name, :last_name, :phone, :whatsapp, address: [:street_address, :neighborhood, :city])
  end

  def require_login
    return head(:forbidden) unless session.include? :user_id
  end
end
