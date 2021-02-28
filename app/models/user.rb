class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true
  # add validations in the future
end
