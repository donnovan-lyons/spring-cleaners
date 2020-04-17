class AppointmentsController < ApplicationController
    include AppointmentsHelper

    def new
        @customer = Customer.find(params[:customer_id])
        @appointment = @customer.appointments.build
    end

    def create
        @customer = Customer.find(params[:customer_id])
        date_time = convert(appointment_params[:date_start_time])
        times = time_slot(date_time[1], appointment_params[:end_time])
        @appointment = @customer.appointments.build(details: appointment_params[:details], time_slot: times, date: date_time[0])
        if @appointment.save
            redirect_to customer_appointments_path(@customer)
        else
            render :new
        end
    end

    def edit
        @appointment = Appointment.find(params[:id])
    end

    def update
        @appointment = Appointment.find(params[:id])
        date_time = convert(appointment_params[:date_start_time])
        times = time_slot(date_time[1], appointment_params[:end_time])
        if @appointment.update(details: appointment_params[:details], time_slot: times, date: date_time[0])
            redirect_to customer_appointments_path(@appointment.customer)
        else
            render :edit
        end
    end

    def destroy
        Appointment.find(params[:id]).destroy
        redirect_to customer_appointments_path(current_user.customer)
    end

    def index
        @customer = Customer.find(params[:customer_id])
        @appointments = @customer.appointments
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

    private

    def appointment_params
        params.require(:appointment).permit(:date_start_time, :end_time, :details)
    end
    
end
