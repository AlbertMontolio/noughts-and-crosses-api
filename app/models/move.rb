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

  def is_winner?
    player_type = self.type
    game = self.game
    
    moves = game.moves.joins(:user).where(users: { id: self.user_id })
    moves.select { |move| move.type === player_type }
    x_groups = moves.select(:pos_x).group(:pos_x).count
    y_groups = moves.select(:pos_y).group(:pos_y).count

    x_groups.values.any?(3) || y_groups.values.any?(3) || (x_groups.values.all?(1) && x_groups.keys.length == 3)
  end
end
