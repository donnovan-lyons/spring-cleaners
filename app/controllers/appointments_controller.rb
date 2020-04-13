class AppointmentsController < ApplicationController

    def new
        @customer = Customer.find(params[:customer_id])
        @appointment = @customer.appointments.build
    end

    def cleaner_index
        @cleaner = Cleaner.find(params[:cleaner_id])   
    end

    def cleaner_new
        @cleaner = Cleaner.find(params[:cleaner_id])
    end

    def cleaner_edit
        @cleaner = Cleaner.find(params[:cleaner_id])
    end

    def customer_index
        @customer = Customer.find(params[:customer_id])
    end

    def customer_new
        @customer = Customer.find(params[:customer_id])
        @appointment = Appointment.new
    end

    def customer_edit
        @customer = Customer.find(params[:customer_id])
    end

    private

    def appointment_params
        params.require(:appointment).permit(:date, :time_slot, :details)
    end
    
end
