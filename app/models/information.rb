class Information < ApplicationRecord
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :title
    validates :description
  end
end
