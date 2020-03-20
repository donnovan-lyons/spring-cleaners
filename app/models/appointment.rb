class Appointment < ApplicationRecord
    belongs_to :cleaner
    belongs_to :customer
end
