class GamesController < ApplicationController
    def index
        find_games
        create_title
    end

    def show
        find_game
        find_court
        find_players
        find_creator
    end

    def new
    end

    private
    def find_games
        case params[:game_filter]
            when 'upcoming_games'
                @games = Game.upcoming_games
            when 'my_games'
                @games = Game.my_games(current_user)
            when 'past_games'
                @games = Game.past_games(current_user)
            else
                @games = Game.upcoming_games
        end
    end

    def create_title
        case params[:game_filter]
            when 'upcoming_games'
                @title = "Upcoming Games"
            when 'my_games'
                @title = "My Games"
            when 'past_games'
                @title = "Past Games"
            else
                @title = "Upcoming Games"
        end
    end

    def find_game
        @game = Game.find(params[:id])
    end

    def find_court
        @court = @game.court
    end

    def find_players
        @players = @game.users
    end

    def find_creator
        @creator = @game.users.merge(UserGame.creator).first
    end

    def game_params
        params.require(:game).permit(:title, :date, :court)
    end
end
