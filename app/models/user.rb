class User < ApplicationRecord
    validates :email, :password, :sub_class,  presence: true
    validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

    has_secure_password

    has_one :cleaner
    has_one :customer

    SUB_CLASSES = ["Cleaner","Customer"]

end
