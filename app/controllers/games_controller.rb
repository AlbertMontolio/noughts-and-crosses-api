class GamesController < ApplicationController
  def index
    ### todo
    games = Game.all

    created_games = current_user.created_games
    joined_games = current_user.joined_games
    rest_games = Game.all - created_games - joined_games

    response = {
      createdGgames: created_games,
      joinedGames: joined_games,
      restGames: rest_games
    }

    json_response response
  end

  def create
    ### handle create false
    Game.create(creator_id: current_user.id)

    json_response :ok
  end
end
