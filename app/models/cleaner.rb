class Cleaner < ApplicationRecord
    validates :first_name, :last_name, :phone,  presence: true
    validates :first_name, :last_name, length: { minimum: 2 }
    # validates address: [:neighborhood, :city],  presence: true

    belongs_to :user
    belongs_to :institution
    has_many :appointments
    has_many :customers, through: :appointments

    delegate :email, :password_digest, :to => :user
end
