class GamesController < ApplicationController
    def index
        @games = Game.all
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
