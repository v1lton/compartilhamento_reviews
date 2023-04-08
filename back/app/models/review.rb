class Review < ApplicationRecord
  has_one :professor
  belongs_to :user
  has_one :category

  scope :filter_by_category, -> (category) { where(category: category) }
end
