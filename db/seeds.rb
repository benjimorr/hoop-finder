require 'faker'
require 'date'

# Create users
20.times do
    User.create!(
        email: Faker::Internet.unique.email,
        password: Faker::Internet.password,
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        username: Faker::Superhero.name,
        skill_level: [:beginner, :intermediate, :advanced, :legendary].sample
    )
end

# Create my user
my_user = User.new({email: 'benmorrison0@gmail.com', password: 'password', password_confirmation: 'password', first_name: 'Ben', last_name: 'Morrison', username: 'pogbenji', skill_level: :intermediate})
my_user.save

# Create courts
Court.create!(name: 'Gutenberg Playground', street_number: 420, street_name: 'West 49th Street', city: 'New York', state: 'NY', zip_code: '10019', latitude: 40.7634993, longitude: -73.9902132, google_places_id: 'ChIJS49RIFFYwokRftlC3ZexPP8')
Court.create!(name: 'ABC Playground', street_number: 245, street_name: 'East Houston Street', city: 'New York', state: 'NY', zip_code: '10002', latitude: 40.7218555, longitude: -73.98603899999999, google_places_id: 'ChIJSyvtzINZwokR_Ht9Q90QY_4')
Court.create!(name: 'King Towers Court', street_number: 90, street_name: 'Malcolm X Boulevard', city: 'New York', state: 'NY', zip_code: '10026', latitude: 40.799701, longitude: -73.949215, google_places_id: 'ChIJpx5TdRD2wokR2lgIvLBOXtQ')

# Create games
courts = Court.all

5.times do
    Game.create!(
        title: Faker::Lorem.sentence(2),
        date: Faker::Time.between(DateTime.now, DateTime.now + 90),
        court: courts.sample
    )
end

user_creators = User.first(4).compact
user_creators << my_user
other_users = User.last(16).compact
games = Game.all.compact

# Create game creators
5.times do
    some_creator = user_creators.sample
    some_game = games.sample
    UserGame.create!(
        user: some_creator,
        game: some_game,
        creator: true
    )

    user_creators.delete(some_creator)
    games.delete(some_game)
    # user_creators.to_a - [some_creator]
    # games.to_a - [some_game]
end

# Create other players
16.times do
    another_player = other_users.sample
    UserGame.create!(
        user: another_player,
        game: Game.order("RANDOM()").first
    )

    other_users.delete(another_player)
    # other_users.to_a - [another_player]
end

puts "Seeds finished"
puts "#{User.count} users created"
puts "#{Court.count} courts created"
puts "#{Game.count} games created"
