module GamesHelper
    def player_is_creator?(game)
        current_user.created_games.include?(game)
    end

    def player_in_game?(game_id)
        UserGame.where("user_id = ? AND game_id = ?", current_user.id, game_id).size >= 1
    end

    def get_user_game_id(user_id, game_id)
        UserGame.where("user_id = ? AND game_id = ?", user_id, game_id).first.id
    end
end
