json.games @games do |game|
    json.id game.id
    json.title game.title
    json.date game.date

    json.court_name game.court.name

    json.user_count game.users.size
end
