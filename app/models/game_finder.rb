class GameFinder
    attr_reader :game, :court, :players, :creator

    def initialize(params)
        @game = Game.find(params[:id])
        @court = @game.court
        @players = @game.users
        @creator = @game.users.merge(UserGame.creator).first
    end
end
