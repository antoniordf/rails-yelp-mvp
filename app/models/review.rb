class Review < ApplicationRecord
  belongs_to :restaurant

  validates :content, :rating, presence: true
  validates :rating, numericality: { only_integer: true }
  validates :rating, numericality: { in: 0..5 }
end
