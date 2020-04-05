class Institution < ApplicationRecord
    validates :name,  presence: true
    has_many :cleaners
end
