class UserGamesController < ApplicationController
    def create
        @user_game = UserGame.new(user_game_params)
        @game = Game.find(params[:game_id])

        if @game.users.count >= 10
            flash.now[:alert] = "This game is full and you cannot join."
            redirect_to @game
        elsif @user_game.save
            flash[:notice] = "You have successfully joined the game #{@game.title}."
            redirect_to @game
        else
            flash.now[:alert] = "There was an error joining the game. Please try again."
            redirect_to @game
        end
    end

    def destroy
        @user_game = UserGame.find(params[:id])
        @user = User.find(@user_game.user_id)
        @game = Game.find(@user_game.game_id)

        if @user_game.destroy
            flash[:notice] = "#{@user.first_name} #{@user.last_name} was successfully removed from the game."
            redirect_to games_path
        else
            flash.now[:alert] = "There was an error removing the player. Please try again."
            redirect_to games_path
        end
    end

    private
    def user_game_params
        params.permit(:user_id, :game_id, :creator)
    end
end
