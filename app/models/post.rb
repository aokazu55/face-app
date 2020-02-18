class Post < ApplicationRecord
  belongs_to :user, optional: true
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
  mount_uploader :image, ImageUploader

  validates :title,  presence: true
  validates :content,  presence: true
  validates :image,  presence: true
end
