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
    # check(move)

    json_response :ok
  end

  def check(move)
    move = Move.last
    game = move.game

    # return if game.moves.length < 5

    type = move.type
    moves = game.moves

    found_winner_in_straight_lines = false
    ['x', 'y'].each do |axis|
      if winner_in_straight_lines(axis, moves, type)
        found_winner_in_straight_lines = true
        break
      end
    end

    return true if found_winner_in_straight_lines

    slope_lines_are_winners(moves, type)
  end

  def slope_lines_are_winners(moves, type)
    slopes = [
      [{pos_x: -1, pos_y: -1}, {pos_x: 0, pos_y: 0}, {pos_x: 1, pos_y: 1}],
      [{pos_x: -1, pos_y: +1}, {pos_x: 0, pos_y: 0}, {pos_x: 1, pos_y: -1}]
    ]

    is_winner_found = false
    slopes.each do |points|
      matching_moves = points.map do |point| 
        moves.where(pos_x: point[:pos_x], pos_y: point[:pos_y]).first
      end
      
      matching_moves = matching_moves.compact
      next if matching_moves.length < 3

      if matching_moves.all? { |move| move.type == type }
        is_winner_found = true
        break
      end
    end

    is_winner_found
  end

  def winner_in_straight_lines(axis, moves, type)
    options = [-1, 0, 1]
    results = options.map do |option|
      matching_moves = moves.where("pos_#{axis}": option)
      matching_moves.all? { |move| move.type == type } && matching_moves.length === 3
    end 

    results.any? { |result| result }
  end
end
