class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  attr_readonly :username

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :name, presence: true

  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  has_secure_password

  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy

  has_many :active_relationships, class_name: "Relationship",
                                  foreign_key: "follower_id",
                                  dependent: :destroy

  has_many :following, through: :active_relationships, source: :followed

  has_many :followers, through: :passive_relationships, source: :follower

  has_many :reviews

  has_many :teaching_relationships, foreign_key: "user_id", dependent: :destroy

  has_many :professors, through: :teaching_relationships

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

  # Adds a professor.
  def add_professor(professor)
    teaching_relationships.create(professor_id: professor.id)
  end

  # Removes a professor.
  def remove_professor(professor)
    teaching_relationship = teaching_relationships.find_by(professor_id: professor.id)
    teaching_relationship.destroy if teaching_relationship
  end

  # Returns true if the current user has the professor.
  def is_professor?(professor)
    professors.include?(professor)
  end

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
             BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
