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
    ### moves = moves.select { |move| move.type === player_type }
    x_groups = moves.select(:pos_x).group(:pos_x).count
    y_groups = moves.select(:pos_y).group(:pos_y).count

    x_groups.values.any?(3) || y_groups.values.any?(3) || slope_wins(moves)
  end

  def slope_wins(moves)
    # select the ones in a slope
    moves = moves.select { |move| move.pos_x.abs == move.pos_y.abs }
    center_clicked = moves.any? { |move| move.pos_x == 0 && move.pos_y == 0 }

    # the center square is necessary
    return false unless center_clicked

    # obtain moves in corners
    non_center_moves = moves.reject { |move| move.pos_x == 0 && move.pos_y == 0 }

    return false unless non_center_moves.any?

    opposites = non_center_moves.map do |non_center_move|
      pos_x = non_center_move.pos_x
      pos_y = non_center_move.pos_y

      moves.select { |move| move.pos_x == -pos_x && move.pos_y == -pos_y }.any?
    end

    opposites.any? true
  end
end
