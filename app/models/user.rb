class User < ApplicationRecord
  has_secure_password
  validates :email, uniqueness: true

  has_many :created_games, foreign_key: :creator_id, class_name: 'Game', dependent: :destroy
  has_many :joined_games, foreign_key: :joiner_id, class_name: 'Game', dependent: :destroy
end
