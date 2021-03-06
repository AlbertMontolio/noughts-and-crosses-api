class MovesController < ApplicationController
  def create
    pos_x = params[:posX]
    pos_y = params[:posY]
    game = Game.find(params[:game_id])

    move = Move.new(pos_x: pos_x, pos_y: pos_y)
    move.game = game
    move.user = current_user
    move.save

    response = { isWinner: move.is_winner? }
    json_response response
  end
end
