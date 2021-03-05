class Game < ApplicationRecord
  belongs_to :creator, foreign_key: :creator_id, class_name: 'User'
  belongs_to :joiner, foreign_key: :joiner_id, class_name: 'User', optional: true

  has_many :moves, dependent: :destroy
end
