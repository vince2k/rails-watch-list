class List < ApplicationRecord
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks, dependent: :destroy

  has_one_attached :picture

  validates :name, presence: true, uniqueness: true
  # validates :image_url, presence: true
  validates :picture, presence: true
end
