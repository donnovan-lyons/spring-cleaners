class User < ApplicationRecord
    validates :username, :email, :password,  presence: true
    validates :email, uniqueness: true
    validates :first_name, :last_name, length: { minimum: 2 }
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
    has_secure_password

    has_many :cleaners
    has_many :customers
end
