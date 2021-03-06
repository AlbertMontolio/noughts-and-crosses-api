class MovesController < ApplicationController
  def create
    pos_x = params[:posX]
    pos_y = params[:posY]
    game = Game.find(params[:game_id])

    move = Move.new(pos_x: pos_x, pos_y: pos_y)
    move.game = game
    move.user = current_user
    move.save

    ### check if winner
    response = { isWinner: is_winner(move) }
    json_response response
  end

  private

  def is_winner(move)
    player_type = move.type
    game = move.game
    
    moves = game.moves
    moves.select { |move| move.type === player_type }
    x_groups = moves.select(:pos_x).group(:pos_x).count
    y_groups = moves.select(:pos_y).group(:pos_y).count

    x_groups.values.any?(3) || y_groups.values.any?(3) || (x_groups.values.all?(1) && x_groups.keys.length == 3)
  end
end
