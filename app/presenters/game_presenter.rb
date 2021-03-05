class GamePresenter
  def initialize(game)
    @game = game
  end

  def user_info(user)
    return unless user

    {
      id: user.id,
      twoLetters: user.email[0..1]
    }
  end

  def as_json
    # create method to camelize keys

    {
      id: @game.id,
      createdAt: @game.created_at,
      creator: user_info(@game.creator),
      joiner: user_info(@game.joiner),
      moves: MovesPresenter.new(@game.moves).as_json
    }
  end
end
