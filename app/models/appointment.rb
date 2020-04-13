class Appointment < ApplicationRecord
    validates :date, :time_slot,  presence: true
    belongs_to :cleaner, optional: true
    belongs_to :customer

    TIME_SLOTS = ["9AM - 1PM", "2PM - 6PM"]
end
