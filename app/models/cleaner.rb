class Cleaner < ApplicationRecord
    validates :first_name, :last_name, :phone,  presence: true
    validates :first_name, :last_name, length: { minimum: 2 }

    belongs_to :user
    belongs_to :institution
    has_many :appointments
    has_many :customers, through: :appointments

    delegate :email, :password_digest, :to => :user

    def full_name
        "#{first_name} #{last_name}"
    end

    def confirmed_appts
        appointments.select{|appt| appt.status == Appointment::STATUS[1]}
    end

    def completed_appts
        appointments.select{|appt| appt.status == Appointment::STATUS[2]}
    end
end
