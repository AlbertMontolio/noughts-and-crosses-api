class GamePresenter
  def initialize(game)
    @game = game
  end

  def as_json
    # create method to camelize keys

    {
      id: @game.id,
      createdAt: @game.created_at,
      creator: @game.creator,
      joiner: @game.joiner
    }
  end
end
