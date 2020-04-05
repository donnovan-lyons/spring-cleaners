class Appointment < ApplicationRecord
    validates :date, :time_slot,  presence: true
    belongs_to :cleaner
    belongs_to :customer

    TIME_SLOTS = ["9AM - 1PM", "2PM - 6PM"]
end
