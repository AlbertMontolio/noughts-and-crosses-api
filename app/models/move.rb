class Move < ApplicationRecord
  belongs_to :game
  belongs_to :user

  def type
    creator = self.game.creator
    if creator == User.first
      return 'cross'
    else 
      return 'noutgh'
    end
  end
end
