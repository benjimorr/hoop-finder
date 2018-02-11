json.games @games do |game|
    json.id game.id
    json.title game.title
    json.date game.date

    json.court_name game.court.name

    json.user_count game.users.size

    json.in_game game.users.include?(current_user) ? true : false
    json.user_id game.users.include?(current_user) ? nil : current_user.id

    json.auth_token form_authenticity_token
end
