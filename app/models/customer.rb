class Customer < ApplicationRecord
    validates :first_name, :last_name, presence: true
    validates :first_name, :last_name, length: { minimum: 2 }

    belongs_to :user
    has_many :appointments
    has_many :cleaners, through: :appointments

    delegate :username, :email, :password_digest, :to => :user
end
