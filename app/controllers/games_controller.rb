class GamesController < ApplicationController
  def index
    games = Game.all

    json_response games
  end

  def create
  end
end
