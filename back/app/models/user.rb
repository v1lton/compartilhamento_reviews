class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  attr_readonly :username

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  validates :name, presence: true

  validates :password, presence: true, length: { minimum: 6 }

  has_secure_password
end
