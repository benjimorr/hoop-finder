courts = []

if @games
    json.courts @games do |game|
        unless courts.include?(game.court.id)
            json.id game.court.id
            json.name game.court.name
            json.latitude game.court.latitude
            json.longitude game.court.longitude
            json.google_places_id game.court.google_places_id
        end

        courts << game.court.id
    end
end

if @game
    json.court @game.court, :id, :name, :latitude, :longitude, :google_places_id
end
