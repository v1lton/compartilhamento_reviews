class TeachingRelationship < ApplicationRecord
  belongs_to :user
  belongs_to :professor, class_name: "Professor"
  validates :user_id, presence: true
  validates :professor_id, presence: true
end
