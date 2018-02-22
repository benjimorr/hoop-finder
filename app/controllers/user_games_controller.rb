class UserGamesController < ApplicationController
    def create
        create_user_rsvp
        find_game
        set_create_flash_notice
        redirect_to @game
    end

    def destroy
        find_user_rsvp
        find_user_and_game
        set_destroy_flash_notice
        redirect_to games_path
    end

    private

    def create_user_rsvp
        @user_game = UserGame.new(user_game_params)
    end

    def find_game
        @game = Game.find(params[:game_id])
    end

    def set_create_flash_notice
        if @game.users.count >= 10
            flash.now[:alert] = "This game is full and you cannot join."
        elsif @user_game.save
            flash[:notice] = "You have successfully joined the game #{@game.title}"
        else
            flash.now[:alert] = "There was an error joining the game. Please try again."
        end
    end

    def find_user_rsvp
        @user_game = UserGame.find(params[:id])
    end

    def find_user_and_game
        @user = User.find(@user_game.user_id)
        @game = Game.find(@user_game.game_id)
    end

    def set_destroy_flash_notice
        if @user_game.destroy
            flash[:notice] = "#{@user.first_name} #{@user.last_name} was successfully removed from the game."
        else
            flash.now[:alert] = "There was an error removing the player. Please try again."
        end
    end

    def user_game_params
        params.permit(:user_id, :game_id, :creator)
    end
end
