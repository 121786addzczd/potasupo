class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :score, presence: true
  validates :user_id, uniqueness: { scope: :spot_id }

  def user_review_score_percentage
    unless self.empty?
      reviews.average(:score).round(1).to_f * 100 / 5
    else
      0.0
    end
  end
end
