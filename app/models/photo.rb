class Photo < ApplicationRecord
  has_one_attached :image
  validates :image, :title, presence: true
end
