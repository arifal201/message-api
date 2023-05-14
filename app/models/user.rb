class User < ApplicationRecord
  # encrypt password
  has_secure_password

  validates :email, uniqueness: true
end
