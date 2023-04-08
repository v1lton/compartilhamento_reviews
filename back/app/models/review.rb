class Review < ApplicationRecord
  has_one :professor
  belongs_to :user
  has_one :category
end
