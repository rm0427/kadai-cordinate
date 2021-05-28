class User < ApplicationRecord
    scope :users, -> { where(admin: false) }
    scope :admins, -> { where(admin: true) }
    
    before_save { self.email.downcase! }
    validates :name, presence: true, length: { maximum: 20 }
    validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
    has_secure_password
    
    has_many :cordinates
end
