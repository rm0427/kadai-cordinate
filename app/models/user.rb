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
  has_many :favorites
  has_many :likes, through: :favorites, source: :cordinate
    
  def like(other_cordinate)
    self.favorites.find_or_create_by(cordinate_id: other_cordinate.id)
  end
  
  def unlike(other_cordinate)
    favorite = self.favorites.find_by(cordinate_id: other_cordinate.id)
    favorite.destroy if favorite
  end
  
  def like?(other_cordinate)
    self.likes.include?(other_cordinate)
  end
end
