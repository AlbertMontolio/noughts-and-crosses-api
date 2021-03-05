class GamesPresenter
  def initialize(games)
    @games = games
  end

  def as_json
    games.map do |game|
      GamePresenter.new(game).as_json
    end
  end
end
