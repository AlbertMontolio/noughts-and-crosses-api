class MovesPresenter
  def initialize(moves)
    @moves = moves
  end

  def as_json
    @moves.map do |move|
      MovePresenter.new(move).as_json
    end
  end
end
