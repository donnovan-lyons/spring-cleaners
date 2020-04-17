module AppointmentsHelper

    def convert(date_time)
        # byebug
        date = Date.parse(date_time)
        start_time = DateTime.parse(date_time).strftime("%I:%M %p")
        [date, start_time[1..-1]]
    end

    def time_slot(start_time, end_time)
        start_time + " - " + end_time
    end

    def get_date_start(appointment)
        date = appointment.date.strftime("%B %d, %Y")
        start_time = appointment.time_slot.split(" - ")[0]
        "#{date} #{start_time}"
    end

    def get_end_time(appointment)
        appointment.time_slot.split(" - ")[1]
    end
end
