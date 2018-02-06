courts = []

json.courts @games do |game|
    unless courts.include?(game.court.id)
        json.id game.court.id
        json.name game.court.name
        json.street_number game.court.street_number
        json.street_name game.court.street_name
        json.city game.court.city
        json.state game.court.state
        json.zip_code game.court.zip_code
        json.latitude game.court.latitude
        json.longitude game.court.longitude
        json.google_places_id game.court.google_places_id
    end

    courts << game.court.id
end
