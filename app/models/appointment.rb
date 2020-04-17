class Appointment < ApplicationRecord
    validates :date, :time_slot,  presence: true
    belongs_to :cleaner, optional: true
    belongs_to :customer

    def self.all_unassigned
        all.select { |appt| appt.cleaner == nil }
    end
end
