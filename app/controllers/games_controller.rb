class GamesController < ApplicationController
  def index
    ### todo
    games = Game.all

    json_response games
  end

  def create
    Game.create(creator: current_user)

    json_response :ok
  end
end
