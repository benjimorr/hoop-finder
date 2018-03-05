module GamesHelper
    def player_is_creator?(game, user)
        user.created_games.include?(game)
    end

    def player_in_game?(game_id)
        UserGame.where("user_id = ? AND game_id = ?", current_user.id, game_id).size >= 1
    end

    def get_user_game_id(user_id, game_id)
        UserGame.where("user_id = ? AND game_id = ?", user_id, game_id).first.id
    end

    def format_display_address(court)
        street_number = court.street_number == 0 ? '' : "#{court.street_number} "
        zip_code = court.zip_code.to_s.length > 4 ? court.zip_code : "0#{court.zip_code}"
        "#{street_number}#{court.street_name}, #{court.city} #{court.state}, #{zip_code}"
    end
end
