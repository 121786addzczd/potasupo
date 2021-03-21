class Spot < ApplicationRecord
  has_many_attached :images, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, length: { maximum: 15 }, uniqueness: true
  validates :address, presence: true
  validates :images, presence: true

  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def avg_score
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f
    else
      0.0
    end
  end

  def review_score_percentage
    unless self.reviews.empty?
      reviews.average(:score).round(1).to_f * 100 / 5
    else
      0.0
    end
  end
end
