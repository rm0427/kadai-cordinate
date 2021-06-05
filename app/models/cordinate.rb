class Cordinate < ApplicationRecord
  belongs_to :user
  
  validates :title, presence: true, length: { maximum: 50 }
  validates :tops, presence: true, length: { maximum: 50 }
  validates :bottoms, presence: true, length: { maximum: 50 }
  validates :shoes, presence: true, length: { maximum: 50 }
  validates :bag, presence: true, length: { maximum: 50 }
  validates :image, presence:true
  
  has_one_attached :image
  
  has_many :favorites, dependent: :destroy
  has_many :users, through: :favorites
end
