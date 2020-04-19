class Appointment < ApplicationRecord
    validates :date, :time_slot,  presence: true
    belongs_to :cleaner, optional: true
    belongs_to :customer

    STATUS = ["Pending","Confirmed", "Completed"]

    def location
        "#{customer.address["neighborhood"]}, #{customer.address["city"]}"
    end

    def self.all_pending
        all.select { |appt| appt.cleaner == nil }
    end
end
