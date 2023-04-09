class Professor < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :teaching_relationships, foreign_key: "professor_id", dependent: :destroy
  has_many :users, through: :teaching_relationships
end
