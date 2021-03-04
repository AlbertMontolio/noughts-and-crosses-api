class GamesController < ApplicationController
  def index
    ### todo
    games = Game.all

    json_response games
  end

  def create
    ### handle create false
    Game.create(creator_id: current_user.id)

    json_response :ok
  end
end
