class User < ApplicationRecord
    validates :email, :password, :sub_class,  presence: true
    validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

    has_secure_password

    has_one :cleaner
    has_one :customer
    has_many :conversations, :foreign_key => :sender_id
    has_many :messages, through: :conversations

    SUB_CLASSES = ["Cleaner","Customer"]

    delegate :first_name, :last_name, :full_name, :to => :type

    def type
        if self.sub_class == "Cleaner"
            cleaner
        elsif self.sub_class == "Customer"
            customer
        end
    end

    def unread_count
        messages.count {|msg| msg.read == false}
    end

end
