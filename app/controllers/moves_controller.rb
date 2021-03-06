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
    json_response :ok
  end

  private

  def is_winner(move)
    move = Move.last
    type = move.type
    game = move.game
    
    moves = game.moves
    moves.select { |move| move.type === type }
    x_groups = moves.select(:pos_x).group(:pos_x).count
    y_groups = moves.select(:pos_y).group(:pos_y).count

    x_groups.values.any?(3) || y_groups.values.any?(3) || x_groups.values.all?(1)
  end
end
