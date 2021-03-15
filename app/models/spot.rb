class Spot < ApplicationRecord
  has_many_attached :images, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, length: { maximum: 15 }, uniqueness: true
  validates :address, presence: true
  validates :images, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
end
