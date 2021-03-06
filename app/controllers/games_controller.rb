class GamesController < ApplicationController
    def index
        find_games
        create_title
    end

    def show
        @game_finder = GameFinder.new(params)
    end

    def new
        @game = Game.new
        @court_id = params[:court_id]
    end

    def create
        @game = Game.new(game_params)
        @game.court_id = params[:court_id]

        if @game.save
            add_creator_to_game(@game.id)
            flash[:notice] = "Game was successfully created."
            redirect_to @game
        else
            flash.now[:alert] = "There was an error creating the game. Please try again."
            render :new
        end
    end

    def destroy
        @game = Game.find(params[:id])

        if @game.destroy
            flash[:notice] = "#{@game.title} was successfully deleted."
            redirect_to action: :index
        else
            flash.now[:alert] = "There was an error removing the game. Please try again."
            render :show
        end
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

    # def find_game
    #     @game = Game.find(params[:id])
    # end
    #
    # def find_court
    #     @court = @game.court
    # end
    #
    # def find_players
    #     @players = @game.users
    # end
    #
    # def find_creator
    #     @creator = @game.users.merge(UserGame.creator).first
    # end

    def add_creator_to_game(game_id)
        UserGame.create!(user_id: current_user.id, game_id: game_id, creator: true)
    end

    def game_params
        params.require(:game).permit(:title, :date)
    end
end
