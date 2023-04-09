class Review < ApplicationRecord
  has_one :professor
  belongs_to :user
  has_one :category

  scope :filter_by_category, -> (category_id) { where(category_id: category_id) }
end
