class GamesController < ApplicationController
    def index
        if params[:game_filter] == 'upcoming_games'
            @games = Game.upcoming_games
            @title = "Upcoming Games"
        elsif params[:game_filter] == 'my_games'
            @games = Game.my_games(current_user)
            @title = "My Games"
        elsif params[:game_filter] == 'past_games'
            @games = Game.past_games(current_user)
            @title = "Past Games"
        else
            @games = Game.all
            @title = "Upcoming Games"
        end
    end

    def show
    end

    def new
    end

    private
    def game_params
        params.require(:game).permit(:title, :date, :court)
    end
end
