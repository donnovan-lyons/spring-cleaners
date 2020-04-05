class AppointmentsController < ApplicationController
    before_action :require_login

    def appointment_params
        params.require(:appointment).permit(:date, :time_slot, :details)
    end
    
end
