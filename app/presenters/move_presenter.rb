class MovePresenter
  def initialize(move)
    @move = move
  end

  def move_type
    creator_id = @move.game.creator_id
    joiner_id = @move.game.joiner_id
    if @move.user_id == creator_id
      return 'cross'
    elsif @move.user_id == joiner_id
      return 'nought'
    end
  end

  def as_json
    {
      id: @move.id,
      gameId: @move.game_id,
      posX: @move.pos_x,
      posY: @move.pos_y,
      userId: @move.user_id,
      type: move_type
    }
  end
end
