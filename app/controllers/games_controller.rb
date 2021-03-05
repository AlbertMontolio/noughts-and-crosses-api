class GamesController < ApplicationController
  def index
    ### todo
    games = Game.all

    created_games = current_user.created_games
    joined_games = current_user.joined_games
    rest_games = Game.all - created_games - joined_games

    response = {
      createdGames: GamesPresenter.new(created_games).as_json,
      joinedGames: GamesPresenter.new(joined_games).as_json,
      restGames: GamesPresenter.new(rest_games).as_json
    }

    json_response response
  end

  def create
    ### handle create false
    Game.create(creator_id: current_user.id)

    json_response :ok
  end

  def show
    game = Game.find(params[:id])

    json_response GamePresenter.new(game).as_json
  end

  def join
    ### refactor with before_action
    game = Game.find(params[:id])
    game.update(joiner_id: current_user.id)

    json_response :ok
  end
end
