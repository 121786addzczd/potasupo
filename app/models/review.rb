class Review < ApplicationRecord
  belongs_to :user
  belongs_to :spot

  validates :score, presence: true
  validates :user_id, uniqueness: { scope: :spot_id }
end
